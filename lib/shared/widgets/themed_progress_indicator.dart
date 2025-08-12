import 'dart:ui';

import 'package:flutter/material.dart';

class ThemedProgressIndicator extends StatelessWidget {
  final double? value;
  final Color? color;
  final Color? backgroundColor;

  const ThemedProgressIndicator({
    super.key,
    this.value,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: Colors.white.withOpacity(0.18),
              width: 1.5,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SizedBox(
              width: 44,
              height: 44,
              child: CircularProgressIndicator(
                value: value,
                valueColor: AlwaysStoppedAnimation<Color>(
                  color ?? const Color(0xFF6366F1),
                ),
                backgroundColor:
                    backgroundColor ?? Colors.white.withOpacity(0.13),
                strokeWidth: 4.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
