import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

/// Prevents screenshots and screen recording on sensitive screens.
class ScreenshotBlocker {
  static const _channel = MethodChannel('wallet/screenshot_blocker');

  /// Call this in initState of sensitive screens.
  static Future<void> block() async {
    try {
      await _channel.invokeMethod('blockScreenshots');
    } catch (_) {}
  }

  /// Call this in dispose of sensitive screens.
  static Future<void> unblock() async {
    try {
      await _channel.invokeMethod('unblockScreenshots');
    } catch (_) {}
  }
}
