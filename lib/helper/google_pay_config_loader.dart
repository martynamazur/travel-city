import 'package:flutter/services.dart';
import 'package:pay/pay.dart';

Future<PaymentConfiguration> loadGooglePayConfig() async {
  final configJson = await rootBundle.loadString('assets/gpay.json');
  return PaymentConfiguration.fromJsonString(configJson);
}
