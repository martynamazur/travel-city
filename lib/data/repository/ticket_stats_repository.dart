import 'package:drift/drift.dart';
import 'package:ticketapp/data/service/database/app_database.dart'; // Import your AppDatabase
import 'package:ticketapp/data/service/database/tables/tickets.dart';
import 'package:ticketapp/model/activated_ticket_model.dart';

import '../../model/ticket_model.dart';

class TicketDbRepository {
  final AppDatabase _db;

  TicketDbRepository(this._db);


  Future<int> addActivatedTicket(ActivatedTicketAppModel newTicket) {
    return _db.into(_db.activatedTickets).insert(newTicket.toCompanion());
  }


  Future<List<ActivatedTicket>> getActiveTickets(){
    return _db.getActiveTickets();
  }

  Stream<List<ActivatedTicket>> watchActiveTickets(){
    return _db.watchActiveTickets();
  }

  Stream<List<ActivatedTicket>> watchExpiredTickets(){
    return _db.watchExpiredTickets();
  }

  //TODO : usunac
  Future<int> addTicket(TicketsCompanion ticket) {
    return _db.insertTicket(ticket);
  }

  Future<List<Ticket>> fetchAllTickets() {
    return _db.getAllTickets();
  }

  Future<void> incrementTicketBuyCount(int ticketId) {
    return _db.incrementBuyCount(ticketId);
  }

  Future<void> upsertTicket(int ticketId) async {

    final existing = await _db.getTicketById(ticketId);

    if (existing != null) {
      await _db.incrementBuyCount(ticketId);
    } else {
      await _db.insertTicket(
        TicketsCompanion(
          id: Value(ticketId),
          boughtCount: Value(1),
        ),
      );
    }
  }

}
