import 'dart:ui';

import 'package:flutter/material.dart';

class ThemedLinearProgressIndicator extends StatelessWidget {
  final double? value;
  final Color? color;
  final Color? backgroundColor;

  const ThemedLinearProgressIndicator({
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
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: Colors.white.withOpacity(0.18),
              width: 1.2,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: SizedBox(
              height: 10,
              child: LinearProgressIndicator(
                value: value,
                valueColor: AlwaysStoppedAnimation<Color>(
                  color ?? const Color(0xFF6366F1),
                ),
                backgroundColor:
                    backgroundColor ?? Colors.white.withOpacity(0.13),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
