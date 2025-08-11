// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Наша Свадьба';

  @override
  String get invitationText => 'Приглашают вас на нашу свадьбу';

  @override
  String get countdownTitle => 'До нашей свадьбы осталось:';

  @override
  String get days => 'Дней';

  @override
  String get hours => 'Часов';

  @override
  String get minutes => 'Минут';

  @override
  String get seconds => 'Секунд';

  @override
  String get aboutTitle => 'Наша история';

  @override
  String get groomTitle => 'Жених';

  @override
  String get brideTitle => 'Невеста';

  @override
  String get scheduleTitle => 'Расписание дня';

  @override
  String get galleryTitle => 'Наша галерея';

  @override
  String get rsvpTitle => 'Подтвердите присутствие';

  @override
  String get rsvpDescription =>
      'Пожалуйста, заполните форму ниже, чтобы мы могли подготовиться к вашему приезду';

  @override
  String get nameLabel => 'Ваше имя';

  @override
  String get emailLabel => 'Email';

  @override
  String get guestsLabel => 'Количество гостей';

  @override
  String get willAttend => 'Я приду';

  @override
  String get willNotAttend => 'К сожалению, не смогу прийти';

  @override
  String get submitButton => 'Отправить';

  @override
  String get successMessage => 'Спасибо за подтверждение!';

  @override
  String get errorName => 'Пожалуйста, введите ваше имя';

  @override
  String get errorEmail => 'Пожалуйста, введите корректный email';

  @override
  String get errorGuests => 'Пожалуйста, укажите количество гостей';
}
