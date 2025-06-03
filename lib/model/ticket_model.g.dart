// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ticket _$TicketFromJson(Map<String, dynamic> json) => _Ticket(
  id: (json['id'] as num).toInt(),
  cityId: (json['city_id'] as num).toInt(),
  vehicleTypeId: (json['vehicle_type_id'] as num).toInt(),
  variantId: (json['variant_id'] as num).toInt(),
  name: json['name'] as String,
  minutes: json['minutes'],
  price: (json['price'] as num).toDouble(),
);

Map<String, dynamic> _$TicketToJson(_Ticket instance) => <String, dynamic>{
  'id': instance.id,
  'city_id': instance.cityId,
  'vehicle_type_id': instance.vehicleTypeId,
  'variant_id': instance.variantId,
  'name': instance.name,
  'minutes': instance.minutes,
  'price': instance.price,
};
