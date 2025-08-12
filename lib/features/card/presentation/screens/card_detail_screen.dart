import 'package:flutter/material.dart';
import 'package:wallet/core/ui/glass_app_bar.dart';
import '../../domain/card_model.dart';

/// Card details screen with masking/unmasking and security features.
class CardDetailScreen extends StatefulWidget {
  final CardModel card;
  const CardDetailScreen({super.key, required this.card});

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {
  bool _isMasked = true;

  void _toggleMask() async {
    // TODO: Add biometric authentication before unmasking
    setState(() => _isMasked = !_isMasked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlassAppBar(title: 'Card Details', borderRadius: 0),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Card Holder: ${widget.card.cardHolder}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Card Number: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  _isMasked
                      ? '**** **** **** ${widget.card.cardNumber.substring(widget.card.cardNumber.length - 4)}'
                      : widget.card.cardNumber,
                ),
                IconButton(
                  icon: Icon(
                    _isMasked ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _toggleMask,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'CVV: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(_isMasked ? '***' : widget.card.cvv),
              ],
            ),
            const SizedBox(height: 16),
            Text('Expiry: ${widget.card.expiryDate}'),
            const SizedBox(height: 16),
            Text('Category: ${widget.card.category}'),
            const SizedBox(height: 16),
            Text('Notes: ${widget.card.notes ?? "-"}'),
            const Spacer(),
            Row(
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.copy),
                  label: const Text('Copy Number'),
                  onPressed: () {
                    /* TODO: Secure clipboard copy */
                  },
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    /* TODO: Secure delete */
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
