// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionHistory implements DiagnosticableTreeMixin {

 String get id;
/// Create a copy of TransactionHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionHistoryCopyWith<TransactionHistory> get copyWith => _$TransactionHistoryCopyWithImpl<TransactionHistory>(this as TransactionHistory, _$identity);

  /// Serializes this TransactionHistory to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TransactionHistory'))
    ..add(DiagnosticsProperty('id', id));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionHistory&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TransactionHistory(id: $id)';
}


}

/// @nodoc
abstract mixin class $TransactionHistoryCopyWith<$Res>  {
  factory $TransactionHistoryCopyWith(TransactionHistory value, $Res Function(TransactionHistory) _then) = _$TransactionHistoryCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$TransactionHistoryCopyWithImpl<$Res>
    implements $TransactionHistoryCopyWith<$Res> {
  _$TransactionHistoryCopyWithImpl(this._self, this._then);

  final TransactionHistory _self;
  final $Res Function(TransactionHistory) _then;

/// Create a copy of TransactionHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TransactionHistory with DiagnosticableTreeMixin implements TransactionHistory {
  const _TransactionHistory({required this.id});
  factory _TransactionHistory.fromJson(Map<String, dynamic> json) => _$TransactionHistoryFromJson(json);

@override final  String id;

/// Create a copy of TransactionHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionHistoryCopyWith<_TransactionHistory> get copyWith => __$TransactionHistoryCopyWithImpl<_TransactionHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionHistoryToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TransactionHistory'))
    ..add(DiagnosticsProperty('id', id));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionHistory&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TransactionHistory(id: $id)';
}


}

/// @nodoc
abstract mixin class _$TransactionHistoryCopyWith<$Res> implements $TransactionHistoryCopyWith<$Res> {
  factory _$TransactionHistoryCopyWith(_TransactionHistory value, $Res Function(_TransactionHistory) _then) = __$TransactionHistoryCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$TransactionHistoryCopyWithImpl<$Res>
    implements _$TransactionHistoryCopyWith<$Res> {
  __$TransactionHistoryCopyWithImpl(this._self, this._then);

  final _TransactionHistory _self;
  final $Res Function(_TransactionHistory) _then;

/// Create a copy of TransactionHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_TransactionHistory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
