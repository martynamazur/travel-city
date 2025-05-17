
enum Model{
 A, M, O
}

enum Currency{
  PLN
}

class AutoPayment{
  final Model model;
  final String frequency;
  final int singleLimitAmount;
  final int totalLimitAmount;
  final String currency;
  final String initDate;
  final String expirationDate;

  AutoPayment(this.model, this.frequency, this.singleLimitAmount,
      this.totalLimitAmount, this.currency, this.initDate, this.expirationDate);


}