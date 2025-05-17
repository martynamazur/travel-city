import 'package:flutter/cupertino.dart';

import 'package:ticketapp/data/service/tpay/model/payer_url_model.dart';

import 'notification_callback_model.dart';

class Callback{
  final PayerUrl? payerUrl;
  final NotificationCallback? notificationCallback;

  Callback({this.payerUrl, this.notificationCallback});
}