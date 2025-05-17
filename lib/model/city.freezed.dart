// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$City {

 int get id; String get name; List<VehicleType> get vehicleTypes; List<TicketVariant> get ticketVariants;
/// Create a copy of City
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityCopyWith<City> get copyWith => _$CityCopyWithImpl<City>(this as City, _$identity);

  /// Serializes this City to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is City&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.vehicleTypes, vehicleTypes)&&const DeepCollectionEquality().equals(other.ticketVariants, ticketVariants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(vehicleTypes),const DeepCollectionEquality().hash(ticketVariants));

@override
String toString() {
  return 'City(id: $id, name: $name, vehicleTypes: $vehicleTypes, ticketVariants: $ticketVariants)';
}


}

/// @nodoc
abstract mixin class $CityCopyWith<$Res>  {
  factory $CityCopyWith(City value, $Res Function(City) _then) = _$CityCopyWithImpl;
@useResult
$Res call({
 int id, String name, List<VehicleType> vehicleTypes, List<TicketVariant> ticketVariants
});




}
/// @nodoc
class _$CityCopyWithImpl<$Res>
    implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._self, this._then);

  final City _self;
  final $Res Function(City) _then;

/// Create a copy of City
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? vehicleTypes = null,Object? ticketVariants = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,vehicleTypes: null == vehicleTypes ? _self.vehicleTypes : vehicleTypes // ignore: cast_nullable_to_non_nullable
as List<VehicleType>,ticketVariants: null == ticketVariants ? _self.ticketVariants : ticketVariants // ignore: cast_nullable_to_non_nullable
as List<TicketVariant>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _City implements City {
  const _City({required this.id, required this.name, final  List<VehicleType> vehicleTypes = const [], final  List<TicketVariant> ticketVariants = const []}): _vehicleTypes = vehicleTypes,_ticketVariants = ticketVariants;
  factory _City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

@override final  int id;
@override final  String name;
 final  List<VehicleType> _vehicleTypes;
@override@JsonKey() List<VehicleType> get vehicleTypes {
  if (_vehicleTypes is EqualUnmodifiableListView) return _vehicleTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vehicleTypes);
}

 final  List<TicketVariant> _ticketVariants;
@override@JsonKey() List<TicketVariant> get ticketVariants {
  if (_ticketVariants is EqualUnmodifiableListView) return _ticketVariants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ticketVariants);
}


/// Create a copy of City
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityCopyWith<_City> get copyWith => __$CityCopyWithImpl<_City>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _City&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._vehicleTypes, _vehicleTypes)&&const DeepCollectionEquality().equals(other._ticketVariants, _ticketVariants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_vehicleTypes),const DeepCollectionEquality().hash(_ticketVariants));

@override
String toString() {
  return 'City(id: $id, name: $name, vehicleTypes: $vehicleTypes, ticketVariants: $ticketVariants)';
}


}

/// @nodoc
abstract mixin class _$CityCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$CityCopyWith(_City value, $Res Function(_City) _then) = __$CityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, List<VehicleType> vehicleTypes, List<TicketVariant> ticketVariants
});




}
/// @nodoc
class __$CityCopyWithImpl<$Res>
    implements _$CityCopyWith<$Res> {
  __$CityCopyWithImpl(this._self, this._then);

  final _City _self;
  final $Res Function(_City) _then;

/// Create a copy of City
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? vehicleTypes = null,Object? ticketVariants = null,}) {
  return _then(_City(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,vehicleTypes: null == vehicleTypes ? _self._vehicleTypes : vehicleTypes // ignore: cast_nullable_to_non_nullable
as List<VehicleType>,ticketVariants: null == ticketVariants ? _self._ticketVariants : ticketVariants // ignore: cast_nullable_to_non_nullable
as List<TicketVariant>,
  ));
}


}

// dart format on
