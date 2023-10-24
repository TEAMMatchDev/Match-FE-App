// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoticeDetail _$NoticeDetailFromJson(Map<String, dynamic> json) {
  return _NoticeDetail.fromJson(json);
}

/// @nodoc
mixin _$NoticeDetail {
  Notice get notifcieInfo => throw _privateConstructorUsedError;
  List<NoticeContent> get noticeContents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeDetailCopyWith<NoticeDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeDetailCopyWith<$Res> {
  factory $NoticeDetailCopyWith(
          NoticeDetail value, $Res Function(NoticeDetail) then) =
      _$NoticeDetailCopyWithImpl<$Res, NoticeDetail>;
  @useResult
  $Res call({Notice notifcieInfo, List<NoticeContent> noticeContents});

  $NoticeCopyWith<$Res> get notifcieInfo;
}

/// @nodoc
class _$NoticeDetailCopyWithImpl<$Res, $Val extends NoticeDetail>
    implements $NoticeDetailCopyWith<$Res> {
  _$NoticeDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifcieInfo = null,
    Object? noticeContents = null,
  }) {
    return _then(_value.copyWith(
      notifcieInfo: null == notifcieInfo
          ? _value.notifcieInfo
          : notifcieInfo // ignore: cast_nullable_to_non_nullable
              as Notice,
      noticeContents: null == noticeContents
          ? _value.noticeContents
          : noticeContents // ignore: cast_nullable_to_non_nullable
              as List<NoticeContent>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NoticeCopyWith<$Res> get notifcieInfo {
    return $NoticeCopyWith<$Res>(_value.notifcieInfo, (value) {
      return _then(_value.copyWith(notifcieInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NoticeDetailImplCopyWith<$Res>
    implements $NoticeDetailCopyWith<$Res> {
  factory _$$NoticeDetailImplCopyWith(
          _$NoticeDetailImpl value, $Res Function(_$NoticeDetailImpl) then) =
      __$$NoticeDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Notice notifcieInfo, List<NoticeContent> noticeContents});

  @override
  $NoticeCopyWith<$Res> get notifcieInfo;
}

/// @nodoc
class __$$NoticeDetailImplCopyWithImpl<$Res>
    extends _$NoticeDetailCopyWithImpl<$Res, _$NoticeDetailImpl>
    implements _$$NoticeDetailImplCopyWith<$Res> {
  __$$NoticeDetailImplCopyWithImpl(
      _$NoticeDetailImpl _value, $Res Function(_$NoticeDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifcieInfo = null,
    Object? noticeContents = null,
  }) {
    return _then(_$NoticeDetailImpl(
      notifcieInfo: null == notifcieInfo
          ? _value.notifcieInfo
          : notifcieInfo // ignore: cast_nullable_to_non_nullable
              as Notice,
      noticeContents: null == noticeContents
          ? _value._noticeContents
          : noticeContents // ignore: cast_nullable_to_non_nullable
              as List<NoticeContent>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeDetailImpl with DiagnosticableTreeMixin implements _NoticeDetail {
  const _$NoticeDetailImpl(
      {required this.notifcieInfo,
      required final List<NoticeContent> noticeContents})
      : _noticeContents = noticeContents;

  factory _$NoticeDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeDetailImplFromJson(json);

  @override
  final Notice notifcieInfo;
  final List<NoticeContent> _noticeContents;
  @override
  List<NoticeContent> get noticeContents {
    if (_noticeContents is EqualUnmodifiableListView) return _noticeContents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_noticeContents);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NoticeDetail(notifcieInfo: $notifcieInfo, noticeContents: $noticeContents)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NoticeDetail'))
      ..add(DiagnosticsProperty('notifcieInfo', notifcieInfo))
      ..add(DiagnosticsProperty('noticeContents', noticeContents));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeDetailImpl &&
            (identical(other.notifcieInfo, notifcieInfo) ||
                other.notifcieInfo == notifcieInfo) &&
            const DeepCollectionEquality()
                .equals(other._noticeContents, _noticeContents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notifcieInfo,
      const DeepCollectionEquality().hash(_noticeContents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeDetailImplCopyWith<_$NoticeDetailImpl> get copyWith =>
      __$$NoticeDetailImplCopyWithImpl<_$NoticeDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeDetailImplToJson(
      this,
    );
  }
}

abstract class _NoticeDetail implements NoticeDetail {
  const factory _NoticeDetail(
      {required final Notice notifcieInfo,
      required final List<NoticeContent> noticeContents}) = _$NoticeDetailImpl;

  factory _NoticeDetail.fromJson(Map<String, dynamic> json) =
      _$NoticeDetailImpl.fromJson;

  @override
  Notice get notifcieInfo;
  @override
  List<NoticeContent> get noticeContents;
  @override
  @JsonKey(ignore: true)
  _$$NoticeDetailImplCopyWith<_$NoticeDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NoticeContent _$NoticeContentFromJson(Map<String, dynamic> json) {
  return _NoticeContent.fromJson(json);
}

/// @nodoc
mixin _$NoticeContent {
  int get contentId => throw _privateConstructorUsedError;
  String get contentsType => throw _privateConstructorUsedError;
  String get cotents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeContentCopyWith<NoticeContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeContentCopyWith<$Res> {
  factory $NoticeContentCopyWith(
          NoticeContent value, $Res Function(NoticeContent) then) =
      _$NoticeContentCopyWithImpl<$Res, NoticeContent>;
  @useResult
  $Res call({int contentId, String contentsType, String cotents});
}

/// @nodoc
class _$NoticeContentCopyWithImpl<$Res, $Val extends NoticeContent>
    implements $NoticeContentCopyWith<$Res> {
  _$NoticeContentCopyWithImpl(this._value, this._then);

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
abstract class _$$NoticeContentImplCopyWith<$Res>
    implements $NoticeContentCopyWith<$Res> {
  factory _$$NoticeContentImplCopyWith(
          _$NoticeContentImpl value, $Res Function(_$NoticeContentImpl) then) =
      __$$NoticeContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int contentId, String contentsType, String cotents});
}

/// @nodoc
class __$$NoticeContentImplCopyWithImpl<$Res>
    extends _$NoticeContentCopyWithImpl<$Res, _$NoticeContentImpl>
    implements _$$NoticeContentImplCopyWith<$Res> {
  __$$NoticeContentImplCopyWithImpl(
      _$NoticeContentImpl _value, $Res Function(_$NoticeContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentsType = null,
    Object? cotents = null,
  }) {
    return _then(_$NoticeContentImpl(
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
class _$NoticeContentImpl
    with DiagnosticableTreeMixin
    implements _NoticeContent {
  const _$NoticeContentImpl(
      {required this.contentId,
      required this.contentsType,
      required this.cotents});

  factory _$NoticeContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeContentImplFromJson(json);

  @override
  final int contentId;
  @override
  final String contentsType;
  @override
  final String cotents;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NoticeContent(contentId: $contentId, contentsType: $contentsType, cotents: $cotents)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NoticeContent'))
      ..add(DiagnosticsProperty('contentId', contentId))
      ..add(DiagnosticsProperty('contentsType', contentsType))
      ..add(DiagnosticsProperty('cotents', cotents));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeContentImpl &&
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
  _$$NoticeContentImplCopyWith<_$NoticeContentImpl> get copyWith =>
      __$$NoticeContentImplCopyWithImpl<_$NoticeContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeContentImplToJson(
      this,
    );
  }
}

abstract class _NoticeContent implements NoticeContent {
  const factory _NoticeContent(
      {required final int contentId,
      required final String contentsType,
      required final String cotents}) = _$NoticeContentImpl;

  factory _NoticeContent.fromJson(Map<String, dynamic> json) =
      _$NoticeContentImpl.fromJson;

  @override
  int get contentId;
  @override
  String get contentsType;
  @override
  String get cotents;
  @override
  @JsonKey(ignore: true)
  _$$NoticeContentImplCopyWith<_$NoticeContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
