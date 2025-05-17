


import 'autopayment_model.dart';

enum AliastType{
  UID, PAYID
}
class Alias{
  final String value;
  final AliastType type;
  final String label;
  final String? key;
  final Map<String,AutoPayment>? autoPayment;
  final bool? noDelay;

  Alias(this.value, this.type, this.label, this.key, this.autoPayment, this.noDelay);
}