import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketapp/data/repository/dio_repository.dart';
import 'package:ticketapp/data/repository/payment_repository.dart';
import 'package:ticketapp/main.dart';

part 'dio_provider.g.dart';
@riverpod
Dio dio (Ref ref) {
  return Dio();
}

@riverpod
DioRepository dioRepository(Ref ref) {

  return DioRepository(
      dio: ref.watch(dioProvider),
  );
}


@riverpod
Future<String?> createTransaction(Ref ref, {required String blikCode}) async {
  return ref.read(dioRepositoryProvider).createTransaction(blikCode);
}

/*
@riverpod
PaymentRepository paymentRepository (Ref ref){
  return PaymentRepository() ;
}
 */


