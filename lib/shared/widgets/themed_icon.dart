import 'package:flutter/material.dart';

class ThemedIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;

  const ThemedIcon({super.key, required this.icon, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, size: size, color: color ?? Colors.white),
    );
  }
}
