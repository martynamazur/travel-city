import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_history_model.freezed.dart';
part 'transaction_history_model.g.dart';

@freezed
abstract class TransactionHistory with _$TransactionHistory {
  const factory TransactionHistory({
    required String id
    ,
  }) = _TransactionHistory;



  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);
}