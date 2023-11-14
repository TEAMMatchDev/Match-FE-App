// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_pay.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchPay _$MatchPayFromJson(Map<String, dynamic> json) {
  return _MatchPay.fromJson(json);
}

/// @nodoc
mixin _$MatchPay {
  String get imgUrl => throw _privateConstructorUsedError;
  String get projectTitle => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get regularPayId => throw _privateConstructorUsedError;
  int get payDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchPayCopyWith<MatchPay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchPayCopyWith<$Res> {
  factory $MatchPayCopyWith(MatchPay value, $Res Function(MatchPay) then) =
      _$MatchPayCopyWithImpl<$Res, MatchPay>;
  @useResult
  $Res call(
      {String imgUrl,
      String projectTitle,
      int amount,
      int regularPayId,
      int payDate});
}

/// @nodoc
class _$MatchPayCopyWithImpl<$Res, $Val extends MatchPay>
    implements $MatchPayCopyWith<$Res> {
  _$MatchPayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgUrl = null,
    Object? projectTitle = null,
    Object? amount = null,
    Object? regularPayId = null,
    Object? payDate = null,
  }) {
    return _then(_value.copyWith(
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      projectTitle: null == projectTitle
          ? _value.projectTitle
          : projectTitle // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      regularPayId: null == regularPayId
          ? _value.regularPayId
          : regularPayId // ignore: cast_nullable_to_non_nullable
              as int,
      payDate: null == payDate
          ? _value.payDate
          : payDate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchPayImplCopyWith<$Res>
    implements $MatchPayCopyWith<$Res> {
  factory _$$MatchPayImplCopyWith(
          _$MatchPayImpl value, $Res Function(_$MatchPayImpl) then) =
      __$$MatchPayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imgUrl,
      String projectTitle,
      int amount,
      int regularPayId,
      int payDate});
}

/// @nodoc
class __$$MatchPayImplCopyWithImpl<$Res>
    extends _$MatchPayCopyWithImpl<$Res, _$MatchPayImpl>
    implements _$$MatchPayImplCopyWith<$Res> {
  __$$MatchPayImplCopyWithImpl(
      _$MatchPayImpl _value, $Res Function(_$MatchPayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgUrl = null,
    Object? projectTitle = null,
    Object? amount = null,
    Object? regularPayId = null,
    Object? payDate = null,
  }) {
    return _then(_$MatchPayImpl(
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      projectTitle: null == projectTitle
          ? _value.projectTitle
          : projectTitle // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      regularPayId: null == regularPayId
          ? _value.regularPayId
          : regularPayId // ignore: cast_nullable_to_non_nullable
              as int,
      payDate: null == payDate
          ? _value.payDate
          : payDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchPayImpl with DiagnosticableTreeMixin implements _MatchPay {
  const _$MatchPayImpl(
      {required this.imgUrl,
      required this.projectTitle,
      required this.amount,
      required this.regularPayId,
      required this.payDate});

  factory _$MatchPayImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchPayImplFromJson(json);

  @override
  final String imgUrl;
  @override
  final String projectTitle;
  @override
  final int amount;
  @override
  final int regularPayId;
  @override
  final int payDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchPay(imgUrl: $imgUrl, projectTitle: $projectTitle, amount: $amount, regularPayId: $regularPayId, payDate: $payDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchPay'))
      ..add(DiagnosticsProperty('imgUrl', imgUrl))
      ..add(DiagnosticsProperty('projectTitle', projectTitle))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('regularPayId', regularPayId))
      ..add(DiagnosticsProperty('payDate', payDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchPayImpl &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.projectTitle, projectTitle) ||
                other.projectTitle == projectTitle) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.regularPayId, regularPayId) ||
                other.regularPayId == regularPayId) &&
            (identical(other.payDate, payDate) || other.payDate == payDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, imgUrl, projectTitle, amount, regularPayId, payDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchPayImplCopyWith<_$MatchPayImpl> get copyWith =>
      __$$MatchPayImplCopyWithImpl<_$MatchPayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchPayImplToJson(
      this,
    );
  }
}

abstract class _MatchPay implements MatchPay {
  const factory _MatchPay(
      {required final String imgUrl,
      required final String projectTitle,
      required final int amount,
      required final int regularPayId,
      required final int payDate}) = _$MatchPayImpl;

  factory _MatchPay.fromJson(Map<String, dynamic> json) =
      _$MatchPayImpl.fromJson;

  @override
  String get imgUrl;
  @override
  String get projectTitle;
  @override
  int get amount;
  @override
  int get regularPayId;
  @override
  int get payDate;
  @override
  @JsonKey(ignore: true)
  _$$MatchPayImplCopyWith<_$MatchPayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
