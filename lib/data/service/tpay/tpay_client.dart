
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ticketapp/data/service/tpay/model/transaction_model.dart';
import 'package:ticketapp/data/service/tpay/tpay_auth_client.dart';

class TpayClient{

  final String apiKey;
  final String apiPassword;
  final Dio _dio = Dio();
  final TpayAuthClient authClient;



  TpayClient(
    this.authClient, {
    required this.apiKey,
    required this.apiPassword,
  });


  Future<String?> createTransaction(Transaction transaction) async{
    final accessToken = await authClient.getAccessToken();
    final Map<String, dynamic> data = makeData(transaction);

    try {
      final response = await _dio.post(
        'https://openapi.sandbox.tpay.com/transactions',
        data: data,
        options: Options(
          headers: {
            'X-API-KEY': apiKey,
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
      );

      return response.data['transactionId'];

    } on DioException catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print('Błąd API: ${e.response?.statusCode} - ${e.response?.data}');
        }
      } else {
        if (kDebugMode) {
          print('Błąd połączenia: ${e.message}');
        }
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Nieznany błąd: $e');
      }
      return null;
    }
  }

  //TODO: przeniesc ?
  Map<String,dynamic> makeData(Transaction transaction){
    return {
      "amount": transaction.amount,
      "description": transaction.description,
      "payer": {
        "email": transaction.payer.email,
        "name":  transaction.payer.name
      },
      "pay": {
        "groupId": transaction.pay!.groupId,
        "blikPaymentData": {
          "blikToken": transaction.pay!.blikPaymentData!.blikToken
        }
      },
      "callbacks": {
        "notification": {
          "url": transaction.callback!.notificationCallback!.url

        }}
    };

  }
}