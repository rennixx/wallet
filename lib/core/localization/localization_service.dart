import 'package:hive/hive.dart';

/// Service for managing app localization and supported languages.
class LocalizationService {
  static const _localeBox = 'locale';
  static const _localeKey = 'current_locale';
  static const _supportedLocales = ['en', 'es', 'fr', 'de', 'zh', 'ja', 'ru'];

  /// Get current locale
  static Future<String> getCurrentLocale() async {
    final box = await Hive.openBox(_localeBox);
    return box.get(_localeKey, defaultValue: 'en') as String;
  }

  /// Set current locale
  static Future<void> setLocale(String locale) async {
    final box = await Hive.openBox(_localeBox);
    await box.put(_localeKey, locale);
  }

  /// Get supported locales
  static List<String> getSupportedLocales() {
    return _supportedLocales;
  }
}
