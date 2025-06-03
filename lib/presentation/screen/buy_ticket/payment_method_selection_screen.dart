import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/l10n/app_localizations.dart';

import '../../../data/provider/ticket_provider.dart';
import '../../../model/payment_method.dart';



class PaymentMethodSelectionScreen extends ConsumerStatefulWidget {
  const PaymentMethodSelectionScreen({super.key});

  @override
  ConsumerState createState() => _PaymentMethodSelectionScreenState();
}

class _PaymentMethodSelectionScreenState
    extends ConsumerState<PaymentMethodSelectionScreen> {
  


  final List<PaymentMethod> _paymentMethod = [
    PaymentMethod('assets/Blik_logo.jpg', 'blik', null),
    PaymentMethod('assets/GPay_Acceptance_Mark_800.png', 'Google Pay', null)
  ];

  late final AppLocalizations _loc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }
  
  @override
  Widget build(BuildContext context) {
    final selectedPaymentMethod =  ref.watch(chosenPaymentMethodProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(_loc.choosePaymentOption),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: _paymentMethod.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                final paymentMethod = _paymentMethod[index];
                return RadioListTile(
                    title: Text(paymentMethod.name),
                    value: paymentMethod,
                    groupValue: selectedPaymentMethod,
                    onChanged: (PaymentMethod? selected){
                      ref.read(chosenPaymentMethodProvider.notifier).state = selected!;
                    }
                );
              }
          )
      ),
    );
  }
}
