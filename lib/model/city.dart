import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticketapp/model/ticket_variant.dart';
import 'package:ticketapp/model/vehicle_type.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
abstract class City with _$City {
  const factory City({
    required int id,
    required String name,
    @Default([]) List<VehicleType> vehicleTypes,
    @Default([]) List<TicketVariant> ticketVariants
  }) = _City;


  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);


}
