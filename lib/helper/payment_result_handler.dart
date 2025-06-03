import 'package:flutter/material.dart';

import '../model/otp_result.dart';
import '../model/princing_inf.dart';
import '../model/ticket_model.dart';
import '../presentation/screen/activate_ticket_screen.dart';

class PaymentResultHandler {
  static void handleResult({
    required BuildContext context,
    required Result result,
    required TicketM ticket,
    required PricingInf pricingInf
  }) {
    String message = 'Wystąpił nieznany błąd podczas przetwarzania płatności.';

    if (result.success) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => ActivateTicketScreen(ticket, pricingInf)),
            (route) => route.settings.name == '/dashboard',
      );
    } else {
      if (result.errorMessage != null) {
        if (result.errorMessage!.contains('pending')) {
          message = '⏳ Płatność oczekuje na autoryzację.';
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => ActivateTicketScreen(ticket,pricingInf)),
          );
        } else if (result.errorMessage!.contains('rejected')) {
          message = '❌ Płatność została odrzucona.';
        } else if (result.errorMessage!.contains('cancelled')) {
          message = 'ℹ️ Płatność została anulowana.';
        } else if (result.errorMessage!.contains('network')) {
          message = '📡 Błąd sieci.';
        } else {
          message = result.errorMessage!;
        }
      }

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Błąd płatności'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
