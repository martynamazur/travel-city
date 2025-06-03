class ValidationResult {
  final bool isValid;
  final String? message;

  const ValidationResult._(this.isValid, this.message);

  factory ValidationResult.success() => const ValidationResult._(true, null);

  factory ValidationResult.failure(String message) => ValidationResult._(false, message);

  @override
  String toString() =>
      isValid ? 'Validation successful' : 'Validation failed: $message';
}
