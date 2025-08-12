import 'package:flutter/material.dart';
import 'package:wallet/core/ui/glass_container.dart';

/// Button to trigger OCR card scanning (Google ML Kit integration placeholder).
class CardOcrButton extends StatelessWidget {
  final VoidCallback onScan;
  const CardOcrButton({super.key, required this.onScan});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: 18,
      blur: 18,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      gradient: LinearGradient(
        colors: [
          const Color(0xFF6366F1).withOpacity(0.22),
          const Color(0xFF10B981).withOpacity(0.22),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      border: Border.all(
        color: const Color(0xFF6366F1).withOpacity(0.32),
        width: 2,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onScan,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.camera_alt, color: Colors.white, size: 22),
            const SizedBox(width: 10),
            Text(
              'Scan Card',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
