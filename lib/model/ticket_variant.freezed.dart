// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketVariant {

 int get id; String get name;
/// Create a copy of TicketVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketVariantCopyWith<TicketVariant> get copyWith => _$TicketVariantCopyWithImpl<TicketVariant>(this as TicketVariant, _$identity);

  /// Serializes this TicketVariant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'TicketVariant(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $TicketVariantCopyWith<$Res>  {
  factory $TicketVariantCopyWith(TicketVariant value, $Res Function(TicketVariant) _then) = _$TicketVariantCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$TicketVariantCopyWithImpl<$Res>
    implements $TicketVariantCopyWith<$Res> {
  _$TicketVariantCopyWithImpl(this._self, this._then);

  final TicketVariant _self;
  final $Res Function(TicketVariant) _then;

/// Create a copy of TicketVariant
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

class _TicketVariant implements TicketVariant {
  const _TicketVariant({required this.id, required this.name});
  factory _TicketVariant.fromJson(Map<String, dynamic> json) => _$TicketVariantFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of TicketVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketVariantCopyWith<_TicketVariant> get copyWith => __$TicketVariantCopyWithImpl<_TicketVariant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketVariantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'TicketVariant(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TicketVariantCopyWith<$Res> implements $TicketVariantCopyWith<$Res> {
  factory _$TicketVariantCopyWith(_TicketVariant value, $Res Function(_TicketVariant) _then) = __$TicketVariantCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$TicketVariantCopyWithImpl<$Res>
    implements _$TicketVariantCopyWith<$Res> {
  __$TicketVariantCopyWithImpl(this._self, this._then);

  final _TicketVariant _self;
  final $Res Function(_TicketVariant) _then;

/// Create a copy of TicketVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_TicketVariant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
