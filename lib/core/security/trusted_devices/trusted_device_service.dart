import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Trusted device management service.
class TrustedDeviceService {
  static const _trustedDevicesKey = 'trusted_devices';
  static final _storage = const FlutterSecureStorage();

  /// Register a device as trusted
  static Future<void> registerDevice(String deviceId) async {
    final devices = await _getTrustedDevices();
    if (!devices.contains(deviceId)) {
      devices.add(deviceId);
      await _storage.write(key: _trustedDevicesKey, value: devices.join(','));
    }
  }

  /// Check if device is trusted
  static Future<bool> isTrusted(String deviceId) async {
    final devices = await _getTrustedDevices();
    return devices.contains(deviceId);
  }

  /// Remove a trusted device
  static Future<void> removeDevice(String deviceId) async {
    final devices = await _getTrustedDevices();
    devices.remove(deviceId);
    await _storage.write(key: _trustedDevicesKey, value: devices.join(','));
  }

  static Future<List<String>> _getTrustedDevices() async {
    final value = await _storage.read(key: _trustedDevicesKey);
    if (value == null || value.isEmpty) return [];
    return value.split(',');
  }
}
