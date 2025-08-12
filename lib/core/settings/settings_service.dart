/// Settings and preferences service.
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Service for managing user settings and preferences.
class SettingsService {
  static const _settingsBox = 'settings';

  /// Get a setting by key
  static Future<dynamic> getSetting(String key) async {
    final box = await Hive.openBox(_settingsBox);
    return box.get(key);
  }

  /// Set a setting by key
  static Future<void> setSetting(String key, dynamic value) async {
    final box = await Hive.openBox(_settingsBox);
    await box.put(key, value);
  }

  /// Remove a setting by key
  static Future<void> removeSetting(String key) async {
    final box = await Hive.openBox(_settingsBox);
    await box.delete(key);
  }
}
