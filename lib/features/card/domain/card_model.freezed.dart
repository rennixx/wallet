// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CardModel _$CardModelFromJson(Map<String, dynamic> json) {
  return _CardModel.fromJson(json);
}

/// @nodoc
mixin _$CardModel {
  String get id => throw _privateConstructorUsedError;
  String get cardNumber => throw _privateConstructorUsedError;
  String get cardHolder => throw _privateConstructorUsedError;
  String get expiryDate => throw _privateConstructorUsedError;
  String get cvv => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  DateTime? get lastUsed => throw _privateConstructorUsedError;

  /// Serializes this CardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardModelCopyWith<CardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardModelCopyWith<$Res> {
  factory $CardModelCopyWith(CardModel value, $Res Function(CardModel) then) =
      _$CardModelCopyWithImpl<$Res, CardModel>;
  @useResult
  $Res call({
    String id,
    String cardNumber,
    String cardHolder,
    String expiryDate,
    String cvv,
    String category,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool isFavorite,
    DateTime? lastUsed,
  });
}

/// @nodoc
class _$CardModelCopyWithImpl<$Res, $Val extends CardModel>
    implements $CardModelCopyWith<$Res> {
  _$CardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cardNumber = null,
    Object? cardHolder = null,
    Object? expiryDate = null,
    Object? cvv = null,
    Object? category = null,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isFavorite = null,
    Object? lastUsed = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            cardNumber:
                null == cardNumber
                    ? _value.cardNumber
                    : cardNumber // ignore: cast_nullable_to_non_nullable
                        as String,
            cardHolder:
                null == cardHolder
                    ? _value.cardHolder
                    : cardHolder // ignore: cast_nullable_to_non_nullable
                        as String,
            expiryDate:
                null == expiryDate
                    ? _value.expiryDate
                    : expiryDate // ignore: cast_nullable_to_non_nullable
                        as String,
            cvv:
                null == cvv
                    ? _value.cvv
                    : cvv // ignore: cast_nullable_to_non_nullable
                        as String,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as String,
            notes:
                freezed == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            isFavorite:
                null == isFavorite
                    ? _value.isFavorite
                    : isFavorite // ignore: cast_nullable_to_non_nullable
                        as bool,
            lastUsed:
                freezed == lastUsed
                    ? _value.lastUsed
                    : lastUsed // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CardModelImplCopyWith<$Res>
    implements $CardModelCopyWith<$Res> {
  factory _$$CardModelImplCopyWith(
    _$CardModelImpl value,
    $Res Function(_$CardModelImpl) then,
  ) = __$$CardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String cardNumber,
    String cardHolder,
    String expiryDate,
    String cvv,
    String category,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool isFavorite,
    DateTime? lastUsed,
  });
}

/// @nodoc
class __$$CardModelImplCopyWithImpl<$Res>
    extends _$CardModelCopyWithImpl<$Res, _$CardModelImpl>
    implements _$$CardModelImplCopyWith<$Res> {
  __$$CardModelImplCopyWithImpl(
    _$CardModelImpl _value,
    $Res Function(_$CardModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cardNumber = null,
    Object? cardHolder = null,
    Object? expiryDate = null,
    Object? cvv = null,
    Object? category = null,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isFavorite = null,
    Object? lastUsed = freezed,
  }) {
    return _then(
      _$CardModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        cardNumber:
            null == cardNumber
                ? _value.cardNumber
                : cardNumber // ignore: cast_nullable_to_non_nullable
                    as String,
        cardHolder:
            null == cardHolder
                ? _value.cardHolder
                : cardHolder // ignore: cast_nullable_to_non_nullable
                    as String,
        expiryDate:
            null == expiryDate
                ? _value.expiryDate
                : expiryDate // ignore: cast_nullable_to_non_nullable
                    as String,
        cvv:
            null == cvv
                ? _value.cvv
                : cvv // ignore: cast_nullable_to_non_nullable
                    as String,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as String,
        notes:
            freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        isFavorite:
            null == isFavorite
                ? _value.isFavorite
                : isFavorite // ignore: cast_nullable_to_non_nullable
                    as bool,
        lastUsed:
            freezed == lastUsed
                ? _value.lastUsed
                : lastUsed // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CardModelImpl implements _CardModel {
  const _$CardModelImpl({
    required this.id,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.cvv,
    required this.category,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.isFavorite = false,
    this.lastUsed,
  });

  factory _$CardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardModelImplFromJson(json);

  @override
  final String id;
  @override
  final String cardNumber;
  @override
  final String cardHolder;
  @override
  final String expiryDate;
  @override
  final String cvv;
  @override
  final String category;
  @override
  final String? notes;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  final DateTime? lastUsed;

  @override
  String toString() {
    return 'CardModel(id: $id, cardNumber: $cardNumber, cardHolder: $cardHolder, expiryDate: $expiryDate, cvv: $cvv, category: $category, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, isFavorite: $isFavorite, lastUsed: $lastUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.cardHolder, cardHolder) ||
                other.cardHolder == cardHolder) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.cvv, cvv) || other.cvv == cvv) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.lastUsed, lastUsed) ||
                other.lastUsed == lastUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    cardNumber,
    cardHolder,
    expiryDate,
    cvv,
    category,
    notes,
    createdAt,
    updatedAt,
    isFavorite,
    lastUsed,
  );

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardModelImplCopyWith<_$CardModelImpl> get copyWith =>
      __$$CardModelImplCopyWithImpl<_$CardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardModelImplToJson(this);
  }
}

abstract class _CardModel implements CardModel {
  const factory _CardModel({
    required final String id,
    required final String cardNumber,
    required final String cardHolder,
    required final String expiryDate,
    required final String cvv,
    required final String category,
    final String? notes,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final bool isFavorite,
    final DateTime? lastUsed,
  }) = _$CardModelImpl;

  factory _CardModel.fromJson(Map<String, dynamic> json) =
      _$CardModelImpl.fromJson;

  @override
  String get id;
  @override
  String get cardNumber;
  @override
  String get cardHolder;
  @override
  String get expiryDate;
  @override
  String get cvv;
  @override
  String get category;
  @override
  String? get notes;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool get isFavorite;
  @override
  DateTime? get lastUsed;

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardModelImplCopyWith<_$CardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
