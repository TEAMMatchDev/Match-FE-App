// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Contents _$ContentsFromJson(Map<String, dynamic> json) {
  return _Contents.fromJson(json);
}

/// @nodoc
mixin _$Contents {
  int get contentId => throw _privateConstructorUsedError;
  String get contentsType => throw _privateConstructorUsedError;
  String get cotents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentsCopyWith<Contents> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentsCopyWith<$Res> {
  factory $ContentsCopyWith(Contents value, $Res Function(Contents) then) =
      _$ContentsCopyWithImpl<$Res, Contents>;
  @useResult
  $Res call({int contentId, String contentsType, String cotents});
}

/// @nodoc
class _$ContentsCopyWithImpl<$Res, $Val extends Contents>
    implements $ContentsCopyWith<$Res> {
  _$ContentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentsType = null,
    Object? cotents = null,
  }) {
    return _then(_value.copyWith(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      contentsType: null == contentsType
          ? _value.contentsType
          : contentsType // ignore: cast_nullable_to_non_nullable
              as String,
      cotents: null == cotents
          ? _value.cotents
          : cotents // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentsImplCopyWith<$Res>
    implements $ContentsCopyWith<$Res> {
  factory _$$ContentsImplCopyWith(
          _$ContentsImpl value, $Res Function(_$ContentsImpl) then) =
      __$$ContentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int contentId, String contentsType, String cotents});
}

/// @nodoc
class __$$ContentsImplCopyWithImpl<$Res>
    extends _$ContentsCopyWithImpl<$Res, _$ContentsImpl>
    implements _$$ContentsImplCopyWith<$Res> {
  __$$ContentsImplCopyWithImpl(
      _$ContentsImpl _value, $Res Function(_$ContentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentsType = null,
    Object? cotents = null,
  }) {
    return _then(_$ContentsImpl(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      contentsType: null == contentsType
          ? _value.contentsType
          : contentsType // ignore: cast_nullable_to_non_nullable
              as String,
      cotents: null == cotents
          ? _value.cotents
          : cotents // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentsImpl with DiagnosticableTreeMixin implements _Contents {
  const _$ContentsImpl(
      {required this.contentId,
      required this.contentsType,
      required this.cotents});

  factory _$ContentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentsImplFromJson(json);

  @override
  final int contentId;
  @override
  final String contentsType;
  @override
  final String cotents;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Contents(contentId: $contentId, contentsType: $contentsType, cotents: $cotents)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Contents'))
      ..add(DiagnosticsProperty('contentId', contentId))
      ..add(DiagnosticsProperty('contentsType', contentsType))
      ..add(DiagnosticsProperty('cotents', cotents));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentsImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.contentsType, contentsType) ||
                other.contentsType == contentsType) &&
            (identical(other.cotents, cotents) || other.cotents == cotents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contentId, contentsType, cotents);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentsImplCopyWith<_$ContentsImpl> get copyWith =>
      __$$ContentsImplCopyWithImpl<_$ContentsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentsImplToJson(
      this,
    );
  }
}

abstract class _Contents implements Contents {
  const factory _Contents(
      {required final int contentId,
      required final String contentsType,
      required final String cotents}) = _$ContentsImpl;

  factory _Contents.fromJson(Map<String, dynamic> json) =
      _$ContentsImpl.fromJson;

  @override
  int get contentId;
  @override
  String get contentsType;
  @override
  String get cotents;
  @override
  @JsonKey(ignore: true)
  _$$ContentsImplCopyWith<_$ContentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
