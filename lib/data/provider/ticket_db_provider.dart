import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketapp/data/service/database/app_database.dart';

import '../repository/ticket_stats_repository.dart';


part 'ticket_db_provider.g.dart';

@Riverpod(keepAlive:true)
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}

@riverpod
TicketDbRepository ticketDbRepository(Ref ref) {
  final appDb = ref.read(appDatabaseProvider);
  return TicketDbRepository(appDb);
}

@riverpod
Future<Ticket?> mostBoughtTicket(Ref ref) async {
  final repo = ref.read(ticketDbRepositoryProvider);
  final allTickets = await repo.fetchAllTickets();

  if (allTickets.isEmpty) {
    return null;
  }

  allTickets.sort((a, b) => b.boughtCount.compareTo(a.boughtCount));
  return allTickets.first;
}

