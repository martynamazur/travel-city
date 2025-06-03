import 'dart:io';


import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:ticketapp/data/service/database/tables/active_ticket.dart';
import 'package:ticketapp/data/service/database/tables/ticket_info.dart';
import 'package:ticketapp/data/service/database/tables/tickets.dart';
import 'package:ticketapp/model/activated_ticket_model.dart';

import '../../../model/ticket_model.dart';
part 'app_database.g.dart';

@DriftDatabase(tables:[Tickets, TicketInfo, ActivatedTickets])
class AppDatabase extends _$AppDatabase{
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;


  Future<int> insertActivatedTicket({
    required int ticketId,
    required String vehicleNumber,
    DateTime? activatedAt,
    DateTime? expiresAt,
    required String transactionId,
    required int amount,
    required double totalPrice,
    String? token,
  }) {
    return into(activatedTickets).insert(ActivatedTicketsCompanion(
      ticketId: Value(ticketId),
      vehicleNumber: Value(vehicleNumber),
      activatedAt: Value(activatedAt),
      expiresAt: Value(expiresAt),
      transactionId: Value(transactionId),
      amount: Value(amount),
      totalPrice: Value(totalPrice),
      token: Value(token),
    ));
  }

  Future<List<ActivatedTicket>> getActiveTickets() {
    final now = DateTime.now();
    return (select(activatedTickets)
      ..where((t) =>
      t.activatedAt.isNotNull() & t.expiresAt.isBiggerThanValue(now)))
        .get();
  }

  Stream<List<ActivatedTicket>> watchActiveTickets() {
    final now = DateTime.now();
    return (select(activatedTickets)
      ..where((t) =>
      t.activatedAt.isNotNull() & t.expiresAt.isBiggerThanValue(now)))
        .watch();
  }

  Stream<List<ActivatedTicket>> watchExpiredTickets() {
    final now = DateTime.now();
    return (select(activatedTickets)
      ..where((t) =>
      t.activatedAt.isNotNull() & t.expiresAt.isSmallerOrEqualValue(now)))
        .watch();
  }


  Future<void> insertOrUpdateTicket(TicketInfoCompanion ticket) async {
    await into(ticketInfo).insertOnConflictUpdate(ticket);
  }


  Future<List<ActivatedTicket>> getAllActivatedTickets(){
    return select(activatedTickets).get();
  }

  Future<int> insertTicket(TicketsCompanion ticket) => into(tickets).insert(ticket);

  Future<List<Ticket>> getAllTickets() => select(tickets).get();

  Future<void> incrementBuyCount(int ticketId) async {
    final ticket = await (select(tickets)..where((t) => t.id.equals(ticketId))).getSingle();
    await update(tickets).replace(ticket.copyWith(boughtCount: ticket.boughtCount + 1));
  }

  Future<Ticket?> getTicketById(int ticketId) {
    return (select(tickets)..where((t) => t.id.equals(ticketId))).getSingleOrNull();
  }


}
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'app.db'));
    return NativeDatabase(file);
  });

}
