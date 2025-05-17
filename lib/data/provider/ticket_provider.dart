import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketapp/data/provider/ticket_db_provider.dart';
import 'package:ticketapp/data/provider/ticket_provider.dart';
import 'package:ticketapp/data/repository/ticket_repository.dart';

import '../../model/city.dart';
import '../../model/ticket_model.dart';
import '../../model/ticket_user.dart';
import '../../model/ticket_variant.dart';
import '../../model/vehicle_type.dart';


part 'ticket_provider.g.dart';

final selectedCityProvider = StateProvider<City?>((ref) => null);

@riverpod
TicketRepository ticketRepository(Ref ref) {
  return TicketRepository();
}

@riverpod
Future<TicketM?> getTicket(Ref ref, {required ticketId}) async {
  return ref.read(ticketRepositoryProvider).getTicket(ticketId);
}

@riverpod
Future<List<TicketM>> getAvailableTickets(Ref ref, {required int cityId}) async {
  return ref.read(ticketRepositoryProvider).getAvailableTickets(cityId) ;
}



@riverpod
Future<List<City>> getCityList(Ref ref) async {
  return ref.read(ticketRepositoryProvider).getCityList();
}

@riverpod
Future<List<VehicleType>> getVehicleList(Ref ref, {required int cityId}) async {
  return ref.read(ticketRepositoryProvider).getVehicleList(cityId);
}

@riverpod
Future<List<TicketVariant>> getTicketVariants(Ref ref, {required int cityId,}) async {
  return ref.read(ticketRepositoryProvider).getTicketVariants(cityId) ;
}

@riverpod
Future<List<UserTicket>> getUserTickets(Ref ref) async {
  return ref.read(ticketRepositoryProvider).getUserTickets();
}

@riverpod
Future<List<TicketM>> getUserMostBoughTickets(Ref ref) async {
  final localRepo = ref.read(ticketDbRepositoryProvider);
  final supabaseRepo = ref.read(ticketRepositoryProvider);

  final localTickets = await localRepo.fetchAllTickets();
  final ids = localTickets.map((e) => e.id).toList();

  if (ids.isEmpty) return [];
  final fullTickets = await supabaseRepo.getUserMostBoughTickets(ids);
  return fullTickets;
}