import 'dart:ui';
import 'package:flutter/material.dart';

/// A reusable glassmorphism container for premium surfaces.
class GlassContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blur;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Gradient? gradient;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  const GlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 16,
    this.blur = 20,
    this.padding,
    this.margin,
    this.gradient,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border:
            border ??
            Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        gradient:
            gradient ??
            LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.10),
                Colors.white.withOpacity(0.05),
              ],
            ),
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withOpacity(0.37),
                blurRadius: 32,
                offset: const Offset(0, 8),
              ),
            ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: child,
        ),
      ),
    );
  }
}
