// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get hello => 'Cześć!';

  @override
  String get buyTicket => 'Kup bilet';

  @override
  String get yourTicket => 'Twoje bilety';

  @override
  String get error => 'Błąd';

  @override
  String get yourActiveTickets => 'Twoje aktywne bilety pojawią się tutaj';

  @override
  String get addTicketInfo => 'Po dodaniu biletu, pojawi się on tutaj';

  @override
  String get mostBought => 'Najczęściej kupowane';

  @override
  String get showAll => 'Pokaż wszystkie';

  @override
  String get start => 'Start';

  @override
  String get skip => 'Pomiń';

  @override
  String get onboardingWelcomeTitle => 'Witamy w TravelCity!';

  @override
  String get onboardingWelcomeDescription => 'Twoje bilety komunikacji miejskiej — zawsze pod ręką. Kupuj, zarządzaj i podróżuj z łatwością — bez kolejek i gotówki.';

  @override
  String get onboardingPaymentsTitle => 'Bezpieczne i szybkie płatności';

  @override
  String get onboardingPaymentsDescription => 'Obsługujemy BLIK, karty, Google Pay i Apple Pay.';

  @override
  String get onboardingPurchaseTitle => 'Kupuj bilety jednym kliknięciem';

  @override
  String get onboardingPurchaseDescription => 'Wybierz bilet, zapłać i gotowe. Bilet znajdziesz od razu w aplikacji.';

  @override
  String get buyAgain => 'Kup ponownie';

  @override
  String get ticketId => 'ID biletu: ';

  @override
  String get status => 'Status';

  @override
  String get active => 'Aktywny';

  @override
  String get history => 'Historia';

  @override
  String get expired => 'Wygasł';

  @override
  String get activeFrom => 'Aktywny od';

  @override
  String get expiredAt => 'Wygasa o';

  @override
  String get price => 'Cena';

  @override
  String get ticketAmount => 'Liczba biletów';

  @override
  String get regular => 'Normalny';

  @override
  String get activateTicketHeadline => 'Zeskanuj kod QR, aby aktywować bilet';

  @override
  String get vehicleNotValidOrNotFound => 'Pojazd nie pasuje do biletu lub nie został znaleziony';

  @override
  String get invalidQrCode => 'Nieprawidłowy kod QR';

  @override
  String get bottomNavHome => 'Strona główna';

  @override
  String get bottomNavTickets => 'Bilety';

  @override
  String get bottomNavMenu => 'Menu';

  @override
  String get loginTitle => 'Zaloguj się i wróć\ndo swojej przygody!';

  @override
  String get loginSubtitle => 'Użyj numeru telefonu, aby się zalogować';

  @override
  String get continueHeadline => 'Kontynuuj';

  @override
  String get somethingWentWrong => 'Ups, coś poszło nie tak. Spróbuj ponownie.';

  @override
  String get fieldCannotBeEmpty => 'To pole nie może być puste';

  @override
  String get enterPhoneNumber => 'Wprowadź swój numer telefonu';

  @override
  String menuPhoneNumberLabel(Object phoneNumber) {
    return 'Mój numer telefonu: $phoneNumber';
  }

  @override
  String get menuWallet => 'Portfel';

  @override
  String get menuSettings => 'Ustawienia';

  @override
  String get menuAboutApp => 'O aplikacji';

  @override
  String get menuTermsAndConditions => 'Regulamin';

  @override
  String get menuSignOut => 'Wyloguj się';

  @override
  String get errorLogoutFailed => 'Wystąpił błąd podczas wylogowywania';

  @override
  String get noActiveTicketsHeadline => 'Brak aktywnych biletów';

  @override
  String get expiredTicketsInfo => 'Twoje wygasłe bilety będą widoczne tutaj';

  @override
  String get verify => 'Zweryfikuj';

  @override
  String get didntReceiveCode => 'Nie otrzymałeś jeszcze kodu?';

  @override
  String get phoneVerificationTitle => 'Weryfikacja numeru telefonu';

  @override
  String enterCodeSentToNumber(Object phoneNumber) {
    return 'Wprowadź kod wysłany na numer: $phoneNumber';
  }

  @override
  String get unknownError => 'Wystąpił nieznany błąd';

  @override
  String get unknownErrorTooltip => 'Coś poszło nie tak, ale nie wiemy co. Spróbuj ponownie później.';

  @override
  String get errorUnknown => 'Wystąpił nieznany błąd';

  @override
  String get invalidOtpCode => 'Nieprawidłowy kod weryfikacyjny. Spróbuj ponownie.';

  @override
  String get logoutFailed => 'Wylogowanie nie powiodło się. Spróbuj ponownie.';

  @override
  String get mostBoughTicketHeadline => 'Najczęściej kupowany bilet';

  @override
  String get buyNewTicket => 'Kup nowy bilet';

  @override
  String get city => 'Miasto';

  @override
  String get selectCity => 'Wybierz miasto';

  @override
  String get chooseCity => 'Wybierz miasto';

  @override
  String get choosePaymentOption => 'Wybierz metodę płatności';

  @override
  String get next => 'Dalej';

  @override
  String get priceFor => 'Cena za';

  @override
  String ticketPriceLabel(int amount, Object price) {
    String _temp0 = intl.Intl.pluralLogic(
      amount,
      locale: localeName,
      other: 'Cena za $amount biletów: $price zł',
      one: 'Cena za 1 bilet: $price zł',
    );
    return '$_temp0';
  }

  @override
  String get chooseCategory => 'Wybierz kategorię';

  @override
  String get payment => 'Płatność';

  @override
  String get paymentOptions => 'Metody płatności';

  @override
  String get enterBlikCode => 'Wprowadź kod BLIK';

  @override
  String get transactionStatus => 'Status transakcji';

  @override
  String remaining(Object formattedTime) {
    return 'Pozostało: $formattedTime';
  }

  @override
  String ticketTypeLabel(int minutes, String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'normal': 'normalny',
        'reduced': 'ulgowy',
        'other': 'nieznany',
      },
    );
    return '$minutes minut, $_temp0';
  }
}
