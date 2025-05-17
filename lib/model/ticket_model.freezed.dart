// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
TicketM _$TicketMFromJson(
  Map<String, dynamic> json
) {
    return _Ticket.fromJson(
      json
    );
}

/// @nodoc
mixin _$TicketM implements DiagnosticableTreeMixin {

 int get id;@JsonKey(name: 'city_id') int get cityId;@JsonKey(name: 'vehicle_type_id') int get vehicleTypeId;@JsonKey(name: 'variant_id') int get variantId; String get name; int? get minutes; double get price;
/// Create a copy of TicketM
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketMCopyWith<TicketM> get copyWith => _$TicketMCopyWithImpl<TicketM>(this as TicketM, _$identity);

  /// Serializes this TicketM to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TicketM'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('cityId', cityId))..add(DiagnosticsProperty('vehicleTypeId', vehicleTypeId))..add(DiagnosticsProperty('variantId', variantId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('minutes', minutes))..add(DiagnosticsProperty('price', price));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketM&&(identical(other.id, id) || other.id == id)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.vehicleTypeId, vehicleTypeId) || other.vehicleTypeId == vehicleTypeId)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.name, name) || other.name == name)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cityId,vehicleTypeId,variantId,name,minutes,price);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TicketM(id: $id, cityId: $cityId, vehicleTypeId: $vehicleTypeId, variantId: $variantId, name: $name, minutes: $minutes, price: $price)';
}


}

/// @nodoc
abstract mixin class $TicketMCopyWith<$Res>  {
  factory $TicketMCopyWith(TicketM value, $Res Function(TicketM) _then) = _$TicketMCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'city_id') int cityId,@JsonKey(name: 'vehicle_type_id') int vehicleTypeId,@JsonKey(name: 'variant_id') int variantId, String name, int? minutes, double price
});




}
/// @nodoc
class _$TicketMCopyWithImpl<$Res>
    implements $TicketMCopyWith<$Res> {
  _$TicketMCopyWithImpl(this._self, this._then);

  final TicketM _self;
  final $Res Function(TicketM) _then;

/// Create a copy of TicketM
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cityId = null,Object? vehicleTypeId = null,Object? variantId = null,Object? name = null,Object? minutes = freezed,Object? price = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int,vehicleTypeId: null == vehicleTypeId ? _self.vehicleTypeId : vehicleTypeId // ignore: cast_nullable_to_non_nullable
as int,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,minutes: freezed == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Ticket with DiagnosticableTreeMixin implements TicketM {
  const _Ticket({required this.id, @JsonKey(name: 'city_id') required this.cityId, @JsonKey(name: 'vehicle_type_id') required this.vehicleTypeId, @JsonKey(name: 'variant_id') required this.variantId, required this.name, this.minutes, required this.price});
  factory _Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

@override final  int id;
@override@JsonKey(name: 'city_id') final  int cityId;
@override@JsonKey(name: 'vehicle_type_id') final  int vehicleTypeId;
@override@JsonKey(name: 'variant_id') final  int variantId;
@override final  String name;
@override final  int? minutes;
@override final  double price;

/// Create a copy of TicketM
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketCopyWith<_Ticket> get copyWith => __$TicketCopyWithImpl<_Ticket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TicketM'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('cityId', cityId))..add(DiagnosticsProperty('vehicleTypeId', vehicleTypeId))..add(DiagnosticsProperty('variantId', variantId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('minutes', minutes))..add(DiagnosticsProperty('price', price));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ticket&&(identical(other.id, id) || other.id == id)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.vehicleTypeId, vehicleTypeId) || other.vehicleTypeId == vehicleTypeId)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.name, name) || other.name == name)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cityId,vehicleTypeId,variantId,name,minutes,price);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TicketM(id: $id, cityId: $cityId, vehicleTypeId: $vehicleTypeId, variantId: $variantId, name: $name, minutes: $minutes, price: $price)';
}


}

/// @nodoc
abstract mixin class _$TicketCopyWith<$Res> implements $TicketMCopyWith<$Res> {
  factory _$TicketCopyWith(_Ticket value, $Res Function(_Ticket) _then) = __$TicketCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'city_id') int cityId,@JsonKey(name: 'vehicle_type_id') int vehicleTypeId,@JsonKey(name: 'variant_id') int variantId, String name, int? minutes, double price
});




}
/// @nodoc
class __$TicketCopyWithImpl<$Res>
    implements _$TicketCopyWith<$Res> {
  __$TicketCopyWithImpl(this._self, this._then);

  final _Ticket _self;
  final $Res Function(_Ticket) _then;

/// Create a copy of TicketM
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cityId = null,Object? vehicleTypeId = null,Object? variantId = null,Object? name = null,Object? minutes = freezed,Object? price = null,}) {
  return _then(_Ticket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int,vehicleTypeId: null == vehicleTypeId ? _self.vehicleTypeId : vehicleTypeId // ignore: cast_nullable_to_non_nullable
as int,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,minutes: freezed == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
