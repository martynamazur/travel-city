import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/presentation/widget/counter.dart';

import '../../data/provider/transaction_status.dart';
import '../../data/service/tpay/model/blik_payment_data_model.dart';
import '../../data/service/tpay/model/callback_model.dart';
import '../../data/service/tpay/model/notification_callback_model.dart';
import '../../data/service/tpay/model/pay_model.dart';
import '../../data/service/tpay/model/payer_model.dart';
import '../../data/service/tpay/model/transaction_model.dart';
import '../../data/service/tpay/tpay_auth_client.dart';
import '../../data/service/tpay/tpay_client.dart';
import '../../model/payment_method.dart';
import '../../model/ticket_model.dart';

class PaymentPiker extends ConsumerStatefulWidget {
  final TicketM ticket;

  const PaymentPiker({super.key, required this.ticket});

  @override
  ConsumerState<PaymentPiker> createState() => _PaymentPikerState();
}

class _PaymentPikerState extends ConsumerState<PaymentPiker> {
  final textInputController = TextEditingController();
  int _selectedAmount = 1;

  late final String clientId;
  late final String clientSecret;
  late final String transactionApiKey;
  late final String transactionApiPassword;

  late final TpayClient tpayClient;

  final List<PaymentMethod> _paymentMethod = [
    PaymentMethod('assets/Blik_logo.jpg', 'blik', null)
  ];

  @override
  void initState() {
    super.initState();

    clientId = dotenv.env['CLIENTID']!;
    clientSecret = dotenv.env['SECRET']!;
    transactionApiKey = dotenv.env['API_KEY_TRANSACTION']!;
    transactionApiPassword = dotenv.env['API_KEY_TRANSACTION_PASSWORD']!;

    final tpayAuthClient = TpayAuthClient(clientId, clientSecret);
    tpayClient = TpayClient(tpayAuthClient, apiKey: transactionApiKey, apiPassword: transactionApiPassword);
  }

  @override
  Widget build(BuildContext context) {
    final ticket = widget.ticket;
    final totalPrice = ticket.price * _selectedAmount;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ticket.name, style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
          Counter(
            onChanged: (value) {
              setState(() {
                _selectedAmount = value;
              });
            },
          ),
          const SizedBox(height: 16.0),
          Text('Price for $_selectedAmount ${_selectedAmount == 1 ? 'ticket' : 'tickets'}: ${totalPrice.toStringAsFixed(2)} zł'),
          const SizedBox(height: 32.0),
          const Divider(),
          const Text('Payment options'),
          const SizedBox(height: 32.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87, width: 1),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _paymentMethod.length,
              itemBuilder: (context, index) {
                var method = _paymentMethod[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 40, width: 60, child: Image.asset(method.imagePath, fit: BoxFit.contain)),
                    Column(
                      children: [
                        Text(method.name),
                        if (method.additionalInformation != null) Text(method.additionalInformation!),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: textInputController,
            decoration: const InputDecoration(labelText: "Enter BLIK code"),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () async {
              final transaction = Transaction(
                amount: (ticket.price * _selectedAmount).toStringAsFixed(2),
                description: 'Zakup biletu: ${ticket.name}',
                payer: Payer(email: 'jan.nowak@example.com', name: 'Jan Nowak'),
                pay: Pay(
                  groupId: 150,
                  blikPaymentData: BlikPaymentData(
                    blikToken: textInputController.text.trim(),
                  ),
                ),
                callback: Callback(
                  notificationCallback: NotificationCallback(
                    url: "https://ticket-app-render.onrender.com/callback",
                  ),
                ),
              );

              final transactionId = await tpayClient.createTransaction(transaction);
              if (mounted) {
                _showTransactionStatus(transactionId!);
              }
            },
            child: const Text('Pay'),
          )
        ],
      ),
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
          title: const Text('Status transakcji'),
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
              child: const Text('Narazie ok aby mnie przepierowalo'),
            ),
          ],
        );
      },
    );
  }
}
