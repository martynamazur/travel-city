import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_type.freezed.dart';
part 'vehicle_type.g.dart';

@freezed
abstract class VehicleType with _$VehicleType {
  const factory VehicleType({
    required int id,
    required String name, // np. "Tramwaj", "Autobus"
  }) = _VehicleType;

  factory VehicleType.fromJson(Map<String, dynamic> json) =>
      _$VehicleTypeFromJson(json);
}
