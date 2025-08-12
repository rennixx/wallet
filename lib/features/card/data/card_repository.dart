import '../domain/card_model.dart';

/// Abstract repository for card CRUD operations.
abstract class CardRepository {
  Future<List<CardModel>> getCards();
  Future<CardModel> getCardById(String id);
  Future<void> addCard(CardModel card);
  Future<void> updateCard(CardModel card);
  Future<void> deleteCard(String id);
}
