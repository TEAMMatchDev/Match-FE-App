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
  String get donationDate => throw _privateConstructorUsedError;
  String get projectName => throw _privateConstructorUsedError;
  String get regularDate => throw _privateConstructorUsedError;
  String get donationStatus => throw _privateConstructorUsedError;
  String get regularStatus => throw _privateConstructorUsedError;

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
      String donationDate,
      String projectName,
      String regularDate,
      String donationStatus,
      String regularStatus});
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
    Object? donationDate = null,
    Object? projectName = null,
    Object? regularDate = null,
    Object? donationStatus = null,
    Object? regularStatus = null,
  }) {
    return _then(_value.copyWith(
      donationId: null == donationId
          ? _value.donationId
          : donationId // ignore: cast_nullable_to_non_nullable
              as int,
      donationDate: null == donationDate
          ? _value.donationDate
          : donationDate // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      regularDate: null == regularDate
          ? _value.regularDate
          : regularDate // ignore: cast_nullable_to_non_nullable
              as String,
      donationStatus: null == donationStatus
          ? _value.donationStatus
          : donationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      regularStatus: null == regularStatus
          ? _value.regularStatus
          : regularStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TotalPayCopyWith<$Res> implements $TotalPayCopyWith<$Res> {
  factory _$$_TotalPayCopyWith(
          _$_TotalPay value, $Res Function(_$_TotalPay) then) =
      __$$_TotalPayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int donationId,
      String donationDate,
      String projectName,
      String regularDate,
      String donationStatus,
      String regularStatus});
}

/// @nodoc
class __$$_TotalPayCopyWithImpl<$Res>
    extends _$TotalPayCopyWithImpl<$Res, _$_TotalPay>
    implements _$$_TotalPayCopyWith<$Res> {
  __$$_TotalPayCopyWithImpl(
      _$_TotalPay _value, $Res Function(_$_TotalPay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? donationId = null,
    Object? donationDate = null,
    Object? projectName = null,
    Object? regularDate = null,
    Object? donationStatus = null,
    Object? regularStatus = null,
  }) {
    return _then(_$_TotalPay(
      donationId: null == donationId
          ? _value.donationId
          : donationId // ignore: cast_nullable_to_non_nullable
              as int,
      donationDate: null == donationDate
          ? _value.donationDate
          : donationDate // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      regularDate: null == regularDate
          ? _value.regularDate
          : regularDate // ignore: cast_nullable_to_non_nullable
              as String,
      donationStatus: null == donationStatus
          ? _value.donationStatus
          : donationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      regularStatus: null == regularStatus
          ? _value.regularStatus
          : regularStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TotalPay with DiagnosticableTreeMixin implements _TotalPay {
  const _$_TotalPay(
      {required this.donationId,
      required this.donationDate,
      required this.projectName,
      required this.regularDate,
      required this.donationStatus,
      required this.regularStatus});

  factory _$_TotalPay.fromJson(Map<String, dynamic> json) =>
      _$$_TotalPayFromJson(json);

  @override
  final int donationId;
  @override
  final String donationDate;
  @override
  final String projectName;
  @override
  final String regularDate;
  @override
  final String donationStatus;
  @override
  final String regularStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TotalPay(donationId: $donationId, donationDate: $donationDate, projectName: $projectName, regularDate: $regularDate, donationStatus: $donationStatus, regularStatus: $regularStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TotalPay'))
      ..add(DiagnosticsProperty('donationId', donationId))
      ..add(DiagnosticsProperty('donationDate', donationDate))
      ..add(DiagnosticsProperty('projectName', projectName))
      ..add(DiagnosticsProperty('regularDate', regularDate))
      ..add(DiagnosticsProperty('donationStatus', donationStatus))
      ..add(DiagnosticsProperty('regularStatus', regularStatus));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TotalPay &&
            (identical(other.donationId, donationId) ||
                other.donationId == donationId) &&
            (identical(other.donationDate, donationDate) ||
                other.donationDate == donationDate) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.regularDate, regularDate) ||
                other.regularDate == regularDate) &&
            (identical(other.donationStatus, donationStatus) ||
                other.donationStatus == donationStatus) &&
            (identical(other.regularStatus, regularStatus) ||
                other.regularStatus == regularStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, donationId, donationDate,
      projectName, regularDate, donationStatus, regularStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TotalPayCopyWith<_$_TotalPay> get copyWith =>
      __$$_TotalPayCopyWithImpl<_$_TotalPay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TotalPayToJson(
      this,
    );
  }
}

abstract class _TotalPay implements TotalPay {
  const factory _TotalPay(
      {required final int donationId,
      required final String donationDate,
      required final String projectName,
      required final String regularDate,
      required final String donationStatus,
      required final String regularStatus}) = _$_TotalPay;

  factory _TotalPay.fromJson(Map<String, dynamic> json) = _$_TotalPay.fromJson;

  @override
  int get donationId;
  @override
  String get donationDate;
  @override
  String get projectName;
  @override
  String get regularDate;
  @override
  String get donationStatus;
  @override
  String get regularStatus;
  @override
  @JsonKey(ignore: true)
  _$$_TotalPayCopyWith<_$_TotalPay> get copyWith =>
      throw _privateConstructorUsedError;
}
