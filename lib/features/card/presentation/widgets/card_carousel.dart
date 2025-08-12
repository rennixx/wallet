import 'package:flutter/material.dart';
import '../../domain/card_model.dart';
import 'card_widget.dart';
import 'package:wallet/core/ui/glass_container.dart';

/// A carousel widget for displaying a list of cards with smooth, physics-based animations.
class CardCarousel extends StatefulWidget {
  final List<CardModel> cards;
  final int initialIndex;
  final ValueChanged<int>? onPageChanged;
  final void Function(CardModel)? onFavorite;

  const CardCarousel({
    super.key,
    required this.cards,
    this.initialIndex = 0,
    this.onPageChanged,
    this.onFavorite,
  });

  @override
  State<CardCarousel> createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  late final PageController _controller;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _controller = PageController(
      initialPage: _currentIndex,
      viewportFraction: 0.85,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GlassContainer(
          borderRadius: 32,
          blur: 24,
          padding: const EdgeInsets.symmetric(vertical: 18),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.13),
              Colors.white.withOpacity(0.07),
            ],
          ),
          child: SizedBox(
            height: 220,
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.cards.length,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
                widget.onPageChanged?.call(index);
              },
              itemBuilder: (context, index) {
                final card = widget.cards[index];
                return AnimatedScale(
                  scale: index == _currentIndex ? 1.0 : 0.92,
                  duration: const Duration(milliseconds: 300),
                  child: CardWidget(
                    card: card,
                    onFavorite:
                        widget.onFavorite != null
                            ? () => widget.onFavorite!(card)
                            : null,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildPageIndicator() {
    if (widget.cards.length <= 1) return const SizedBox.shrink();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.cards.length, (i) {
        final isActive = i == _currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 18 : 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient:
                isActive
                    ? const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF10B981)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                    : null,
            color: isActive ? null : Colors.white.withOpacity(0.18),
            boxShadow:
                isActive
                    ? [
                      BoxShadow(
                        color: const Color(0xFF6366F1).withOpacity(0.18),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                    : null,
          ),
        );
      }),
    );
  }
}
