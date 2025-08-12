import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wallet/core/security/encryption/aes_encryption_service.dart';
import 'package:wallet/features/card/domain/card_model.dart';

/// Service for encrypted CRUD operations on cards with Supabase.
class CardSupabaseService {
  final SupabaseClient client;
  final AESEncryptionService encryptionService;

  CardSupabaseService({required this.client, required this.encryptionService});

  Future<List<CardModel>> fetchCards() async {
    final data = await client.from('cards').select();
    return (data as List)
        .whereType<Map<String, dynamic>>()
        .map((json) => CardModel.fromJson(_decryptCardJson(json)))
        .toList();
  }

  Future<void> addCard(CardModel card) async {
    final encrypted = _encryptCardJson(card.toJson());
    await client.from('cards').insert(encrypted);
  }

  Future<void> updateCard(CardModel card) async {
    final encrypted = _encryptCardJson(card.toJson());
    await client.from('cards').update(encrypted).eq('id', card.id);
  }

  Future<void> deleteCard(String id) async {
    await client.from('cards').delete().eq('id', id);
  }

  Map<String, dynamic> _encryptCardJson(Map<String, dynamic> json) {
    // Encrypt sensitive fields
    json['cardNumber'] = encryptionService.encryptText(json['cardNumber']);
    json['cvv'] = encryptionService.encryptText(json['cvv']);
    return json;
  }

  Map<String, dynamic> _decryptCardJson(Map<String, dynamic> json) {
    // Decrypt sensitive fields
    json['cardNumber'] = encryptionService.decryptText(json['cardNumber']);
    json['cvv'] = encryptionService.decryptText(json['cvv']);
    return json;
  }
}
