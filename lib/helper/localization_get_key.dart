import '../l10n/app_localizations.dart';

extension LocalizationHelper on AppLocalizations {
  String get(String key) {
    final map = {
      'errorUnknown': errorUnknown,
      'otpInvalid': invalidOtpCode,
    };
    return map[key] ?? key;
  }
}
