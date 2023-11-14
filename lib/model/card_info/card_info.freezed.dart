// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardInfo _$CardInfoFromJson(Map<String, dynamic> json) {
  return _CardInfo.fromJson(json);
}

/// @nodoc
mixin _$CardInfo {
  int get id => throw _privateConstructorUsedError;
  String get cardCode => throw _privateConstructorUsedError;
  String? get cardName => throw _privateConstructorUsedError;
  String get cardNo => throw _privateConstructorUsedError;
  String get cardAbleStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardInfoCopyWith<CardInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardInfoCopyWith<$Res> {
  factory $CardInfoCopyWith(CardInfo value, $Res Function(CardInfo) then) =
      _$CardInfoCopyWithImpl<$Res, CardInfo>;
  @useResult
  $Res call(
      {int id,
      String cardCode,
      String? cardName,
      String cardNo,
      String cardAbleStatus});
}

/// @nodoc
class _$CardInfoCopyWithImpl<$Res, $Val extends CardInfo>
    implements $CardInfoCopyWith<$Res> {
  _$CardInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cardCode = null,
    Object? cardName = freezed,
    Object? cardNo = null,
    Object? cardAbleStatus = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cardCode: null == cardCode
          ? _value.cardCode
          : cardCode // ignore: cast_nullable_to_non_nullable
              as String,
      cardName: freezed == cardName
          ? _value.cardName
          : cardName // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNo: null == cardNo
          ? _value.cardNo
          : cardNo // ignore: cast_nullable_to_non_nullable
              as String,
      cardAbleStatus: null == cardAbleStatus
          ? _value.cardAbleStatus
          : cardAbleStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardInfoImplCopyWith<$Res>
    implements $CardInfoCopyWith<$Res> {
  factory _$$CardInfoImplCopyWith(
          _$CardInfoImpl value, $Res Function(_$CardInfoImpl) then) =
      __$$CardInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String cardCode,
      String? cardName,
      String cardNo,
      String cardAbleStatus});
}

/// @nodoc
class __$$CardInfoImplCopyWithImpl<$Res>
    extends _$CardInfoCopyWithImpl<$Res, _$CardInfoImpl>
    implements _$$CardInfoImplCopyWith<$Res> {
  __$$CardInfoImplCopyWithImpl(
      _$CardInfoImpl _value, $Res Function(_$CardInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cardCode = null,
    Object? cardName = freezed,
    Object? cardNo = null,
    Object? cardAbleStatus = null,
  }) {
    return _then(_$CardInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cardCode: null == cardCode
          ? _value.cardCode
          : cardCode // ignore: cast_nullable_to_non_nullable
              as String,
      cardName: freezed == cardName
          ? _value.cardName
          : cardName // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNo: null == cardNo
          ? _value.cardNo
          : cardNo // ignore: cast_nullable_to_non_nullable
              as String,
      cardAbleStatus: null == cardAbleStatus
          ? _value.cardAbleStatus
          : cardAbleStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardInfoImpl implements _CardInfo {
  const _$CardInfoImpl(
      {required this.id,
      required this.cardCode,
      required this.cardName,
      required this.cardNo,
      required this.cardAbleStatus});

  factory _$CardInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String cardCode;
  @override
  final String? cardName;
  @override
  final String cardNo;
  @override
  final String cardAbleStatus;

  @override
  String toString() {
    return 'CardInfo(id: $id, cardCode: $cardCode, cardName: $cardName, cardNo: $cardNo, cardAbleStatus: $cardAbleStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cardCode, cardCode) ||
                other.cardCode == cardCode) &&
            (identical(other.cardName, cardName) ||
                other.cardName == cardName) &&
            (identical(other.cardNo, cardNo) || other.cardNo == cardNo) &&
            (identical(other.cardAbleStatus, cardAbleStatus) ||
                other.cardAbleStatus == cardAbleStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, cardCode, cardName, cardNo, cardAbleStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardInfoImplCopyWith<_$CardInfoImpl> get copyWith =>
      __$$CardInfoImplCopyWithImpl<_$CardInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardInfoImplToJson(
      this,
    );
  }
}

abstract class _CardInfo implements CardInfo {
  const factory _CardInfo(
      {required final int id,
      required final String cardCode,
      required final String? cardName,
      required final String cardNo,
      required final String cardAbleStatus}) = _$CardInfoImpl;

  factory _CardInfo.fromJson(Map<String, dynamic> json) =
      _$CardInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get cardCode;
  @override
  String? get cardName;
  @override
  String get cardNo;
  @override
  String get cardAbleStatus;
  @override
  @JsonKey(ignore: true)
  _$$CardInfoImplCopyWith<_$CardInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
