// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecommendSearch _$RecommendSearchFromJson(Map<String, dynamic> json) {
  return _RecommendSearch.fromJson(json);
}

/// @nodoc
mixin _$RecommendSearch {
  int get keywordId => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendSearchCopyWith<RecommendSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendSearchCopyWith<$Res> {
  factory $RecommendSearchCopyWith(
          RecommendSearch value, $Res Function(RecommendSearch) then) =
      _$RecommendSearchCopyWithImpl<$Res, RecommendSearch>;
  @useResult
  $Res call({int keywordId, int priority, String keyword});
}

/// @nodoc
class _$RecommendSearchCopyWithImpl<$Res, $Val extends RecommendSearch>
    implements $RecommendSearchCopyWith<$Res> {
  _$RecommendSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keywordId = null,
    Object? priority = null,
    Object? keyword = null,
  }) {
    return _then(_value.copyWith(
      keywordId: null == keywordId
          ? _value.keywordId
          : keywordId // ignore: cast_nullable_to_non_nullable
              as int,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendSearchImplCopyWith<$Res>
    implements $RecommendSearchCopyWith<$Res> {
  factory _$$RecommendSearchImplCopyWith(_$RecommendSearchImpl value,
          $Res Function(_$RecommendSearchImpl) then) =
      __$$RecommendSearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int keywordId, int priority, String keyword});
}

/// @nodoc
class __$$RecommendSearchImplCopyWithImpl<$Res>
    extends _$RecommendSearchCopyWithImpl<$Res, _$RecommendSearchImpl>
    implements _$$RecommendSearchImplCopyWith<$Res> {
  __$$RecommendSearchImplCopyWithImpl(
      _$RecommendSearchImpl _value, $Res Function(_$RecommendSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keywordId = null,
    Object? priority = null,
    Object? keyword = null,
  }) {
    return _then(_$RecommendSearchImpl(
      keywordId: null == keywordId
          ? _value.keywordId
          : keywordId // ignore: cast_nullable_to_non_nullable
              as int,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendSearchImpl
    with DiagnosticableTreeMixin
    implements _RecommendSearch {
  const _$RecommendSearchImpl(
      {required this.keywordId, required this.priority, required this.keyword});

  factory _$RecommendSearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendSearchImplFromJson(json);

  @override
  final int keywordId;
  @override
  final int priority;
  @override
  final String keyword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecommendSearch(keywordId: $keywordId, priority: $priority, keyword: $keyword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecommendSearch'))
      ..add(DiagnosticsProperty('keywordId', keywordId))
      ..add(DiagnosticsProperty('priority', priority))
      ..add(DiagnosticsProperty('keyword', keyword));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendSearchImpl &&
            (identical(other.keywordId, keywordId) ||
                other.keywordId == keywordId) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, keywordId, priority, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendSearchImplCopyWith<_$RecommendSearchImpl> get copyWith =>
      __$$RecommendSearchImplCopyWithImpl<_$RecommendSearchImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendSearchImplToJson(
      this,
    );
  }
}

abstract class _RecommendSearch implements RecommendSearch {
  const factory _RecommendSearch(
      {required final int keywordId,
      required final int priority,
      required final String keyword}) = _$RecommendSearchImpl;

  factory _RecommendSearch.fromJson(Map<String, dynamic> json) =
      _$RecommendSearchImpl.fromJson;

  @override
  int get keywordId;
  @override
  int get priority;
  @override
  String get keyword;
  @override
  @JsonKey(ignore: true)
  _$$RecommendSearchImplCopyWith<_$RecommendSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
