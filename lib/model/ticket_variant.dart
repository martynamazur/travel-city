import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_variant.freezed.dart';
part 'ticket_variant.g.dart';

@freezed
abstract class TicketVariant with _$TicketVariant {
  const factory TicketVariant({
    required int id,
    required String name,
  }) = _TicketVariant;

  factory TicketVariant.fromJson(Map<String, dynamic> json) =>
      _$TicketVariantFromJson(json);
}
