// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Donator _$DonatorFromJson(Map<String, dynamic> json) {
  return _Donator.fromJson(json);
}

/// @nodoc
mixin _$Donator {
  String get name => throw _privateConstructorUsedError;
  String get birthDay => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DonatorCopyWith<Donator> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonatorCopyWith<$Res> {
  factory $DonatorCopyWith(Donator value, $Res Function(Donator) then) =
      _$DonatorCopyWithImpl<$Res, Donator>;
  @useResult
  $Res call({String name, String birthDay, String phoneNumber});
}

/// @nodoc
class _$DonatorCopyWithImpl<$Res, $Val extends Donator>
    implements $DonatorCopyWith<$Res> {
  _$DonatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birthDay = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: null == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DonatorImplCopyWith<$Res> implements $DonatorCopyWith<$Res> {
  factory _$$DonatorImplCopyWith(
          _$DonatorImpl value, $Res Function(_$DonatorImpl) then) =
      __$$DonatorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String birthDay, String phoneNumber});
}

/// @nodoc
class __$$DonatorImplCopyWithImpl<$Res>
    extends _$DonatorCopyWithImpl<$Res, _$DonatorImpl>
    implements _$$DonatorImplCopyWith<$Res> {
  __$$DonatorImplCopyWithImpl(
      _$DonatorImpl _value, $Res Function(_$DonatorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birthDay = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$DonatorImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: null == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DonatorImpl with DiagnosticableTreeMixin implements _Donator {
  const _$DonatorImpl(
      {required this.name, required this.birthDay, required this.phoneNumber});

  factory _$DonatorImpl.fromJson(Map<String, dynamic> json) =>
      _$$DonatorImplFromJson(json);

  @override
  final String name;
  @override
  final String birthDay;
  @override
  final String phoneNumber;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Donator(name: $name, birthDay: $birthDay, phoneNumber: $phoneNumber)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Donator'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('birthDay', birthDay))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DonatorImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, birthDay, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DonatorImplCopyWith<_$DonatorImpl> get copyWith =>
      __$$DonatorImplCopyWithImpl<_$DonatorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DonatorImplToJson(
      this,
    );
  }
}

abstract class _Donator implements Donator {
  const factory _Donator(
      {required final String name,
      required final String birthDay,
      required final String phoneNumber}) = _$DonatorImpl;

  factory _Donator.fromJson(Map<String, dynamic> json) = _$DonatorImpl.fromJson;

  @override
  String get name;
  @override
  String get birthDay;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$DonatorImplCopyWith<_$DonatorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
