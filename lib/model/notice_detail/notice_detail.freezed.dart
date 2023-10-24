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
  Notice get noticeInfo => throw _privateConstructorUsedError;
  List<Contents> get noticeContents => throw _privateConstructorUsedError;

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
  $Res call({Notice noticeInfo, List<Contents> noticeContents});

  $NoticeCopyWith<$Res> get noticeInfo;
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
    Object? noticeInfo = null,
    Object? noticeContents = null,
  }) {
    return _then(_value.copyWith(
      noticeInfo: null == noticeInfo
          ? _value.noticeInfo
          : noticeInfo // ignore: cast_nullable_to_non_nullable
              as Notice,
      noticeContents: null == noticeContents
          ? _value.noticeContents
          : noticeContents // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NoticeCopyWith<$Res> get noticeInfo {
    return $NoticeCopyWith<$Res>(_value.noticeInfo, (value) {
      return _then(_value.copyWith(noticeInfo: value) as $Val);
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
  $Res call({Notice noticeInfo, List<Contents> noticeContents});

  @override
  $NoticeCopyWith<$Res> get noticeInfo;
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
    Object? noticeInfo = null,
    Object? noticeContents = null,
  }) {
    return _then(_$NoticeDetailImpl(
      noticeInfo: null == noticeInfo
          ? _value.noticeInfo
          : noticeInfo // ignore: cast_nullable_to_non_nullable
              as Notice,
      noticeContents: null == noticeContents
          ? _value._noticeContents
          : noticeContents // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeDetailImpl with DiagnosticableTreeMixin implements _NoticeDetail {
  const _$NoticeDetailImpl(
      {required this.noticeInfo, required final List<Contents> noticeContents})
      : _noticeContents = noticeContents;

  factory _$NoticeDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeDetailImplFromJson(json);

  @override
  final Notice noticeInfo;
  final List<Contents> _noticeContents;
  @override
  List<Contents> get noticeContents {
    if (_noticeContents is EqualUnmodifiableListView) return _noticeContents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_noticeContents);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NoticeDetail(noticeInfo: $noticeInfo, noticeContents: $noticeContents)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NoticeDetail'))
      ..add(DiagnosticsProperty('noticeInfo', noticeInfo))
      ..add(DiagnosticsProperty('noticeContents', noticeContents));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeDetailImpl &&
            (identical(other.noticeInfo, noticeInfo) ||
                other.noticeInfo == noticeInfo) &&
            const DeepCollectionEquality()
                .equals(other._noticeContents, _noticeContents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, noticeInfo,
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
      {required final Notice noticeInfo,
      required final List<Contents> noticeContents}) = _$NoticeDetailImpl;

  factory _NoticeDetail.fromJson(Map<String, dynamic> json) =
      _$NoticeDetailImpl.fromJson;

  @override
  Notice get noticeInfo;
  @override
  List<Contents> get noticeContents;
  @override
  @JsonKey(ignore: true)
  _$$NoticeDetailImplCopyWith<_$NoticeDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
