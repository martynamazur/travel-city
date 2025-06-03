import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketapp/data/service/database/app_database.dart';
import 'package:ticketapp/model/activated_ticket_model.dart';

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


@riverpod
Future<int> addActivatedTicket(Ref ref, ActivatedTicketAppModel activatedTicket) async {
  return ref.read(ticketDbRepositoryProvider).addActivatedTicket(activatedTicket);
}


@riverpod
Future<List<ActivatedTicket>> getActiveTickets(Ref ref) async {
  return ref.read(ticketDbRepositoryProvider).getActiveTickets();
}

@riverpod
Stream<List<ActivatedTicket>> watchActiveTickets(Ref ref){
  return ref.read(ticketDbRepositoryProvider).watchActiveTickets();
}

@riverpod
Stream<List<ActivatedTicket>> watchExpiredTickets(Ref ref){
  return ref.read(ticketDbRepositoryProvider).watchExpiredTickets();
}


