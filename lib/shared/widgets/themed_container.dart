import 'package:flutter/material.dart';
import 'package:wallet/core/ui/glass_container.dart';

class ThemedContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;

  const ThemedContainer({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.decoration,
    this.width,
    this.height,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: 18,
      blur: 18,
      padding: padding,
      margin: margin,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.13),
          Colors.white.withOpacity(0.07),
        ],
      ),
      child: child ?? const SizedBox.shrink(),
    );
  }
}
