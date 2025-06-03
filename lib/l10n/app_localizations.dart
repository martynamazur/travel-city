import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl')
  ];

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello there!'**
  String get hello;

  /// No description provided for @buyTicket.
  ///
  /// In en, this message translates to:
  /// **'Buy ticket'**
  String get buyTicket;

  /// No description provided for @yourTicket.
  ///
  /// In en, this message translates to:
  /// **'Your tickets'**
  String get yourTicket;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @yourActiveTickets.
  ///
  /// In en, this message translates to:
  /// **'Your active tickets will appear here'**
  String get yourActiveTickets;

  /// No description provided for @addTicketInfo.
  ///
  /// In en, this message translates to:
  /// **'Once you add a ticket, it will be displayed here'**
  String get addTicketInfo;

  /// No description provided for @mostBought.
  ///
  /// In en, this message translates to:
  /// **'Most bought'**
  String get mostBought;

  /// No description provided for @showAll.
  ///
  /// In en, this message translates to:
  /// **'Show all'**
  String get showAll;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to TravelCity!'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Your public transport tickets — always within reach. Buy, manage, and travel with ease — no lines, no cash needed.'**
  String get onboardingWelcomeDescription;

  /// No description provided for @onboardingPaymentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Secure and fast payments'**
  String get onboardingPaymentsTitle;

  /// No description provided for @onboardingPaymentsDescription.
  ///
  /// In en, this message translates to:
  /// **'We support BLIK, cards, Google Pay, and Apple Pay.'**
  String get onboardingPaymentsDescription;

  /// No description provided for @onboardingPurchaseTitle.
  ///
  /// In en, this message translates to:
  /// **'Buy tickets with one click'**
  String get onboardingPurchaseTitle;

  /// No description provided for @onboardingPurchaseDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose a ticket, pay, and you\'re ready. You\'ll find the ticket immediately in the app.'**
  String get onboardingPurchaseDescription;

  /// No description provided for @buyAgain.
  ///
  /// In en, this message translates to:
  /// **'Buy again'**
  String get buyAgain;

  /// No description provided for @ticketId.
  ///
  /// In en, this message translates to:
  /// **'Ticket id: '**
  String get ticketId;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expired;

  /// No description provided for @activeFrom.
  ///
  /// In en, this message translates to:
  /// **'Active from'**
  String get activeFrom;

  /// No description provided for @expiredAt.
  ///
  /// In en, this message translates to:
  /// **'Expires at'**
  String get expiredAt;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'price'**
  String get price;

  /// No description provided for @ticketAmount.
  ///
  /// In en, this message translates to:
  /// **'Ticket amount'**
  String get ticketAmount;

  /// No description provided for @regular.
  ///
  /// In en, this message translates to:
  /// **'Regular'**
  String get regular;

  /// No description provided for @activateTicketHeadline.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code to activate your ticket'**
  String get activateTicketHeadline;

  /// No description provided for @vehicleNotValidOrNotFound.
  ///
  /// In en, this message translates to:
  /// **'The vehicle does not match the ticket or was not found'**
  String get vehicleNotValidOrNotFound;

  /// No description provided for @invalidQrCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid QR code'**
  String get invalidQrCode;

  /// No description provided for @bottomNavHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get bottomNavHome;

  /// No description provided for @bottomNavTickets.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get bottomNavTickets;

  /// No description provided for @bottomNavMenu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get bottomNavMenu;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Log in and return \nto your adventure!'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use your phone number to log in'**
  String get loginSubtitle;

  /// No description provided for @continueHeadline.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueHeadline;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Oops, something went wrong. Please try again.'**
  String get somethingWentWrong;

  /// No description provided for @fieldCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'This field cannot be empty'**
  String get fieldCannotBeEmpty;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterPhoneNumber;

  /// No description provided for @menuPhoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'My phone number : {phoneNumber}'**
  String menuPhoneNumberLabel(Object phoneNumber);

  /// No description provided for @menuWallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get menuWallet;

  /// No description provided for @menuSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get menuSettings;

  /// No description provided for @menuAboutApp.
  ///
  /// In en, this message translates to:
  /// **'About app'**
  String get menuAboutApp;

  /// No description provided for @menuTermsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get menuTermsAndConditions;

  /// No description provided for @menuSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get menuSignOut;

  /// No description provided for @errorLogoutFailed.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while logging out'**
  String get errorLogoutFailed;

  /// No description provided for @noActiveTicketsHeadline.
  ///
  /// In en, this message translates to:
  /// **'No active tickets'**
  String get noActiveTicketsHeadline;

  /// No description provided for @expiredTicketsInfo.
  ///
  /// In en, this message translates to:
  /// **'Your expired tickets will be visible here'**
  String get expiredTicketsInfo;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @didntReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code yet?'**
  String get didntReceiveCode;

  /// No description provided for @phoneVerificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone number verification'**
  String get phoneVerificationTitle;

  /// No description provided for @enterCodeSentToNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to the number: {phoneNumber}'**
  String enterCodeSentToNumber(Object phoneNumber);

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred'**
  String get unknownError;

  /// No description provided for @unknownErrorTooltip.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, but we\'re not sure what. Please try again later.'**
  String get unknownErrorTooltip;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred'**
  String get errorUnknown;

  /// No description provided for @invalidOtpCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid verification code. Please try again.'**
  String get invalidOtpCode;

  /// No description provided for @logoutFailed.
  ///
  /// In en, this message translates to:
  /// **'Logout failed. Please try again.'**
  String get logoutFailed;

  /// No description provided for @mostBoughTicketHeadline.
  ///
  /// In en, this message translates to:
  /// **'Most bough ticket'**
  String get mostBoughTicketHeadline;

  /// No description provided for @buyNewTicket.
  ///
  /// In en, this message translates to:
  /// **'Buy new ticket'**
  String get buyNewTicket;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'city'**
  String get city;

  /// No description provided for @selectCity.
  ///
  /// In en, this message translates to:
  /// **'Select city'**
  String get selectCity;

  /// No description provided for @chooseCity.
  ///
  /// In en, this message translates to:
  /// **'Choose city'**
  String get chooseCity;

  /// No description provided for @choosePaymentOption.
  ///
  /// In en, this message translates to:
  /// **'Choose payment option'**
  String get choosePaymentOption;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'next'**
  String get next;

  /// No description provided for @priceFor.
  ///
  /// In en, this message translates to:
  /// **'Price for'**
  String get priceFor;

  /// Label showing ticket count and total price
  ///
  /// In en, this message translates to:
  /// **'{amount, plural, =1{Price for 1 ticket: {price} zł} other{Price for {amount} tickets: {price} zł}}'**
  String ticketPriceLabel(int amount, Object price);

  /// No description provided for @chooseCategory.
  ///
  /// In en, this message translates to:
  /// **'Choose category'**
  String get chooseCategory;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @paymentOptions.
  ///
  /// In en, this message translates to:
  /// **'Payment Options'**
  String get paymentOptions;

  /// No description provided for @enterBlikCode.
  ///
  /// In en, this message translates to:
  /// **'Enter BLIK code'**
  String get enterBlikCode;

  /// No description provided for @transactionStatus.
  ///
  /// In en, this message translates to:
  /// **'Transaction status'**
  String get transactionStatus;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining: {formattedTime}'**
  String remaining(Object formattedTime);

  /// Opis biletu: czas trwania i typ
  ///
  /// In en, this message translates to:
  /// **'{minutes} minut, {type, select, normal{normalny} reduced{ulgowy} other{nieznany}}'**
  String ticketTypeLabel(int minutes, String type);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pl': return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
