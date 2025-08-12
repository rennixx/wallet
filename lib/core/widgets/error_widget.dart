import 'package:flutter/material.dart';

/// A simple error display widget with retry option.
class ErrorDisplayWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorDisplayWidget({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(color: Colors.red)),
          if (onRetry != null)
            ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
