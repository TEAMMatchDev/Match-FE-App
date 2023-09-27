// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodayProject _$TodayProjectFromJson(Map<String, dynamic> json) {
  return _TodayProject.fromJson(json);
}

/// @nodoc
mixin _$TodayProject {
  int get projectId => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get usages => throw _privateConstructorUsedError;
  String get kind => throw _privateConstructorUsedError;
  bool get like => throw _privateConstructorUsedError;
  List<String> get userProfileImages => throw _privateConstructorUsedError;
  int get totalDonationCnt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodayProjectCopyWith<TodayProject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayProjectCopyWith<$Res> {
  factory $TodayProjectCopyWith(
          TodayProject value, $Res Function(TodayProject) then) =
      _$TodayProjectCopyWithImpl<$Res, TodayProject>;
  @useResult
  $Res call(
      {int projectId,
      String imgUrl,
      String title,
      String usages,
      String kind,
      bool like,
      List<String> userProfileImages,
      int totalDonationCnt});
}

/// @nodoc
class _$TodayProjectCopyWithImpl<$Res, $Val extends TodayProject>
    implements $TodayProjectCopyWith<$Res> {
  _$TodayProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? imgUrl = null,
    Object? title = null,
    Object? usages = null,
    Object? kind = null,
    Object? like = null,
    Object? userProfileImages = null,
    Object? totalDonationCnt = null,
  }) {
    return _then(_value.copyWith(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      usages: null == usages
          ? _value.usages
          : usages // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
      userProfileImages: null == userProfileImages
          ? _value.userProfileImages
          : userProfileImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalDonationCnt: null == totalDonationCnt
          ? _value.totalDonationCnt
          : totalDonationCnt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodayProjectCopyWith<$Res>
    implements $TodayProjectCopyWith<$Res> {
  factory _$$_TodayProjectCopyWith(
          _$_TodayProject value, $Res Function(_$_TodayProject) then) =
      __$$_TodayProjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int projectId,
      String imgUrl,
      String title,
      String usages,
      String kind,
      bool like,
      List<String> userProfileImages,
      int totalDonationCnt});
}

/// @nodoc
class __$$_TodayProjectCopyWithImpl<$Res>
    extends _$TodayProjectCopyWithImpl<$Res, _$_TodayProject>
    implements _$$_TodayProjectCopyWith<$Res> {
  __$$_TodayProjectCopyWithImpl(
      _$_TodayProject _value, $Res Function(_$_TodayProject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? imgUrl = null,
    Object? title = null,
    Object? usages = null,
    Object? kind = null,
    Object? like = null,
    Object? userProfileImages = null,
    Object? totalDonationCnt = null,
  }) {
    return _then(_$_TodayProject(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      usages: null == usages
          ? _value.usages
          : usages // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
      userProfileImages: null == userProfileImages
          ? _value._userProfileImages
          : userProfileImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalDonationCnt: null == totalDonationCnt
          ? _value.totalDonationCnt
          : totalDonationCnt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodayProject with DiagnosticableTreeMixin implements _TodayProject {
  const _$_TodayProject(
      {required this.projectId,
      required this.imgUrl,
      required this.title,
      required this.usages,
      required this.kind,
      required this.like,
      required final List<String> userProfileImages,
      required this.totalDonationCnt})
      : _userProfileImages = userProfileImages;

  factory _$_TodayProject.fromJson(Map<String, dynamic> json) =>
      _$$_TodayProjectFromJson(json);

  @override
  final int projectId;
  @override
  final String imgUrl;
  @override
  final String title;
  @override
  final String usages;
  @override
  final String kind;
  @override
  final bool like;
  final List<String> _userProfileImages;
  @override
  List<String> get userProfileImages {
    if (_userProfileImages is EqualUnmodifiableListView)
      return _userProfileImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userProfileImages);
  }

  @override
  final int totalDonationCnt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodayProject(projectId: $projectId, imgUrl: $imgUrl, title: $title, usages: $usages, kind: $kind, like: $like, userProfileImages: $userProfileImages, totalDonationCnt: $totalDonationCnt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodayProject'))
      ..add(DiagnosticsProperty('projectId', projectId))
      ..add(DiagnosticsProperty('imgUrl', imgUrl))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('usages', usages))
      ..add(DiagnosticsProperty('kind', kind))
      ..add(DiagnosticsProperty('like', like))
      ..add(DiagnosticsProperty('userProfileImages', userProfileImages))
      ..add(DiagnosticsProperty('totalDonationCnt', totalDonationCnt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodayProject &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.usages, usages) || other.usages == usages) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.like, like) || other.like == like) &&
            const DeepCollectionEquality()
                .equals(other._userProfileImages, _userProfileImages) &&
            (identical(other.totalDonationCnt, totalDonationCnt) ||
                other.totalDonationCnt == totalDonationCnt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      imgUrl,
      title,
      usages,
      kind,
      like,
      const DeepCollectionEquality().hash(_userProfileImages),
      totalDonationCnt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodayProjectCopyWith<_$_TodayProject> get copyWith =>
      __$$_TodayProjectCopyWithImpl<_$_TodayProject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodayProjectToJson(
      this,
    );
  }
}

abstract class _TodayProject implements TodayProject {
  const factory _TodayProject(
      {required final int projectId,
      required final String imgUrl,
      required final String title,
      required final String usages,
      required final String kind,
      required final bool like,
      required final List<String> userProfileImages,
      required final int totalDonationCnt}) = _$_TodayProject;

  factory _TodayProject.fromJson(Map<String, dynamic> json) =
      _$_TodayProject.fromJson;

  @override
  int get projectId;
  @override
  String get imgUrl;
  @override
  String get title;
  @override
  String get usages;
  @override
  String get kind;
  @override
  bool get like;
  @override
  List<String> get userProfileImages;
  @override
  int get totalDonationCnt;
  @override
  @JsonKey(ignore: true)
  _$$_TodayProjectCopyWith<_$_TodayProject> get copyWith =>
      throw _privateConstructorUsedError;
}
