// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pay.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pay _$PayFromJson(Map<String, dynamic> json) {
  return _Pay.fromJson(json);
}

/// @nodoc
mixin _$Pay {
  String get payDate => throw _privateConstructorUsedError;
  String get payStatus => throw _privateConstructorUsedError;
  String get payMethod => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get inherenceNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PayCopyWith<Pay> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayCopyWith<$Res> {
  factory $PayCopyWith(Pay value, $Res Function(Pay) then) =
      _$PayCopyWithImpl<$Res, Pay>;
  @useResult
  $Res call(
      {String payDate,
      String payStatus,
      String payMethod,
      String amount,
      String inherenceNumber});
}

/// @nodoc
class _$PayCopyWithImpl<$Res, $Val extends Pay> implements $PayCopyWith<$Res> {
  _$PayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payDate = null,
    Object? payStatus = null,
    Object? payMethod = null,
    Object? amount = null,
    Object? inherenceNumber = null,
  }) {
    return _then(_value.copyWith(
      payDate: null == payDate
          ? _value.payDate
          : payDate // ignore: cast_nullable_to_non_nullable
              as String,
      payStatus: null == payStatus
          ? _value.payStatus
          : payStatus // ignore: cast_nullable_to_non_nullable
              as String,
      payMethod: null == payMethod
          ? _value.payMethod
          : payMethod // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      inherenceNumber: null == inherenceNumber
          ? _value.inherenceNumber
          : inherenceNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayImplCopyWith<$Res> implements $PayCopyWith<$Res> {
  factory _$$PayImplCopyWith(_$PayImpl value, $Res Function(_$PayImpl) then) =
      __$$PayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String payDate,
      String payStatus,
      String payMethod,
      String amount,
      String inherenceNumber});
}

/// @nodoc
class __$$PayImplCopyWithImpl<$Res> extends _$PayCopyWithImpl<$Res, _$PayImpl>
    implements _$$PayImplCopyWith<$Res> {
  __$$PayImplCopyWithImpl(_$PayImpl _value, $Res Function(_$PayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payDate = null,
    Object? payStatus = null,
    Object? payMethod = null,
    Object? amount = null,
    Object? inherenceNumber = null,
  }) {
    return _then(_$PayImpl(
      payDate: null == payDate
          ? _value.payDate
          : payDate // ignore: cast_nullable_to_non_nullable
              as String,
      payStatus: null == payStatus
          ? _value.payStatus
          : payStatus // ignore: cast_nullable_to_non_nullable
              as String,
      payMethod: null == payMethod
          ? _value.payMethod
          : payMethod // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      inherenceNumber: null == inherenceNumber
          ? _value.inherenceNumber
          : inherenceNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayImpl with DiagnosticableTreeMixin implements _Pay {
  const _$PayImpl(
      {required this.payDate,
      required this.payStatus,
      required this.payMethod,
      required this.amount,
      required this.inherenceNumber});

  factory _$PayImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayImplFromJson(json);

  @override
  final String payDate;
  @override
  final String payStatus;
  @override
  final String payMethod;
  @override
  final String amount;
  @override
  final String inherenceNumber;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Pay(payDate: $payDate, payStatus: $payStatus, payMethod: $payMethod, amount: $amount, inherenceNumber: $inherenceNumber)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Pay'))
      ..add(DiagnosticsProperty('payDate', payDate))
      ..add(DiagnosticsProperty('payStatus', payStatus))
      ..add(DiagnosticsProperty('payMethod', payMethod))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('inherenceNumber', inherenceNumber));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayImpl &&
            (identical(other.payDate, payDate) || other.payDate == payDate) &&
            (identical(other.payStatus, payStatus) ||
                other.payStatus == payStatus) &&
            (identical(other.payMethod, payMethod) ||
                other.payMethod == payMethod) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.inherenceNumber, inherenceNumber) ||
                other.inherenceNumber == inherenceNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, payDate, payStatus, payMethod, amount, inherenceNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayImplCopyWith<_$PayImpl> get copyWith =>
      __$$PayImplCopyWithImpl<_$PayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayImplToJson(
      this,
    );
  }
}

abstract class _Pay implements Pay {
  const factory _Pay(
      {required final String payDate,
      required final String payStatus,
      required final String payMethod,
      required final String amount,
      required final String inherenceNumber}) = _$PayImpl;

  factory _Pay.fromJson(Map<String, dynamic> json) = _$PayImpl.fromJson;

  @override
  String get payDate;
  @override
  String get payStatus;
  @override
  String get payMethod;
  @override
  String get amount;
  @override
  String get inherenceNumber;
  @override
  @JsonKey(ignore: true)
  _$$PayImplCopyWith<_$PayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
