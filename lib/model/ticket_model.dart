import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_model.freezed.dart';
part 'ticket_model.g.dart';

/*
 Statyczny model biletu z bazy danych
 */
@freezed
abstract class TicketM with _$TicketM {
  const factory TicketM({
    required int id,
    @JsonKey(name:'city_id') required int cityId,
    @JsonKey(name:'vehicle_type_id') required int vehicleTypeId,
    @JsonKey(name:'variant_id') required int variantId,
    required String name,
    required minutes,
    required double price,

  }) = _Ticket;



  factory TicketM.fromJson(Map<String, dynamic> json) =>
      _$TicketFromJson(json);


  factory TicketM.empty() => const TicketM(
      id: 0,
      cityId: 0,
      vehicleTypeId: 0,
      variantId: 0,
      name: 'name',
      minutes: 0,
      price: 0
  );


}