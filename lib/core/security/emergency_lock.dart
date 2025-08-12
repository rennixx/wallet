import 'package:flutter/material.dart';

/// EmergencyLock provides a way to instantly lock the app and require re-authentication.
class EmergencyLock {
  static bool _locked = false;
  static VoidCallback? onLock;

  /// Call this to trigger an emergency lock (e.g., panic button)
  static void trigger() {
    _locked = true;
    onLock?.call();
  }

  /// Call this after successful authentication to unlock
  static void unlock() {
    _locked = false;
  }

  static bool get isLocked => _locked;
}
