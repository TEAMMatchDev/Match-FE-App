// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flame.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Flame _$FlameFromJson(Map<String, dynamic> json) {
  return _Flame.fromJson(json);
}

/// @nodoc
mixin _$Flame {
  int get donationId => throw _privateConstructorUsedError;
  String get usages => throw _privateConstructorUsedError;
  String get inherenceName => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get randomMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlameCopyWith<Flame> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlameCopyWith<$Res> {
  factory $FlameCopyWith(Flame value, $Res Function(Flame) then) =
      _$FlameCopyWithImpl<$Res, Flame>;
  @useResult
  $Res call(
      {int donationId,
      String usages,
      String inherenceName,
      String image,
      String randomMessage});
}

/// @nodoc
class _$FlameCopyWithImpl<$Res, $Val extends Flame>
    implements $FlameCopyWith<$Res> {
  _$FlameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? donationId = null,
    Object? usages = null,
    Object? inherenceName = null,
    Object? image = null,
    Object? randomMessage = null,
  }) {
    return _then(_value.copyWith(
      donationId: null == donationId
          ? _value.donationId
          : donationId // ignore: cast_nullable_to_non_nullable
              as int,
      usages: null == usages
          ? _value.usages
          : usages // ignore: cast_nullable_to_non_nullable
              as String,
      inherenceName: null == inherenceName
          ? _value.inherenceName
          : inherenceName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      randomMessage: null == randomMessage
          ? _value.randomMessage
          : randomMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlameCopyWith<$Res> implements $FlameCopyWith<$Res> {
  factory _$$_FlameCopyWith(_$_Flame value, $Res Function(_$_Flame) then) =
      __$$_FlameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int donationId,
      String usages,
      String inherenceName,
      String image,
      String randomMessage});
}

/// @nodoc
class __$$_FlameCopyWithImpl<$Res> extends _$FlameCopyWithImpl<$Res, _$_Flame>
    implements _$$_FlameCopyWith<$Res> {
  __$$_FlameCopyWithImpl(_$_Flame _value, $Res Function(_$_Flame) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? donationId = null,
    Object? usages = null,
    Object? inherenceName = null,
    Object? image = null,
    Object? randomMessage = null,
  }) {
    return _then(_$_Flame(
      donationId: null == donationId
          ? _value.donationId
          : donationId // ignore: cast_nullable_to_non_nullable
              as int,
      usages: null == usages
          ? _value.usages
          : usages // ignore: cast_nullable_to_non_nullable
              as String,
      inherenceName: null == inherenceName
          ? _value.inherenceName
          : inherenceName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      randomMessage: null == randomMessage
          ? _value.randomMessage
          : randomMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Flame with DiagnosticableTreeMixin implements _Flame {
  const _$_Flame(
      {required this.donationId,
      required this.usages,
      required this.inherenceName,
      required this.image,
      required this.randomMessage});

  factory _$_Flame.fromJson(Map<String, dynamic> json) =>
      _$$_FlameFromJson(json);

  @override
  final int donationId;
  @override
  final String usages;
  @override
  final String inherenceName;
  @override
  final String image;
  @override
  final String randomMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Flame(donationId: $donationId, usages: $usages, inherenceName: $inherenceName, image: $image, randomMessage: $randomMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Flame'))
      ..add(DiagnosticsProperty('donationId', donationId))
      ..add(DiagnosticsProperty('usages', usages))
      ..add(DiagnosticsProperty('inherenceName', inherenceName))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('randomMessage', randomMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Flame &&
            (identical(other.donationId, donationId) ||
                other.donationId == donationId) &&
            (identical(other.usages, usages) || other.usages == usages) &&
            (identical(other.inherenceName, inherenceName) ||
                other.inherenceName == inherenceName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.randomMessage, randomMessage) ||
                other.randomMessage == randomMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, donationId, usages, inherenceName, image, randomMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlameCopyWith<_$_Flame> get copyWith =>
      __$$_FlameCopyWithImpl<_$_Flame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlameToJson(
      this,
    );
  }
}

abstract class _Flame implements Flame {
  const factory _Flame(
      {required final int donationId,
      required final String usages,
      required final String inherenceName,
      required final String image,
      required final String randomMessage}) = _$_Flame;

  factory _Flame.fromJson(Map<String, dynamic> json) = _$_Flame.fromJson;

  @override
  int get donationId;
  @override
  String get usages;
  @override
  String get inherenceName;
  @override
  String get image;
  @override
  String get randomMessage;
  @override
  @JsonKey(ignore: true)
  _$$_FlameCopyWith<_$_Flame> get copyWith =>
      throw _privateConstructorUsedError;
}
