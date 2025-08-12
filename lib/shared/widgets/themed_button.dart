import 'package:flutter/material.dart';

class ThemedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final Widget? icon;

  const ThemedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style:
          style ??
          ElevatedButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.13),
            foregroundColor: Colors.white,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            textStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.1,
            ),
            elevation: 0,
          ),
      child:
          icon != null
              ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [icon!, const SizedBox(width: 10), Text(text)],
              )
              : Text(text),
    );
  }
}
