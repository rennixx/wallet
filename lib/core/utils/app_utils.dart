import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/core/utils/app_logger.dart';

class AppUtils {
  // Dismisses the keyboard
  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  // Shows a SnackBar message
  static void showSnackBar(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  // Copies text to clipboard
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    AppLogger.i('Copied to clipboard: $text');
  }

  // Delays execution for a specified duration
  static Future<void> delay(int milliseconds) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
  }

  // Logs an error with stack trace
  static void logError(String message, dynamic error, StackTrace stackTrace) {
    AppLogger.e(message, error, stackTrace);
  }

  // Formats a double value to a currency string
  static String formatCurrency(double amount, {String symbol = '\$'}) {
    return '\$symbol${amount.toStringAsFixed(2)}';
  }

  // Generates a unique ID (example, can be replaced with UUID package)
  static String generateUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
