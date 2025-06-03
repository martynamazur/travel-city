
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pay/pay.dart';
import 'package:ticketapp/helper/payment_result_handler.dart';
import 'package:ticketapp/model/princing_inf.dart';
import 'package:ticketapp/presentation/widget/google_pay_section.dart';
import 'package:ticketapp/presentation/widget/or_divider.dart';
import 'package:ticketapp/presentation/widget/payment_method_tile.dart';

import '../data/provider/payment_provider.dart';
import '../data/provider/ticket_provider.dart';
import '../data/provider/transaction_status.dart';
import '../data/service/tpay/model/blik_payment_data_model.dart';
import '../data/service/tpay/model/callback_model.dart';
import '../data/service/tpay/model/notification_callback_model.dart';
import '../data/service/tpay/model/pay_model.dart' as tpay;
import '../data/service/tpay/model/payer_model.dart';
import '../data/service/tpay/model/transaction_model.dart';
import '../data/service/tpay/tpay_auth_client.dart';
import '../data/service/tpay/tpay_client.dart';
import '../l10n/app_localizations.dart';
import '../model/ticket_model.dart';

class PaymentPicker extends ConsumerStatefulWidget {
  final TicketM ticket;
  final PricingInf pricingInf;

  PaymentPicker(this.ticket, this.pricingInf, {super.key});

  @override
  ConsumerState<PaymentPicker> createState() => _PaymentPikerState();
}

class _PaymentPikerState extends ConsumerState<PaymentPicker> {
  final textInputController = TextEditingController();

  late final String _clientId;
  late final String _clientSecret;
  late final String _transactionApiKey;
  late final String _transactionApiPassword;
  late final String _callbackUrl;

  late final TpayClient _tpayClient;

  late Future<PaymentConfiguration> _googlePayConfig;

  late final AppLocalizations _loc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }

  @override
  void initState(){
    super.initState();

    _googlePayConfig = loadGooglePayConfig();

    _callbackUrl = dotenv.env['CALLBACK_URL_BACKEND']!;
    _clientId = dotenv.env['CLIENTID']!;
    _clientSecret = dotenv.env['SECRET']!;
    _transactionApiKey = dotenv.env['API_KEY_TRANSACTION']!;
    _transactionApiPassword = dotenv.env['API_KEY_TRANSACTION_PASSWORD']!;

    final tpayAuthClient = TpayAuthClient(_clientId, _clientSecret);
    _tpayClient = TpayClient(tpayAuthClient, apiKey: _transactionApiKey, apiPassword: _transactionApiPassword);
  }

  @override
  Widget build(BuildContext context) {
    final ticket = widget.ticket;
    final selectedPaymentMethod =  ref.watch(chosenPaymentMethodProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(_loc.payment),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                spacing: 16.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_loc.paymentOptions, style: const TextStyle(fontSize: 18.0)),
                  const SizedBox(height: 16.0),
                  PaymentMethodTile(paymentMethod: selectedPaymentMethod),
                  _buildBlikCodeInput(ticket),
                  const OrDivider(),
                  _buildGooglePayButton()
                ],
              ),
            ),
          )
      ),
    );
  }

  Widget _buildGooglePayButton() {
    return FutureBuilder<PaymentConfiguration>(
      future: _googlePayConfig,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text('Błąd ładowania konfiguracji Google Pay');
        }

        final config = snapshot.data;

        if (config == null) {
          return const Text('Brak danych konfiguracyjnych Google Pay');
        }

        return GooglePaySection(
            configuration: config,
            totalPrice: widget.pricingInf.totalPrice,
            onResult: onGooglePayResult
        );
      },
    );
  }

  Future<void> onGooglePayResult(paymentResult) async {
    final service = ref.read(paymentServiceProvider);
    final result = await service.handleGooglePayResult(paymentResult);

    PaymentResultHandler.handleResult(
        context: context,
        result: result,
        ticket: widget.ticket,
        pricingInf: widget.pricingInf
    );
  }


  Widget _buildBlikCodeInput(TicketM ticket){
    return Column(
      children: [
        TextFormField(
          controller: textInputController,
          decoration: InputDecoration(
              labelText: _loc.enterBlikCode,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE0E0E0)
                )
              ),
              suffixIcon: IconButton(
                  icon: const Icon(Icons.paste),
                  onPressed: (){
                    Clipboard.getData(Clipboard.kTextPlain).then((value) {
                      if (value != null) {
                        textInputController.text = value.text ?? '';
                      }
                    });
                  },
              ),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () async {
              final transaction = Transaction(
                amount: (ticket.price * widget.pricingInf.ticketAmount).toStringAsFixed(2),
                description: 'Zakup biletu: ${ticket.name}',
                //TODO: spr czy zamiast emailu moze byc nr telefonu
                payer: Payer(email: 'jan.nowak@example.com', name: 'Jan Nowak'),
                pay: tpay.Pay(
                  groupId: 150,
                  blikPaymentData: BlikPaymentData(
                    blikToken: textInputController.text.trim(),
                  ),
                ),
                callback: Callback(
                  notificationCallback: NotificationCallback(
                    url: _callbackUrl,
                  ),
                ),
              );
              final messenger = ScaffoldMessenger.of(context);
              try{
                final transactionId = await _tpayClient.createTransaction(transaction);
                _showTransactionStatus(transactionId!);
              }catch (e) {
                  messenger.showSnackBar(
                  SnackBar(content: Text('Błąd podczas tworzenia transakcji')));
              }
            },
            child: const Text('Pay'),
          ),
        )
      ],
    );
  }


  Future<void> _showTransactionStatus(String transactionId) async {
    Future.microtask(() {
      ref.read(transactionStatusProvider.notifier).startPolling(transactionId);
    });

    await showDialog(
      context: context,
      builder: (context) {
        final status = ref.watch(transactionStatusProvider);

        return AlertDialog(
          title: Text(_loc.transactionStatus),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Transakcja ID: $transactionId'),
              const SizedBox(height: 16),
              /*
              Text('Status: ${status.statusText}'),
              if (status.isSuccess) const Icon(Icons.check_circle, color: Colors.green),
              if (status.isFailed) const Icon(Icons.error, color: Colors.red),
              if (status.isPending) const CircularProgressIndicator(),

               */
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => {
                  Navigator.of(context).pop()
              },
              child: const Text('Narazie ok aby mnie przekierowalo'),
            ),
          ],
        );
      },
    );
  }

  Future<PaymentConfiguration> loadGooglePayConfig() async {
    final config = await rootBundle.loadString('assets/google_pay_config.json');
    return PaymentConfiguration.fromJsonString(config);
  }
}
