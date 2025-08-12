import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet/features/card/domain/card_model.dart';
import 'package:wallet/core/security/audit_logger.dart';
import 'package:wallet/features/card/data/card_supabase_service.dart';
import 'package:wallet/core/network/supabase_client.dart';
import 'package:wallet/core/security/encryption/aes_encryption_service.dart';

/// Provider for CardListNotifier, manages the list of cards with encryption and Supabase.
final cardListProvider = StateNotifierProvider<
  CardListNotifier,
  AsyncValue<List<CardModel>>
>((ref) {
  // TODO: Replace with secure key/iv management
  final encryptionService = AESEncryptionService(
    base64Key:
        'bW9ja2tleW1vY2trZXltb2Nra2V5bW9ja2tleW1vY2trZXk=', // 32 bytes base64
    base64Iv: 'bW9ja2l2bW9ja2l2', // 16 bytes base64
  );
  final supabase = SupabaseClientProvider().client;
  final service = CardSupabaseService(
    client: supabase,
    encryptionService: encryptionService,
  );
  return CardListNotifier(service);
});

/// State notifier for managing card list and operations.
class CardListNotifier extends StateNotifier<AsyncValue<List<CardModel>>> {
  final CardSupabaseService service;

  CardListNotifier(this.service) : super(const AsyncValue.loading()) {
    loadCards();
  }

  Future<void> loadCards() async {
    state = const AsyncValue.loading();
    try {
      final cards = await service.fetchCards();
      state = AsyncValue.data(cards);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addCard(CardModel card) async {
    try {
      await service.addCard(card);
      await AuditLogger.log('add_card', cardId: card.id, details: 'Card added');
      await loadCards();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateCard(CardModel card) async {
    try {
      await service.updateCard(card);
      await AuditLogger.log(
        'update_card',
        cardId: card.id,
        details: 'Card updated',
      );
      await loadCards();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteCard(String id) async {
    try {
      await service.deleteCard(id);
      await AuditLogger.log('delete_card', cardId: id, details: 'Card deleted');
      await loadCards();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Toggle favorite status for a card
  Future<void> toggleFavorite(CardModel card) async {
    final updated = card.copyWith(isFavorite: !card.isFavorite);
    await updateCard(updated);
  }

  /// Mark a card as recently used
  Future<void> markUsed(CardModel card) async {
    final updated = card.copyWith(lastUsed: DateTime.now());
    await updateCard(updated);
  }
}
