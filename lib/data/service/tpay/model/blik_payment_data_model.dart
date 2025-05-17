import 'alias_model.dart';

enum TransactionType {
  web(0),
  pos(1),
  autopayment(2);

  final int value;
  const TransactionType(this.value);

  static TransactionType? fromInt(int? value) {
    return TransactionType.values.firstWhere(
          (e) => e.value == value,
      orElse: () => TransactionType.web,
    );
  }
}

class BlikPaymentData{
  final String? blikToken;
  final Alias? aliases;
  final TransactionType? type;
  final bool? refuseNoPayId;

  BlikPaymentData({
    this.blikToken,
    this.aliases,
    this.refuseNoPayId,
    this.type = TransactionType.web,}
  );
}