// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecommendProject _$RecommendProjectFromJson(Map<String, dynamic> json) {
  return _RecommendProject.fromJson(json);
}

/// @nodoc
mixin _$RecommendProject {
  int get projectId => throw _privateConstructorUsedError;
  String get projectKind => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendProjectCopyWith<RecommendProject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendProjectCopyWith<$Res> {
  factory $RecommendProjectCopyWith(
          RecommendProject value, $Res Function(RecommendProject) then) =
      _$RecommendProjectCopyWithImpl<$Res, RecommendProject>;
  @useResult
  $Res call({int projectId, String projectKind});
}

/// @nodoc
class _$RecommendProjectCopyWithImpl<$Res, $Val extends RecommendProject>
    implements $RecommendProjectCopyWith<$Res> {
  _$RecommendProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? projectKind = null,
  }) {
    return _then(_value.copyWith(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      projectKind: null == projectKind
          ? _value.projectKind
          : projectKind // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendProjectImplCopyWith<$Res>
    implements $RecommendProjectCopyWith<$Res> {
  factory _$$RecommendProjectImplCopyWith(_$RecommendProjectImpl value,
          $Res Function(_$RecommendProjectImpl) then) =
      __$$RecommendProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int projectId, String projectKind});
}

/// @nodoc
class __$$RecommendProjectImplCopyWithImpl<$Res>
    extends _$RecommendProjectCopyWithImpl<$Res, _$RecommendProjectImpl>
    implements _$$RecommendProjectImplCopyWith<$Res> {
  __$$RecommendProjectImplCopyWithImpl(_$RecommendProjectImpl _value,
      $Res Function(_$RecommendProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? projectKind = null,
  }) {
    return _then(_$RecommendProjectImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      projectKind: null == projectKind
          ? _value.projectKind
          : projectKind // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendProjectImpl
    with DiagnosticableTreeMixin
    implements _RecommendProject {
  const _$RecommendProjectImpl(
      {required this.projectId, required this.projectKind});

  factory _$RecommendProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendProjectImplFromJson(json);

  @override
  final int projectId;
  @override
  final String projectKind;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecommendProject(projectId: $projectId, projectKind: $projectKind)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecommendProject'))
      ..add(DiagnosticsProperty('projectId', projectId))
      ..add(DiagnosticsProperty('projectKind', projectKind));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendProjectImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectKind, projectKind) ||
                other.projectKind == projectKind));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, projectId, projectKind);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendProjectImplCopyWith<_$RecommendProjectImpl> get copyWith =>
      __$$RecommendProjectImplCopyWithImpl<_$RecommendProjectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendProjectImplToJson(
      this,
    );
  }
}

abstract class _RecommendProject implements RecommendProject {
  const factory _RecommendProject(
      {required final int projectId,
      required final String projectKind}) = _$RecommendProjectImpl;

  factory _RecommendProject.fromJson(Map<String, dynamic> json) =
      _$RecommendProjectImpl.fromJson;

  @override
  int get projectId;
  @override
  String get projectKind;
  @override
  @JsonKey(ignore: true)
  _$$RecommendProjectImplCopyWith<_$RecommendProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
