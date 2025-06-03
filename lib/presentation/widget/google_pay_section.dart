import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class GooglePaySection extends StatelessWidget {
  final PaymentConfiguration configuration;
  final double totalPrice;
  final void Function(dynamic result) onResult;

  const GooglePaySection({
    required this.configuration,
    required this.totalPrice,
    required this.onResult,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final paymentItems = [
      PaymentItem(
        label: 'Do zapłaty',
        amount: totalPrice.toString(),
        status: PaymentItemStatus.final_price,
      ),
    ];
    developer.log('Ile do zapaty $totalPrice');

    return SizedBox(
      width: double.infinity,
      child: GooglePayButton(
        paymentConfiguration: configuration,
        paymentItems: paymentItems,
        type: GooglePayButtonType.buy,
        theme: GooglePayButtonTheme.light,
        margin: const EdgeInsets.only(top: 15.0),
        onPaymentResult: onResult,
        loadingIndicator: const Center(child: CircularProgressIndicator()),
        onError: (error){
          developer.log('Błąd Google Pay: $error');
        },
      ),
    );
  }
}
