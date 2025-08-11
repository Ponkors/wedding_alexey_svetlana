import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';

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
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ru')];

  /// No description provided for @appTitle.
  ///
  /// In ru, this message translates to:
  /// **'Наша Свадьба'**
  String get appTitle;

  /// No description provided for @invitationText.
  ///
  /// In ru, this message translates to:
  /// **'Приглашают вас на нашу свадьбу'**
  String get invitationText;

  /// No description provided for @countdownTitle.
  ///
  /// In ru, this message translates to:
  /// **'До нашей свадьбы осталось:'**
  String get countdownTitle;

  /// No description provided for @days.
  ///
  /// In ru, this message translates to:
  /// **'Дней'**
  String get days;

  /// No description provided for @hours.
  ///
  /// In ru, this message translates to:
  /// **'Часов'**
  String get hours;

  /// No description provided for @minutes.
  ///
  /// In ru, this message translates to:
  /// **'Минут'**
  String get minutes;

  /// No description provided for @seconds.
  ///
  /// In ru, this message translates to:
  /// **'Секунд'**
  String get seconds;

  /// No description provided for @aboutTitle.
  ///
  /// In ru, this message translates to:
  /// **'Наша история'**
  String get aboutTitle;

  /// No description provided for @groomTitle.
  ///
  /// In ru, this message translates to:
  /// **'Жених'**
  String get groomTitle;

  /// No description provided for @brideTitle.
  ///
  /// In ru, this message translates to:
  /// **'Невеста'**
  String get brideTitle;

  /// No description provided for @scheduleTitle.
  ///
  /// In ru, this message translates to:
  /// **'Расписание дня'**
  String get scheduleTitle;

  /// No description provided for @galleryTitle.
  ///
  /// In ru, this message translates to:
  /// **'Наша галерея'**
  String get galleryTitle;

  /// No description provided for @rsvpTitle.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите присутствие'**
  String get rsvpTitle;

  /// No description provided for @rsvpDescription.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, заполните форму ниже, чтобы мы могли подготовиться к вашему приезду'**
  String get rsvpDescription;

  /// No description provided for @nameLabel.
  ///
  /// In ru, this message translates to:
  /// **'Ваше имя'**
  String get nameLabel;

  /// No description provided for @emailLabel.
  ///
  /// In ru, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @guestsLabel.
  ///
  /// In ru, this message translates to:
  /// **'Количество гостей'**
  String get guestsLabel;

  /// No description provided for @willAttend.
  ///
  /// In ru, this message translates to:
  /// **'Я приду'**
  String get willAttend;

  /// No description provided for @willNotAttend.
  ///
  /// In ru, this message translates to:
  /// **'К сожалению, не смогу прийти'**
  String get willNotAttend;

  /// No description provided for @submitButton.
  ///
  /// In ru, this message translates to:
  /// **'Отправить'**
  String get submitButton;

  /// No description provided for @successMessage.
  ///
  /// In ru, this message translates to:
  /// **'Спасибо за подтверждение!'**
  String get successMessage;

  /// No description provided for @errorName.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, введите ваше имя'**
  String get errorName;

  /// No description provided for @errorEmail.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, введите корректный email'**
  String get errorEmail;

  /// No description provided for @errorGuests.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, укажите количество гостей'**
  String get errorGuests;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
