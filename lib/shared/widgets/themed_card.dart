import 'package:flutter/material.dart';
import 'package:wallet/core/ui/glass_container.dart';

class ThemedCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  const ThemedCard({
    super.key,
    required this.child,
    this.padding,
    this.elevation,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius:
          (borderRadius is BorderRadius)
              ? (borderRadius as BorderRadius).topLeft.x
              : 18.0,
      blur: 18,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.13),
          Colors.white.withOpacity(0.07),
        ],
      ),
      padding: padding ?? const EdgeInsets.all(16.0),
      child: child,
    );
  }
}
