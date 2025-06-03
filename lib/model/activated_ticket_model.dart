import 'package:drift/drift.dart';
import 'package:ticketapp/model/ticket_model.dart';

import '../data/service/database/app_database.dart';

/*
   Powstaje po opłaceniu biletu,
 */
class ActivatedTicketAppModel {
  final TicketM baseTicket;
  final String vehicleNumber;

  final DateTime? activatedAt;
  final DateTime? expiresAt;

  final String transactionId;
  final int amount;
  final double totalPrice;

  final String? token;


  ActivatedTicketAppModel({
    required this.baseTicket,
    required this.vehicleNumber,
    required this.transactionId,
    required this.amount,
    required this.totalPrice,
    required this.activatedAt,
    required this.expiresAt,
    required this.token
  });


  ActivatedTicketsCompanion toCompanion() {
    return ActivatedTicketsCompanion(
      ticketId: Value(baseTicket.id),
      vehicleNumber: Value(vehicleNumber),
      activatedAt: Value(activatedAt),
      expiresAt: Value(expiresAt),
      transactionId: Value(transactionId),
      amount: Value(amount),
      totalPrice: Value(totalPrice),
      token: Value(token),
    );
  }

  factory ActivatedTicketAppModel.fromDb(ActivatedTicket dbModel, TicketM baseTicket) {
    return ActivatedTicketAppModel(
      baseTicket: baseTicket,
      vehicleNumber: dbModel.vehicleNumber,
      transactionId: dbModel.transactionId,
      amount: dbModel.amount,
      totalPrice: dbModel.totalPrice,
      activatedAt: dbModel.activatedAt,
      expiresAt: dbModel.expiresAt,
      token: dbModel.token,
    );
  }



}


