
import 'package:ticketapp/data/service/tpay/model/blik_payment_data_model.dart';
import 'package:ticketapp/data/service/tpay/model/token_payment_data.dart';


import 'callback_model.dart';
import 'card_payment_data_model.dart';


enum Method{
  pay_by_link, transfer, sale
}

enum CofOption{
  unscheduled, cardholder_initiated, recurring
}

class Pay{

  final int groupId;
  final Method? method;
  final BlikPaymentData? blikPaymentData;
  final CardPaymentData? cardPaymentData;
  final TokenPaymentData? tokenPaymentData;
  final CofOption? cof;
  final String? applePayPaymentData;




  Pay({this.method, this.blikPaymentData, this.cardPaymentData,
    this.tokenPaymentData, this.cof, this.applePayPaymentData, required this.groupId});

}