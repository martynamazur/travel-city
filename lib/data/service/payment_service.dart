import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/model/otp_result.dart';

import '../repository/payment_repository_impl.dart';

class PaymentService {
  final PaymentRepository repository;

  PaymentService(this.repository);

  Future<Result> handleGooglePayResult(Map<String, dynamic> paymentResult) async {
    try {
      final paymentMethodData = paymentResult['paymentMethodData'];
      final token = paymentMethodData['tokenizationData']['token'];
      final name = paymentMethodData['info']['billingAddress']['name'];
      //final email = paymentMethodData['info']['billingAddress']['emailAddress'];
      //TODO: znalezc inf co jest zwracane w srodowisku produkcyjnym
      final tokenBase64 = base64Encode(utf8.encode(token));

      return await repository.sendGooglePayToken(tokenBase64, name, 'email');
      //wysylam do backendu i sie tam on tym zajmuje ale jako
    } catch (e) {
      return Result.failure('Błąd podczas przetwarzania danych Google Pay: $e');
    }
  }
}
