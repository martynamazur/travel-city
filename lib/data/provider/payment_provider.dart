import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/payment_repository_impl.dart';
import '../service/payment_service.dart';

part 'payment_provider.g.dart';
@riverpod
Dio dio (Ref ref) {
  return Dio();
}

@riverpod
PaymentRepository paymentRepositoryImpl(Ref ref) {
  final client =  http.Client();
  return PaymentRepository(client);
}

@riverpod
PaymentService paymentService(Ref ref) {
  final repo = ref.read(paymentRepositoryImplProvider);
  return PaymentService(repo);
}


