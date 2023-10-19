// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  int get commentId => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get commentDate => throw _privateConstructorUsedError;
  String? get profileImgUrl => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  bool get my => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {int commentId,
      String comment,
      String commentDate,
      String? profileImgUrl,
      String nickname,
      int userId,
      bool my});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? comment = null,
    Object? commentDate = null,
    Object? profileImgUrl = freezed,
    Object? nickname = null,
    Object? userId = null,
    Object? my = null,
  }) {
    return _then(_value.copyWith(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      commentDate: null == commentDate
          ? _value.commentDate
          : commentDate // ignore: cast_nullable_to_non_nullable
              as String,
      profileImgUrl: freezed == profileImgUrl
          ? _value.profileImgUrl
          : profileImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      my: null == my
          ? _value.my
          : my // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int commentId,
      String comment,
      String commentDate,
      String? profileImgUrl,
      String nickname,
      int userId,
      bool my});
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$_Comment>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? comment = null,
    Object? commentDate = null,
    Object? profileImgUrl = freezed,
    Object? nickname = null,
    Object? userId = null,
    Object? my = null,
  }) {
    return _then(_$_Comment(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      commentDate: null == commentDate
          ? _value.commentDate
          : commentDate // ignore: cast_nullable_to_non_nullable
              as String,
      profileImgUrl: freezed == profileImgUrl
          ? _value.profileImgUrl
          : profileImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      my: null == my
          ? _value.my
          : my // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment with DiagnosticableTreeMixin implements _Comment {
  const _$_Comment(
      {required this.commentId,
      required this.comment,
      required this.commentDate,
      this.profileImgUrl,
      required this.nickname,
      required this.userId,
      required this.my});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$$_CommentFromJson(json);

  @override
  final int commentId;
  @override
  final String comment;
  @override
  final String commentDate;
  @override
  final String? profileImgUrl;
  @override
  final String nickname;
  @override
  final int userId;
  @override
  final bool my;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Comment(commentId: $commentId, comment: $comment, commentDate: $commentDate, profileImgUrl: $profileImgUrl, nickname: $nickname, userId: $userId, my: $my)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Comment'))
      ..add(DiagnosticsProperty('commentId', commentId))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('commentDate', commentDate))
      ..add(DiagnosticsProperty('profileImgUrl', profileImgUrl))
      ..add(DiagnosticsProperty('nickname', nickname))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('my', my));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comment &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.commentDate, commentDate) ||
                other.commentDate == commentDate) &&
            (identical(other.profileImgUrl, profileImgUrl) ||
                other.profileImgUrl == profileImgUrl) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.my, my) || other.my == my));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, commentId, comment, commentDate,
      profileImgUrl, nickname, userId, my);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required final int commentId,
      required final String comment,
      required final String commentDate,
      final String? profileImgUrl,
      required final String nickname,
      required final int userId,
      required final bool my}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  int get commentId;
  @override
  String get comment;
  @override
  String get commentDate;
  @override
  String? get profileImgUrl;
  @override
  String get nickname;
  @override
  int get userId;
  @override
  bool get my;
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
