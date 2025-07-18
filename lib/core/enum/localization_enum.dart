import 'dart:ui' show Locale;

enum LocalizationEnum { ru, en, system }

LocalizationEnum enumFromLocale(Locale locale) {
  final languageCode = locale.languageCode;
  if (languageCode == 'ru') return LocalizationEnum.ru;
  if (languageCode == 'en') return LocalizationEnum.en;
  return LocalizationEnum.system;
}
