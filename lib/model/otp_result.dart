class Result {
  final bool success;
  final String? errorMessage;

  Result.success() : success = true, errorMessage = null;
  Result.failure(this.errorMessage) : success = false;
}
