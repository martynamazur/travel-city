import 'package:drift/drift.dart';
import 'package:ticketapp/data/service/database/app_database.dart'; // Import your AppDatabase
import 'package:ticketapp/data/service/database/tables/tickets.dart';

import '../../model/ticket_model.dart';

class TicketDbRepository {
  final AppDatabase _db;

  TicketDbRepository(this._db);

  // Add a new ticket to the database
  Future<int> addTicket(TicketsCompanion ticket) {
    return _db.insertTicket(ticket);
  }

  // Fetch all tickets
  Future<List<Ticket>> fetchAllTickets() {
    return _db.getAllTickets();
  }

  // Increment the bought count of a ticket :)
  Future<void> incrementTicketBuyCount(int ticketId) {
    return _db.incrementBuyCount(ticketId);
  }



  Future<void> upsertTicket(int ticketId) async {
    // Sprawdź czy istnieje
    final existing = await _db.getTicketById(ticketId); // dodamy zaraz tę metodę

    if (existing != null) {
      // już istnieje -> zwiększ licznik
      await _db.incrementBuyCount(ticketId);
    } else {
      // nie istnieje -> dodaj nowy
      await _db.insertTicket(
        TicketsCompanion(
          id: Value(ticketId),
          boughtCount: Value(1),
        ),
      );
    }
  }

}
