import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

/// Domain model for a payment card with serialization and encryption-ready fields.
@freezed
class CardModel with _$CardModel {
  const factory CardModel({
    required String id,
    required String cardNumber,
    required String cardHolder,
    required String expiryDate,
    required String cvv,
    required String category,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default(false) bool isFavorite,
    DateTime? lastUsed,
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
}
