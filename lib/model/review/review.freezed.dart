// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  int get executionId => throw _privateConstructorUsedError;
  int get donation => throw _privateConstructorUsedError;
  int get transparency => throw _privateConstructorUsedError;
  int get information => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {int executionId,
      int donation,
      int transparency,
      int information,
      String comment});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? executionId = null,
    Object? donation = null,
    Object? transparency = null,
    Object? information = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      executionId: null == executionId
          ? _value.executionId
          : executionId // ignore: cast_nullable_to_non_nullable
              as int,
      donation: null == donation
          ? _value.donation
          : donation // ignore: cast_nullable_to_non_nullable
              as int,
      transparency: null == transparency
          ? _value.transparency
          : transparency // ignore: cast_nullable_to_non_nullable
              as int,
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int executionId,
      int donation,
      int transparency,
      int information,
      String comment});
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? executionId = null,
    Object? donation = null,
    Object? transparency = null,
    Object? information = null,
    Object? comment = null,
  }) {
    return _then(_$ReviewImpl(
      executionId: null == executionId
          ? _value.executionId
          : executionId // ignore: cast_nullable_to_non_nullable
              as int,
      donation: null == donation
          ? _value.donation
          : donation // ignore: cast_nullable_to_non_nullable
              as int,
      transparency: null == transparency
          ? _value.transparency
          : transparency // ignore: cast_nullable_to_non_nullable
              as int,
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl with DiagnosticableTreeMixin implements _Review {
  const _$ReviewImpl(
      {required this.executionId,
      required this.donation,
      required this.transparency,
      required this.information,
      required this.comment});

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  final int executionId;
  @override
  final int donation;
  @override
  final int transparency;
  @override
  final int information;
  @override
  final String comment;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Review(executionId: $executionId, donation: $donation, transparency: $transparency, information: $information, comment: $comment)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Review'))
      ..add(DiagnosticsProperty('executionId', executionId))
      ..add(DiagnosticsProperty('donation', donation))
      ..add(DiagnosticsProperty('transparency', transparency))
      ..add(DiagnosticsProperty('information', information))
      ..add(DiagnosticsProperty('comment', comment));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.executionId, executionId) ||
                other.executionId == executionId) &&
            (identical(other.donation, donation) ||
                other.donation == donation) &&
            (identical(other.transparency, transparency) ||
                other.transparency == transparency) &&
            (identical(other.information, information) ||
                other.information == information) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, executionId, donation, transparency, information, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  const factory _Review(
      {required final int executionId,
      required final int donation,
      required final int transparency,
      required final int information,
      required final String comment}) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  int get executionId;
  @override
  int get donation;
  @override
  int get transparency;
  @override
  int get information;
  @override
  String get comment;
  @override
  @JsonKey(ignore: true)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
