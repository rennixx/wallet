import 'package:flutter/material.dart';

class ThemedSnackBar {
  static void show(
    BuildContext context,
    String message, {
    Color? backgroundColor,
    Color? textColor,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: textColor ?? Colors.white.withOpacity(0.95),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
        backgroundColor: backgroundColor ?? Colors.white.withOpacity(0.13),
        duration: duration,
        action: action,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        margin: const EdgeInsets.all(18.0),
        elevation: 0,
      ),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    show(
      context,
      message,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      textColor: Theme.of(context).colorScheme.onSecondary,
    );
  }

  static void showError(BuildContext context, String message) {
    show(
      context,
      message,
      backgroundColor: Theme.of(context).colorScheme.error,
      textColor: Theme.of(context).colorScheme.onError,
    );
  }
}
