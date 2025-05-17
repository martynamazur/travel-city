import 'dart:io';


import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:ticketapp/data/service/database/tables/tickets.dart';

import '../../../model/ticket_model.dart';
part 'app_database.g.dart';

//Handling just db logic
@DriftDatabase(tables:[Tickets])
class AppDatabase extends _$AppDatabase{
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

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
