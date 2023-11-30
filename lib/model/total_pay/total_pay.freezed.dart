// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'total_pay.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TotalPay _$TotalPayFromJson(Map<String, dynamic> json) {
  return _TotalPay.fromJson(json);
}

/// @nodoc
mixin _$TotalPay {
  int get donationId => throw _privateConstructorUsedError;
  String get payDate => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get projectTitle => throw _privateConstructorUsedError;
  String get regularDate => throw _privateConstructorUsedError;
  String get regularPayStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TotalPayCopyWith<TotalPay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalPayCopyWith<$Res> {
  factory $TotalPayCopyWith(TotalPay value, $Res Function(TotalPay) then) =
      _$TotalPayCopyWithImpl<$Res, TotalPay>;
  @useResult
  $Res call(
      {int donationId,
      String payDate,
      String amount,
      String projectTitle,
      String regularDate,
      String regularPayStatus});
}

/// @nodoc
class _$TotalPayCopyWithImpl<$Res, $Val extends TotalPay>
    implements $TotalPayCopyWith<$Res> {
  _$TotalPayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? donationId = null,
    Object? payDate = null,
    Object? amount = null,
    Object? projectTitle = null,
    Object? regularDate = null,
    Object? regularPayStatus = null,
  }) {
    return _then(_value.copyWith(
      donationId: null == donationId
          ? _value.donationId
          : donationId // ignore: cast_nullable_to_non_nullable
              as int,
      payDate: null == payDate
          ? _value.payDate
          : payDate // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      projectTitle: null == projectTitle
          ? _value.projectTitle
          : projectTitle // ignore: cast_nullable_to_non_nullable
              as String,
      regularDate: null == regularDate
          ? _value.regularDate
          : regularDate // ignore: cast_nullable_to_non_nullable
              as String,
      regularPayStatus: null == regularPayStatus
          ? _value.regularPayStatus
          : regularPayStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TotalPayImplCopyWith<$Res>
    implements $TotalPayCopyWith<$Res> {
  factory _$$TotalPayImplCopyWith(
          _$TotalPayImpl value, $Res Function(_$TotalPayImpl) then) =
      __$$TotalPayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int donationId,
      String payDate,
      String amount,
      String projectTitle,
      String regularDate,
      String regularPayStatus});
}

/// @nodoc
class __$$TotalPayImplCopyWithImpl<$Res>
    extends _$TotalPayCopyWithImpl<$Res, _$TotalPayImpl>
    implements _$$TotalPayImplCopyWith<$Res> {
  __$$TotalPayImplCopyWithImpl(
      _$TotalPayImpl _value, $Res Function(_$TotalPayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? donationId = null,
    Object? payDate = null,
    Object? amount = null,
    Object? projectTitle = null,
    Object? regularDate = null,
    Object? regularPayStatus = null,
  }) {
    return _then(_$TotalPayImpl(
      donationId: null == donationId
          ? _value.donationId
          : donationId // ignore: cast_nullable_to_non_nullable
              as int,
      payDate: null == payDate
          ? _value.payDate
          : payDate // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      projectTitle: null == projectTitle
          ? _value.projectTitle
          : projectTitle // ignore: cast_nullable_to_non_nullable
              as String,
      regularDate: null == regularDate
          ? _value.regularDate
          : regularDate // ignore: cast_nullable_to_non_nullable
              as String,
      regularPayStatus: null == regularPayStatus
          ? _value.regularPayStatus
          : regularPayStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TotalPayImpl with DiagnosticableTreeMixin implements _TotalPay {
  const _$TotalPayImpl(
      {required this.donationId,
      required this.payDate,
      required this.amount,
      required this.projectTitle,
      required this.regularDate,
      required this.regularPayStatus});

  factory _$TotalPayImpl.fromJson(Map<String, dynamic> json) =>
      _$$TotalPayImplFromJson(json);

  @override
  final int donationId;
  @override
  final String payDate;
  @override
  final String amount;
  @override
  final String projectTitle;
  @override
  final String regularDate;
  @override
  final String regularPayStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TotalPay(donationId: $donationId, payDate: $payDate, amount: $amount, projectTitle: $projectTitle, regularDate: $regularDate, regularPayStatus: $regularPayStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TotalPay'))
      ..add(DiagnosticsProperty('donationId', donationId))
      ..add(DiagnosticsProperty('payDate', payDate))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('projectTitle', projectTitle))
      ..add(DiagnosticsProperty('regularDate', regularDate))
      ..add(DiagnosticsProperty('regularPayStatus', regularPayStatus));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotalPayImpl &&
            (identical(other.donationId, donationId) ||
                other.donationId == donationId) &&
            (identical(other.payDate, payDate) || other.payDate == payDate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.projectTitle, projectTitle) ||
                other.projectTitle == projectTitle) &&
            (identical(other.regularDate, regularDate) ||
                other.regularDate == regularDate) &&
            (identical(other.regularPayStatus, regularPayStatus) ||
                other.regularPayStatus == regularPayStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, donationId, payDate, amount,
      projectTitle, regularDate, regularPayStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TotalPayImplCopyWith<_$TotalPayImpl> get copyWith =>
      __$$TotalPayImplCopyWithImpl<_$TotalPayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TotalPayImplToJson(
      this,
    );
  }
}

abstract class _TotalPay implements TotalPay {
  const factory _TotalPay(
      {required final int donationId,
      required final String payDate,
      required final String amount,
      required final String projectTitle,
      required final String regularDate,
      required final String regularPayStatus}) = _$TotalPayImpl;

  factory _TotalPay.fromJson(Map<String, dynamic> json) =
      _$TotalPayImpl.fromJson;

  @override
  int get donationId;
  @override
  String get payDate;
  @override
  String get amount;
  @override
  String get projectTitle;
  @override
  String get regularDate;
  @override
  String get regularPayStatus;
  @override
  @JsonKey(ignore: true)
  _$$TotalPayImplCopyWith<_$TotalPayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
