/// Backup and restore service with encryption.

import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:wallet/core/security/encryption/aes_encryption_service.dart';

/// Service for backup and restore of wallet data.
class BackupService {
  /// Export wallet data to a file with encryption
  static Future<void> exportData(
    String filePath,
    AESEncryptionService encryptionService,
  ) async {
    final cardBox = await Hive.openBox('cards');
    final settingsBox = await Hive.openBox('settings');
    final analyticsBox = await Hive.openBox('analytics');
    final data = {
      'cards': cardBox.toMap(),
      'settings': settingsBox.toMap(),
      'analytics': analyticsBox.toMap(),
    };
    final jsonStr = jsonEncode(data);
    final encrypted = encryptionService.encryptText(jsonStr);
    final file = File(filePath);
    await file.writeAsString(encrypted);
  }

  /// Import wallet data from a file with decryption
  static Future<void> importData(
    String filePath,
    AESEncryptionService encryptionService,
  ) async {
    final file = File(filePath);
    if (!await file.exists()) throw Exception('Backup file not found');
    final encrypted = await file.readAsString();
    final jsonStr = encryptionService.decryptText(encrypted);
    final data = jsonDecode(jsonStr);
    final cardBox = await Hive.openBox('cards');
    final settingsBox = await Hive.openBox('settings');
    final analyticsBox = await Hive.openBox('analytics');
    await cardBox.clear();
    await settingsBox.clear();
    await analyticsBox.clear();
    await cardBox.putAll(Map<String, dynamic>.from(data['cards'] ?? {}));
    await settingsBox.putAll(Map<String, dynamic>.from(data['settings'] ?? {}));
    await analyticsBox.putAll(
      Map<String, dynamic>.from(data['analytics'] ?? {}),
    );
  }
}
