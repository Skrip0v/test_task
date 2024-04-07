import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get loginAndRegistration => 'Вход/Регистрация';

  @override
  String get enterCode => 'Введите код';

  @override
  String get incomingCallEnterLastFourDigits => 'Вам поступил звонок,\nвведите последние 4 цифры';

  @override
  String get requestCodeAgain => 'Запросите код повторно через ';

  @override
  String get request => 'Запросить';

  @override
  String get signIn => 'Вход';

  @override
  String get error => 'Ошибка';

  @override
  String get enterPhoneNumber => 'Укажите номер телефона';

  @override
  String get robotCallMessage => 'На него позвонит робот\nи сообщит код подтверждения';

  @override
  String get confirmationMessage => 'Отправляя форму, вы подтверждаете свое\nсогласие на ';

  @override
  String get personalDataProcessing => 'обработку персональных данных';

  @override
  String hello(String userName) {
    return 'Привет $userName';
  }
}
