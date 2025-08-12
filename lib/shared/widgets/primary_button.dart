import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.padding,
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.white.withOpacity(0.13),
        foregroundColor: foregroundColor ?? Colors.white,
        shadowColor: Colors.transparent,
        padding:
            padding ??
            const EdgeInsets.symmetric(vertical: 18.0, horizontal: 28.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        minimumSize: const Size(double.infinity, 52),
        elevation: 0,
      ),
      child:
          isLoading
              ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: foregroundColor ?? Colors.white,
                  strokeWidth: 2,
                ),
              )
              : Text(
                text,
                style:
                    textStyle ??
                    const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
              ),
    );
  }
}
