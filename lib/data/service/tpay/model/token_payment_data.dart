class TokenPaymentData{
  final String tokenValue;
  final String cardExpiryDate;
  final String initialTransactionId;
  final String cardBrand;
  final String? rocText;

  TokenPaymentData(this.tokenValue, this.cardExpiryDate,
      this.initialTransactionId, this.cardBrand, this.rocText);


}