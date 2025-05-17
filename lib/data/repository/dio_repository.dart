
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as ref;

import '../provider/transaction_status.dart';

class DioRepository {
  final Dio _dio;
  late final String apiKey;
  late final String clientId;
  late final String clientSecret;


  DioRepository({
    Dio? dio
  }) : _dio = dio ?? Dio(BaseOptions(
    //baseUrl: 'https://openapi.sandbox.tpay.com',
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  Future<Response?> oAuth() async {
    final clientId = dotenv.env['CLIENTID'];
    final clientSecret = dotenv.env['SECRET'];

    final dio = Dio(
      BaseOptions(
        headers: {
          //'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );

    try {
      final response = await dio.post(
        'https://openapi.sandbox.tpay.com/oauth/auth',
        data: {
          'client_id': clientId,
          'client_secret': clientSecret,
          'grant_type': 'client_credentials',
        },
      );

      return response;
    } on DioException catch (e) {
      print('DioException: ${e.response?.statusCode} -> ${e.response?.data}');
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<void> makePayment(String blikCode)async {
    final transactionId = await createTransaction(blikCode);
    //spr czy

  }

  Future<String?> createTransaction(String blikCode) async {
    const apikey = 'e6d3f082d268db46b88c632b072b846ee2c7293b'; //to przeniesc
    final responseToken = await oAuth();
    print(responseToken);

    if (responseToken == null) {
      print('Błąd: Nie udało się uzyskać tokenu');
      return null;
    }
    final accessToken = responseToken.data['access_token'];
    print(accessToken);


    final Map<String, dynamic> data2 = {
      "amount": 0.1,
      "description": "Testowa płatność BLIK",
      "payer": {
        "email": "jan.nowak@example.com",
        "name": "Jan Nowak"
      },
      "pay": {
        "groupId": 150,
        "blikPaymentData": {
          "blikToken": blikCode
        }
      },
      "callbacks": {
      "notification": {
      "url": "https://ticket-app-render.onrender.com/callback"

    }}
    };

    try {
      final response = await _dio.post(
        'https://openapi.sandbox.tpay.com/transactions',
        data: data2,
        options: Options(
        headers: {
          'X-API-KEY': apikey,
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      ),
      );

      print(response.data);
      return response.data['transactionId'];

    } on DioException catch (e) {
      if (e.response != null) {
        print('Błąd API: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Błąd połączenia: ${e.message}');
      }
    } catch (e) {
      print('Nieznany błąd: $e');
    }
    return null;
  }

}
