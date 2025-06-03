import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:ticketapp/model/otp_result.dart';


class PaymentRepository{
  final http.Client _client;

  PaymentRepository(this._client);

  Future<Result> sendGooglePayToken(String base64Token, String payerName, String emailAddress) async {
    try{
      final response = await _client.post(
          Uri.parse("https://ticket-app-render.onrender.com/payments/googlepay"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
              {
                "encodedToken": base64Token,
                "amount": '4.00',
                "description": "Testowa transakcja google pay",

                "email": "jan.nowak@example.com",
                "name": "Jan Nowak"
              }));

      if (response.statusCode == 200) {
        print('✅ Sukces: ${response.body}');
        final json = jsonDecode(response.body); // tu mam  "transactionId":"ta_9NmLeGvbPwQGbEP4",
        if (json['tpayData']['status'] == 'correct') {
          return Result.success();
        }else{
          final status = json['tpayData']['status'];
          developer.log('ℹ️ Status transakcji: $status');
          return Result.failure('Transakcja nie została jeszcze zatwierdzona (status: $status)');
        }

      } else {
        developer.log('❌ Błąd backendu: ${response.statusCode}');
        return Result.failure('Błąd serwera: ${response.statusCode}');
      }

    }catch(e){
      return Result.failure('Wystąpił błąd: $e');
    }


  }
}
