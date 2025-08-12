import 'package:supabase_flutter/supabase_flutter.dart';
import '../domain/card_model.dart';
import 'card_repository.dart';

/// Supabase implementation of CardRepository with encryption.

import 'card_supabase_service.dart';
import 'package:wallet/core/security/encryption/aes_encryption_service.dart';

/// Supabase implementation of CardRepository with encryption.
class SupabaseCardRepository implements CardRepository {
  final CardSupabaseService _service;

  SupabaseCardRepository(
    SupabaseClient client,
    AESEncryptionService encryptionService,
  ) : _service = CardSupabaseService(
        client: client,
        encryptionService: encryptionService,
      );

  @override
  Future<List<CardModel>> getCards() async {
    return _service.fetchCards();
  }

  @override
  Future<CardModel> getCardById(String id) async {
    final cards = await _service.fetchCards();
    return cards.firstWhere((c) => c.id == id);
  }

  @override
  Future<void> addCard(CardModel card) async {
    await _service.addCard(card);
  }

  @override
  Future<void> updateCard(CardModel card) async {
    await _service.updateCard(card);
  }

  @override
  Future<void> deleteCard(String id) async {
    await _service.deleteCard(id);
  }
}
