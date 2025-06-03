import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_history_model.freezed.dart';
part 'transaction_history_model.g.dart';

//TODO: pobierane z db inf do Historii jesli uzytkownik np pobierze ponownie aplikacje. Dotychczas dane sa przechowywane lokalnie. Zrobic tak aby spr czy sa dane, jesli nie spr czy sa w supapabse, jesli tez nie to nic nie wyswietlamy

@freezed
abstract class TransactionHistory with _$TransactionHistory {
  const factory TransactionHistory({
    required String id
    ,
  }) = _TransactionHistory;



  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);
}