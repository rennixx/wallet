import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

/// PIN lock service for app security.
class PinService {
  static const _pinKey = 'user_pin_hash';
  static final _storage = const FlutterSecureStorage();

  /// Set a new PIN (stored as a hash)
  static Future<void> setPin(String pin) async {
    final hash = sha256.convert(utf8.encode(pin)).toString();
    await _storage.write(key: _pinKey, value: hash);
  }

  /// Validate entered PIN
  static Future<bool> validatePin(String pin) async {
    final hash = sha256.convert(utf8.encode(pin)).toString();
    final stored = await _storage.read(key: _pinKey);
    return stored == hash;
  }

  /// Remove PIN
  static Future<void> removePin() async {
    await _storage.delete(key: _pinKey);
  }
}
