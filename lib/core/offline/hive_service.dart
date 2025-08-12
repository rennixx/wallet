import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:wallet/features/card/domain/card_model.dart';
import 'package:wallet/features/card/domain/card_model_adapter.dart';

/// Hive service for local encrypted card storage.
class HiveService {
  static const String cardBoxName = 'cards';
  static Box? _cardBox;

  /// Initialize Hive with encryption and register adapters.
  static Future<void> init(Uint8List encryptionKey) async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(CardModelAdapter());
    }
    _cardBox = await Hive.openBox<CardModel>(
      cardBoxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  static Box<CardModel> get cardBox => _cardBox as Box<CardModel>;

  /// Add or update a card locally
  static Future<void> putCard(CardModel card) async {
    await cardBox.put(card.id, card);
  }

  /// Delete a card locally
  static Future<void> deleteCard(String id) async {
    await cardBox.delete(id);
  }

  /// Get all cards
  static List<CardModel> getAllCards() {
    return cardBox.values.toList();
  }
}
