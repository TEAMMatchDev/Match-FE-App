// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      commentId: json['commentId'] as int,
      comment: json['comment'] as String,
      commentDate: json['commentDate'] as String,
      profileImgUrl: json['profileImgUrl'] as String?,
      nickname: json['nickname'] as String,
      userId: json['userId'] as int,
      my: json['my'] as bool,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'comment': instance.comment,
      'commentDate': instance.commentDate,
      'profileImgUrl': instance.profileImgUrl,
      'nickname': instance.nickname,
      'userId': instance.userId,
      'my': instance.my,
    };
