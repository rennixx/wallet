import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../domain/card_model.dart';
import '../../domain/card_validator.dart';
import '../providers/card_provider.dart';
import 'package:wallet/core/ui/glass_container.dart';
import 'package:wallet/core/ui/glass_app_bar.dart';

/// Card form screen for adding/editing cards with validation and real-time feedback.
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardFormScreen extends ConsumerStatefulWidget {
  final CardModel? initialCard;
  const CardFormScreen({super.key, this.initialCard});

  @override
  @override
  ConsumerState<CardFormScreen> createState() => _CardFormScreenState();
}

class _CardFormScreenState extends ConsumerState<CardFormScreen> {
  String? _cardType;

  String _detectCardType(String number) {
    final sanitized = number.replaceAll(RegExp(r'\D'), '');
    if (sanitized.isEmpty) return '';
    switch (sanitized[0]) {
      case '4':
        return 'Visa';
      case '5':
        return 'MasterCard';
      case '3':
        return 'American Express';
      case '6':
        return 'Discover';
      default:
        return 'Unknown';
    }
  }

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _numberController;
  late TextEditingController _holderController;
  late TextEditingController _expiryController;
  late TextEditingController _cvvController;
  late TextEditingController _notesController;
  String _category = 'Personal';
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController(
      text: widget.initialCard?.cardNumber ?? '',
    );
    _holderController = TextEditingController(
      text: widget.initialCard?.cardHolder ?? '',
    );
    _expiryController = TextEditingController(
      text: widget.initialCard?.expiryDate ?? '',
    );
    _cvvController = TextEditingController(text: widget.initialCard?.cvv ?? '');
    _notesController = TextEditingController(
      text: widget.initialCard?.notes ?? '',
    );
    _category = widget.initialCard?.category ?? 'Personal';
    _cardType = _detectCardType(_numberController.text);
    _numberController.addListener(() {
      setState(() {
        _cardType = _detectCardType(_numberController.text);
      });
    });
  }

  @override
  void dispose() {
    _numberController.dispose();
    _holderController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _validate() {
    setState(() {
      _isValid = _formKey.currentState?.validate() ?? false;
    });
  }

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final card = CardModel(
        id: widget.initialCard?.id ?? UniqueKey().toString(),
        cardNumber: _numberController.text.replaceAll(RegExp(r'\D'), ''),
        cardHolder: _holderController.text.trim(),
        expiryDate: _expiryController.text.trim(),
        cvv: _cvvController.text.trim(),
        category: _category,
        notes:
            _notesController.text.trim().isEmpty
                ? null
                : _notesController.text.trim(),
        createdAt: widget.initialCard?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );
      // Save card using provider
      final notifier = ref.read(cardListProvider.notifier);
      if (widget.initialCard == null) {
        await notifier.addCard(card);
      } else {
        await notifier.updateCard(card);
      }
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: GlassAppBar(
        title: widget.initialCard == null ? 'Add Card' : 'Edit Card',
        borderRadius: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GlassContainer(
              borderRadius: 24,
              blur: 24,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.08),
                  Colors.white.withOpacity(0.03),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                onChanged: _validate,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _numberController,
                      decoration: InputDecoration(
                        labelText: 'Card Number',
                        suffixText:
                            _cardType?.isNotEmpty == true ? _cardType : null,
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 19, // 16 digits + 3 spaces
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CardNumberInputFormatter(),
                      ],
                      onChanged: (val) {
                        setState(() {
                          _cardType = _detectCardType(val);
                        });
                      },
                      validator: (v) {
                        final raw = v?.replaceAll(RegExp(r'\D'), '') ?? '';
                        return CardValidator.isValidCardNumber(raw)
                            ? null
                            : 'Card number must be 16 digits and valid';
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _holderController,
                      decoration: const InputDecoration(
                        labelText: 'Card Holder',
                      ),
                      validator:
                          (v) => (v?.isNotEmpty ?? false) ? null : 'Required',
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _expiryController,
                      decoration: const InputDecoration(
                        labelText: 'Expiry (MM/YY)',
                      ),
                      validator:
                          (v) =>
                              CardValidator.isValidExpiry(v ?? '')
                                  ? null
                                  : 'Invalid expiry',
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _cvvController,
                      decoration: const InputDecoration(labelText: 'CVV'),
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      validator:
                          (v) =>
                              CardValidator.isValidCvv(v ?? '')
                                  ? null
                                  : 'CVV must be 3 digits',
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(labelText: 'Notes'),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _category,
                      items: const [
                        DropdownMenuItem(
                          value: 'Personal',
                          child: Text('Personal'),
                        ),
                        DropdownMenuItem(
                          value: 'Business',
                          child: Text('Business'),
                        ),
                        DropdownMenuItem(value: 'Other', child: Text('Other')),
                      ],
                      onChanged:
                          (v) => setState(() => _category = v ?? 'Personal'),
                      decoration: const InputDecoration(labelText: 'Category'),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _isValid ? _submit : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.12),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        child: Text(
                          widget.initialCard == null
                              ? 'Add Card'
                              : 'Save Changes',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Formatter for card number: adds a space every 4 digits.
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\\D'), '');
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      buffer.write(digits[i]);
      if ((i + 1) % 4 == 0 && i + 1 != digits.length) {
        buffer.write(' ');
      }
    }
    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
