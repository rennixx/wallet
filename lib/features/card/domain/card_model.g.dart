// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardModelImpl _$$CardModelImplFromJson(Map<String, dynamic> json) =>
    _$CardModelImpl(
      id: json['id'] as String,
      cardNumber: json['cardNumber'] as String,
      cardHolder: json['cardHolder'] as String,
      expiryDate: json['expiryDate'] as String,
      cvv: json['cvv'] as String,
      category: json['category'] as String,
      notes: json['notes'] as String?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
      isFavorite: json['isFavorite'] as bool? ?? false,
      lastUsed:
          json['lastUsed'] == null
              ? null
              : DateTime.parse(json['lastUsed'] as String),
    );

Map<String, dynamic> _$$CardModelImplToJson(_$CardModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardNumber': instance.cardNumber,
      'cardHolder': instance.cardHolder,
      'expiryDate': instance.expiryDate,
      'cvv': instance.cvv,
      'category': instance.category,
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isFavorite': instance.isFavorite,
      'lastUsed': instance.lastUsed?.toIso8601String(),
    };
