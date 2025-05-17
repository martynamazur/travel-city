// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_City _$CityFromJson(Map<String, dynamic> json) => _City(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  vehicleTypes:
      (json['vehicleTypes'] as List<dynamic>?)
          ?.map((e) => VehicleType.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  ticketVariants:
      (json['ticketVariants'] as List<dynamic>?)
          ?.map((e) => TicketVariant.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CityToJson(_City instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'vehicleTypes': instance.vehicleTypes,
  'ticketVariants': instance.ticketVariants,
};
