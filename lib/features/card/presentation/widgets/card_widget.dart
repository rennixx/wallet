import 'package:flutter/material.dart';
import '../../domain/card_model.dart';
import 'package:wallet/core/ui/glass_container.dart';

/// A beautiful, animated card widget with front/back flip and masking.
class CardWidget extends StatefulWidget {
  final CardModel card;
  final bool isMasked;
  final VoidCallback? onFlip;
  final VoidCallback? onCopy;
  final VoidCallback? onFavorite;

  const CardWidget({
    super.key,
    required this.card,
    this.isMasked = true,
    this.onFlip,
    this.onCopy,
    this.onFavorite,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      _isFront = !_isFront;
    });
    widget.onFlip?.call();
  }

  String get _maskedNumber {
    final number = widget.card.cardNumber;
    if (widget.isMasked) {
      return number.replaceRange(
        0,
        number.length - 4,
        '*' * (number.length - 4),
      );
    }
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final isFront = _animation.value < 0.5;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(_animation.value * 3.1416),
            child: isFront ? _buildFront() : _buildBack(),
          );
        },
      ),
    );
  }

  Widget _buildFront() {
    return GlassContainer(
      borderRadius: 20,
      blur: 20,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.37),
          blurRadius: 32,
          offset: const Offset(0, 8),
        ),
        BoxShadow(
          color: Colors.white.withOpacity(0.05),
          blurRadius: 20,
          spreadRadius: 2,
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [const Color(0xFF2A2A2A), const Color(0xFF1A1A1A)],
      ),
      child: Container(
        width: 320,
        height: 200,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.card.cardHolder,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    widget.card.isFavorite ? Icons.star : Icons.star_border,
                    color:
                        widget.card.isFavorite
                            ? Color(0xFFF59E0B)
                            : Colors.white,
                  ),
                  onPressed: widget.onFavorite,
                  tooltip: widget.card.isFavorite ? 'Unfavorite' : 'Favorite',
                ),
              ],
            ),
            Text(
              _maskedNumber,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 2,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.w500,
                shadows: [Shadow(color: Colors.black54, blurRadius: 2)],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Exp: ${widget.card.expiryDate}',
                  style: const TextStyle(
                    color: Color(0xFFB0B0B0),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, color: Colors.white),
                  onPressed: widget.onCopy,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBack() {
    return GlassContainer(
      borderRadius: 20,
      blur: 20,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [const Color(0xFF2A2A2A), const Color(0xFF1A1A1A)],
      ),
      child: Container(
        width: 320,
        height: 200,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('CVV', style: TextStyle(color: Colors.white70)),
            Text(
              widget.isMasked ? '***' : widget.card.cvv,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
