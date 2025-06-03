import 'package:drift/drift.dart';
import 'package:ticketapp/data/service/database/tables/ticket_info.dart';

class ActivatedTickets extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get ticketId => integer().references(TicketInfo, #id)();
  TextColumn get vehicleNumber => text()();

  DateTimeColumn get activatedAt => dateTime().nullable()();
  DateTimeColumn get expiresAt => dateTime().nullable()();

  TextColumn get transactionId => text()();
  IntColumn get amount => integer()();
  RealColumn get totalPrice => real()();

  TextColumn get token => text().nullable()();
}
