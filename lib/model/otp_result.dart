class OtpResult {
  final bool success;
  final String? errorMessage;

  OtpResult.success() : success = true, errorMessage = null;
  OtpResult.failure(this.errorMessage) : success = false;
}
