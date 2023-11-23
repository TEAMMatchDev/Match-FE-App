// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get socialId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String? get birthDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String? socialId,
      String email,
      String? name,
      String? phone,
      String gender,
      String? birthDate});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socialId = freezed,
    Object? email = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? gender = null,
    Object? birthDate = freezed,
  }) {
    return _then(_value.copyWith(
      socialId: freezed == socialId
          ? _value.socialId
          : socialId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? socialId,
      String email,
      String? name,
      String? phone,
      String gender,
      String? birthDate});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socialId = freezed,
    Object? email = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? gender = null,
    Object? birthDate = freezed,
  }) {
    return _then(_$UserImpl(
      socialId: freezed == socialId
          ? _value.socialId
          : socialId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl with DiagnosticableTreeMixin implements _User {
  const _$UserImpl(
      {this.socialId,
      required this.email,
      this.name,
      this.phone,
      required this.gender,
      this.birthDate});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String? socialId;
  @override
  final String email;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String gender;
  @override
  final String? birthDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(socialId: $socialId, email: $email, name: $name, phone: $phone, gender: $gender, birthDate: $birthDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('socialId', socialId))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('birthDate', birthDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.socialId, socialId) ||
                other.socialId == socialId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, socialId, email, name, phone, gender, birthDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final String? socialId,
      required final String email,
      final String? name,
      final String? phone,
      required final String gender,
      final String? birthDate}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String? get socialId;
  @override
  String get email;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  String get gender;
  @override
  String? get birthDate;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
