import 'package:flutter/services.dart';

/// Secure clipboard operations for sensitive card data.
class SecureClipboard {
  /// Copies text to clipboard and clears it after a short delay.
  static Future<void> copy(
    String text, {
    Duration clearAfter = const Duration(seconds: 10),
  }) async {
    await Clipboard.setData(ClipboardData(text: text));
    // Optionally, show a notification to the user
    Future.delayed(clearAfter, () async {
      // Clear clipboard
      await Clipboard.setData(const ClipboardData(text: ''));
    });
  }
}
