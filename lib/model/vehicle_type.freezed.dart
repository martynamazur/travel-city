// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleType {

 int get id; String get name;
/// Create a copy of VehicleType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleTypeCopyWith<VehicleType> get copyWith => _$VehicleTypeCopyWithImpl<VehicleType>(this as VehicleType, _$identity);

  /// Serializes this VehicleType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'VehicleType(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $VehicleTypeCopyWith<$Res>  {
  factory $VehicleTypeCopyWith(VehicleType value, $Res Function(VehicleType) _then) = _$VehicleTypeCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$VehicleTypeCopyWithImpl<$Res>
    implements $VehicleTypeCopyWith<$Res> {
  _$VehicleTypeCopyWithImpl(this._self, this._then);

  final VehicleType _self;
  final $Res Function(VehicleType) _then;

/// Create a copy of VehicleType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VehicleType implements VehicleType {
  const _VehicleType({required this.id, required this.name});
  factory _VehicleType.fromJson(Map<String, dynamic> json) => _$VehicleTypeFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of VehicleType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleTypeCopyWith<_VehicleType> get copyWith => __$VehicleTypeCopyWithImpl<_VehicleType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'VehicleType(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$VehicleTypeCopyWith<$Res> implements $VehicleTypeCopyWith<$Res> {
  factory _$VehicleTypeCopyWith(_VehicleType value, $Res Function(_VehicleType) _then) = __$VehicleTypeCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$VehicleTypeCopyWithImpl<$Res>
    implements _$VehicleTypeCopyWith<$Res> {
  __$VehicleTypeCopyWithImpl(this._self, this._then);

  final _VehicleType _self;
  final $Res Function(_VehicleType) _then;

/// Create a copy of VehicleType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_VehicleType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
