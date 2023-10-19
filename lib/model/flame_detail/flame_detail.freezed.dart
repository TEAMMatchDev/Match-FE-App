// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flame_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlameDetail _$FlameDetailFromJson(Map<String, dynamic> json) {
  return _FlameDetail.fromJson(json);
}

/// @nodoc
mixin _$FlameDetail {
  String get imgUrl => throw _privateConstructorUsedError;
  String get flameType => throw _privateConstructorUsedError;
  String get inherenceName => throw _privateConstructorUsedError;
  String get usages => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get sequence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlameDetailCopyWith<FlameDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlameDetailCopyWith<$Res> {
  factory $FlameDetailCopyWith(
          FlameDetail value, $Res Function(FlameDetail) then) =
      _$FlameDetailCopyWithImpl<$Res, FlameDetail>;
  @useResult
  $Res call(
      {String imgUrl,
      String flameType,
      String inherenceName,
      String usages,
      int amount,
      int sequence});
}

/// @nodoc
class _$FlameDetailCopyWithImpl<$Res, $Val extends FlameDetail>
    implements $FlameDetailCopyWith<$Res> {
  _$FlameDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgUrl = null,
    Object? flameType = null,
    Object? inherenceName = null,
    Object? usages = null,
    Object? amount = null,
    Object? sequence = null,
  }) {
    return _then(_value.copyWith(
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      flameType: null == flameType
          ? _value.flameType
          : flameType // ignore: cast_nullable_to_non_nullable
              as String,
      inherenceName: null == inherenceName
          ? _value.inherenceName
          : inherenceName // ignore: cast_nullable_to_non_nullable
              as String,
      usages: null == usages
          ? _value.usages
          : usages // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlameDetailCopyWith<$Res>
    implements $FlameDetailCopyWith<$Res> {
  factory _$$_FlameDetailCopyWith(
          _$_FlameDetail value, $Res Function(_$_FlameDetail) then) =
      __$$_FlameDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imgUrl,
      String flameType,
      String inherenceName,
      String usages,
      int amount,
      int sequence});
}

/// @nodoc
class __$$_FlameDetailCopyWithImpl<$Res>
    extends _$FlameDetailCopyWithImpl<$Res, _$_FlameDetail>
    implements _$$_FlameDetailCopyWith<$Res> {
  __$$_FlameDetailCopyWithImpl(
      _$_FlameDetail _value, $Res Function(_$_FlameDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgUrl = null,
    Object? flameType = null,
    Object? inherenceName = null,
    Object? usages = null,
    Object? amount = null,
    Object? sequence = null,
  }) {
    return _then(_$_FlameDetail(
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      flameType: null == flameType
          ? _value.flameType
          : flameType // ignore: cast_nullable_to_non_nullable
              as String,
      inherenceName: null == inherenceName
          ? _value.inherenceName
          : inherenceName // ignore: cast_nullable_to_non_nullable
              as String,
      usages: null == usages
          ? _value.usages
          : usages // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlameDetail with DiagnosticableTreeMixin implements _FlameDetail {
  const _$_FlameDetail(
      {required this.imgUrl,
      required this.flameType,
      required this.inherenceName,
      required this.usages,
      required this.amount,
      required this.sequence});

  factory _$_FlameDetail.fromJson(Map<String, dynamic> json) =>
      _$$_FlameDetailFromJson(json);

  @override
  final String imgUrl;
  @override
  final String flameType;
  @override
  final String inherenceName;
  @override
  final String usages;
  @override
  final int amount;
  @override
  final int sequence;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FlameDetail(imgUrl: $imgUrl, flameType: $flameType, inherenceName: $inherenceName, usages: $usages, amount: $amount, sequence: $sequence)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FlameDetail'))
      ..add(DiagnosticsProperty('imgUrl', imgUrl))
      ..add(DiagnosticsProperty('flameType', flameType))
      ..add(DiagnosticsProperty('inherenceName', inherenceName))
      ..add(DiagnosticsProperty('usages', usages))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('sequence', sequence));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlameDetail &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.flameType, flameType) ||
                other.flameType == flameType) &&
            (identical(other.inherenceName, inherenceName) ||
                other.inherenceName == inherenceName) &&
            (identical(other.usages, usages) || other.usages == usages) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, imgUrl, flameType, inherenceName, usages, amount, sequence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlameDetailCopyWith<_$_FlameDetail> get copyWith =>
      __$$_FlameDetailCopyWithImpl<_$_FlameDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlameDetailToJson(
      this,
    );
  }
}

abstract class _FlameDetail implements FlameDetail {
  const factory _FlameDetail(
      {required final String imgUrl,
      required final String flameType,
      required final String inherenceName,
      required final String usages,
      required final int amount,
      required final int sequence}) = _$_FlameDetail;

  factory _FlameDetail.fromJson(Map<String, dynamic> json) =
      _$_FlameDetail.fromJson;

  @override
  String get imgUrl;
  @override
  String get flameType;
  @override
  String get inherenceName;
  @override
  String get usages;
  @override
  int get amount;
  @override
  int get sequence;
  @override
  @JsonKey(ignore: true)
  _$$_FlameDetailCopyWith<_$_FlameDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
