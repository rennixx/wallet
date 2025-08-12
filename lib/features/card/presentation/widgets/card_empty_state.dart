import 'package:flutter/material.dart';
import 'package:wallet/core/ui/glass_container.dart';

/// Beautiful empty state for when no cards are present.
class CardEmptyState extends StatelessWidget {
  const CardEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        borderRadius: 32,
        blur: 28,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.13),
            Colors.white.withOpacity(0.07),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF6366F1).withOpacity(0.18),
                    const Color(0xFF10B981).withOpacity(0.18),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(18),
              child: const Icon(
                Icons.credit_card,
                size: 56,
                color: Color(0xFF6366F1),
                shadows: [
                  Shadow(
                    color: Colors.white24,
                    blurRadius: 12,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'No cards yet',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white.withOpacity(0.92),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Add your first card to get started!',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white.withOpacity(0.65),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
