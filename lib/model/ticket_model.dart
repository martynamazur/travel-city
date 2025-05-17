import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_model.freezed.dart';
part 'ticket_model.g.dart';

@freezed
abstract class TicketM with _$TicketM {
  const factory TicketM({
    required int id,
    @JsonKey(name:'city_id') required int cityId,
    @JsonKey(name:'vehicle_type_id') required int vehicleTypeId,
    @JsonKey(name:'variant_id') required int variantId,
    required String name,
    int? minutes,
    required double price,

  }) = _Ticket;



  factory TicketM.fromJson(Map<String, dynamic> json) =>
      _$TicketFromJson(json);
}