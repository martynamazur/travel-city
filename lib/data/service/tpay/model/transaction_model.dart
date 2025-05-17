

import 'package:ticketapp/data/service/tpay/model/pay_model.dart';
import 'package:ticketapp/data/service/tpay/model/payer_model.dart';

import 'callback_model.dart';



class Transaction{
  final String amount;//
  final String description;//
  final Payer payer;//
  final Pay? pay;
  final Callback? callback;

  Transaction({required this.amount,required  this.description,
    required this.payer, this.pay, this.callback});


}