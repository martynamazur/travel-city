// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get hello => 'Hello there!';

  @override
  String get buyTicket => 'Buy ticket';

  @override
  String get yourTicket => 'Your tickets';

  @override
  String get error => 'Error';

  @override
  String get yourActiveTickets => 'Your active tickets will appear here';

  @override
  String get addTicketInfo => 'Once you add a ticket, it will be displayed here';

  @override
  String get mostBought => 'Most bought';

  @override
  String get showAll => 'Show all';

  @override
  String get start => 'Start';

  @override
  String get skip => 'Skip';

  @override
  String get onboardingWelcomeTitle => 'Welcome to TravelCity!';

  @override
  String get onboardingWelcomeDescription => 'Your public transport tickets — always within reach. Buy, manage, and travel with ease — no lines, no cash needed.';

  @override
  String get onboardingPaymentsTitle => 'Secure and fast payments';

  @override
  String get onboardingPaymentsDescription => 'We support BLIK, cards, Google Pay, and Apple Pay.';

  @override
  String get onboardingPurchaseTitle => 'Buy tickets with one click';

  @override
  String get onboardingPurchaseDescription => 'Choose a ticket, pay, and you\'re ready. You\'ll find the ticket immediately in the app.';

  @override
  String get buyAgain => 'Buy again';

  @override
  String get ticketId => 'Ticket id: ';

  @override
  String get status => 'Status';

  @override
  String get active => 'Active';

  @override
  String get history => 'History';

  @override
  String get expired => 'Expired';

  @override
  String get activeFrom => 'Active from';

  @override
  String get expiredAt => 'Expires at';

  @override
  String get price => 'price';

  @override
  String get ticketAmount => 'Ticket amount';

  @override
  String get regular => 'Regular';

  @override
  String get activateTicketHeadline => 'Scan QR code to activate your ticket';

  @override
  String get vehicleNotValidOrNotFound => 'The vehicle does not match the ticket or was not found';

  @override
  String get invalidQrCode => 'Invalid QR code';

  @override
  String get bottomNavHome => 'Home';

  @override
  String get bottomNavTickets => 'Tickets';

  @override
  String get bottomNavMenu => 'Menu';

  @override
  String get loginTitle => 'Log in and return \nto your adventure!';

  @override
  String get loginSubtitle => 'Use your phone number to log in';

  @override
  String get continueHeadline => 'Continue';

  @override
  String get somethingWentWrong => 'Oops, something went wrong. Please try again.';

  @override
  String get fieldCannotBeEmpty => 'This field cannot be empty';

  @override
  String get enterPhoneNumber => 'Enter your phone number';

  @override
  String menuPhoneNumberLabel(Object phoneNumber) {
    return 'My phone number : $phoneNumber';
  }

  @override
  String get menuWallet => 'Wallet';

  @override
  String get menuSettings => 'Settings';

  @override
  String get menuAboutApp => 'About app';

  @override
  String get menuTermsAndConditions => 'Terms and Conditions';

  @override
  String get menuSignOut => 'Sign out';

  @override
  String get errorLogoutFailed => 'Something went wrong while logging out';

  @override
  String get noActiveTicketsHeadline => 'No active tickets';

  @override
  String get expiredTicketsInfo => 'Your expired tickets will be visible here';

  @override
  String get verify => 'Verify';

  @override
  String get didntReceiveCode => 'Didn\'t receive the code yet?';

  @override
  String get phoneVerificationTitle => 'Phone number verification';

  @override
  String enterCodeSentToNumber(Object phoneNumber) {
    return 'Enter the code sent to the number: $phoneNumber';
  }

  @override
  String get unknownError => 'An unknown error occurred';

  @override
  String get unknownErrorTooltip => 'Something went wrong, but we\'re not sure what. Please try again later.';

  @override
  String get errorUnknown => 'An unknown error occurred';

  @override
  String get invalidOtpCode => 'Invalid verification code. Please try again.';

  @override
  String get logoutFailed => 'Logout failed. Please try again.';

  @override
  String get mostBoughTicketHeadline => 'Most bough ticket';

  @override
  String get buyNewTicket => 'Buy new ticket';

  @override
  String get city => 'city';

  @override
  String get selectCity => 'Select city';

  @override
  String get chooseCity => 'Choose city';

  @override
  String get choosePaymentOption => 'Choose payment option';

  @override
  String get next => 'next';

  @override
  String get priceFor => 'Price for';

  @override
  String ticketPriceLabel(int amount, Object price) {
    String _temp0 = intl.Intl.pluralLogic(
      amount,
      locale: localeName,
      other: 'Price for $amount tickets: $price zł',
      one: 'Price for 1 ticket: $price zł',
    );
    return '$_temp0';
  }

  @override
  String get chooseCategory => 'Choose category';

  @override
  String get payment => 'Payment';

  @override
  String get paymentOptions => 'Payment Options';

  @override
  String get enterBlikCode => 'Enter BLIK code';

  @override
  String get transactionStatus => 'Transaction status';

  @override
  String remaining(Object formattedTime) {
    return 'Remaining: $formattedTime';
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
