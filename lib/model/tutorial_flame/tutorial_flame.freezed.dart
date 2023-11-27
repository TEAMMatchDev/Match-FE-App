// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutorial_flame.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TutorialFlame _$TutorialFlameFromJson(Map<String, dynamic> json) {
  return _TutorialFlame.fromJson(json);
}

/// @nodoc
mixin _$TutorialFlame {
  int get projectId => throw _privateConstructorUsedError;
  String get inherenceName => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get randomMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TutorialFlameCopyWith<TutorialFlame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorialFlameCopyWith<$Res> {
  factory $TutorialFlameCopyWith(
          TutorialFlame value, $Res Function(TutorialFlame) then) =
      _$TutorialFlameCopyWithImpl<$Res, TutorialFlame>;
  @useResult
  $Res call(
      {int projectId,
      String inherenceName,
      String image,
      String randomMessage});
}

/// @nodoc
class _$TutorialFlameCopyWithImpl<$Res, $Val extends TutorialFlame>
    implements $TutorialFlameCopyWith<$Res> {
  _$TutorialFlameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? inherenceName = null,
    Object? image = null,
    Object? randomMessage = null,
  }) {
    return _then(_value.copyWith(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$TutorialFlameImplCopyWith<$Res>
    implements $TutorialFlameCopyWith<$Res> {
  factory _$$TutorialFlameImplCopyWith(
          _$TutorialFlameImpl value, $Res Function(_$TutorialFlameImpl) then) =
      __$$TutorialFlameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int projectId,
      String inherenceName,
      String image,
      String randomMessage});
}

/// @nodoc
class __$$TutorialFlameImplCopyWithImpl<$Res>
    extends _$TutorialFlameCopyWithImpl<$Res, _$TutorialFlameImpl>
    implements _$$TutorialFlameImplCopyWith<$Res> {
  __$$TutorialFlameImplCopyWithImpl(
      _$TutorialFlameImpl _value, $Res Function(_$TutorialFlameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? inherenceName = null,
    Object? image = null,
    Object? randomMessage = null,
  }) {
    return _then(_$TutorialFlameImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$TutorialFlameImpl
    with DiagnosticableTreeMixin
    implements _TutorialFlame {
  const _$TutorialFlameImpl(
      {required this.projectId,
      required this.inherenceName,
      required this.image,
      required this.randomMessage});

  factory _$TutorialFlameImpl.fromJson(Map<String, dynamic> json) =>
      _$$TutorialFlameImplFromJson(json);

  @override
  final int projectId;
  @override
  final String inherenceName;
  @override
  final String image;
  @override
  final String randomMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TutorialFlame(projectId: $projectId, inherenceName: $inherenceName, image: $image, randomMessage: $randomMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TutorialFlame'))
      ..add(DiagnosticsProperty('projectId', projectId))
      ..add(DiagnosticsProperty('inherenceName', inherenceName))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('randomMessage', randomMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TutorialFlameImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.inherenceName, inherenceName) ||
                other.inherenceName == inherenceName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.randomMessage, randomMessage) ||
                other.randomMessage == randomMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, projectId, inherenceName, image, randomMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TutorialFlameImplCopyWith<_$TutorialFlameImpl> get copyWith =>
      __$$TutorialFlameImplCopyWithImpl<_$TutorialFlameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TutorialFlameImplToJson(
      this,
    );
  }
}

abstract class _TutorialFlame implements TutorialFlame {
  const factory _TutorialFlame(
      {required final int projectId,
      required final String inherenceName,
      required final String image,
      required final String randomMessage}) = _$TutorialFlameImpl;

  factory _TutorialFlame.fromJson(Map<String, dynamic> json) =
      _$TutorialFlameImpl.fromJson;

  @override
  int get projectId;
  @override
  String get inherenceName;
  @override
  String get image;
  @override
  String get randomMessage;
  @override
  @JsonKey(ignore: true)
  _$$TutorialFlameImplCopyWith<_$TutorialFlameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
