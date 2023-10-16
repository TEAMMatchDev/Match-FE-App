// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectHistory _$ProjectHistoryFromJson(Map<String, dynamic> json) {
  return _ProjectHistory.fromJson(json);
}

/// @nodoc
mixin _$ProjectHistory {
  int get historyId => throw _privateConstructorUsedError;
  String get historyStatus => throw _privateConstructorUsedError;
  String get histories => throw _privateConstructorUsedError;
  String get historyDate => throw _privateConstructorUsedError;
  String get profileImageUrl => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectHistoryCopyWith<ProjectHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectHistoryCopyWith<$Res> {
  factory $ProjectHistoryCopyWith(
          ProjectHistory value, $Res Function(ProjectHistory) then) =
      _$ProjectHistoryCopyWithImpl<$Res, ProjectHistory>;
  @useResult
  $Res call(
      {int historyId,
      String historyStatus,
      String histories,
      String historyDate,
      String profileImageUrl,
      String nickname});
}

/// @nodoc
class _$ProjectHistoryCopyWithImpl<$Res, $Val extends ProjectHistory>
    implements $ProjectHistoryCopyWith<$Res> {
  _$ProjectHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyId = null,
    Object? historyStatus = null,
    Object? histories = null,
    Object? historyDate = null,
    Object? profileImageUrl = null,
    Object? nickname = null,
  }) {
    return _then(_value.copyWith(
      historyId: null == historyId
          ? _value.historyId
          : historyId // ignore: cast_nullable_to_non_nullable
              as int,
      historyStatus: null == historyStatus
          ? _value.historyStatus
          : historyStatus // ignore: cast_nullable_to_non_nullable
              as String,
      histories: null == histories
          ? _value.histories
          : histories // ignore: cast_nullable_to_non_nullable
              as String,
      historyDate: null == historyDate
          ? _value.historyDate
          : historyDate // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectHistoryCopyWith<$Res>
    implements $ProjectHistoryCopyWith<$Res> {
  factory _$$_ProjectHistoryCopyWith(
          _$_ProjectHistory value, $Res Function(_$_ProjectHistory) then) =
      __$$_ProjectHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int historyId,
      String historyStatus,
      String histories,
      String historyDate,
      String profileImageUrl,
      String nickname});
}

/// @nodoc
class __$$_ProjectHistoryCopyWithImpl<$Res>
    extends _$ProjectHistoryCopyWithImpl<$Res, _$_ProjectHistory>
    implements _$$_ProjectHistoryCopyWith<$Res> {
  __$$_ProjectHistoryCopyWithImpl(
      _$_ProjectHistory _value, $Res Function(_$_ProjectHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyId = null,
    Object? historyStatus = null,
    Object? histories = null,
    Object? historyDate = null,
    Object? profileImageUrl = null,
    Object? nickname = null,
  }) {
    return _then(_$_ProjectHistory(
      historyId: null == historyId
          ? _value.historyId
          : historyId // ignore: cast_nullable_to_non_nullable
              as int,
      historyStatus: null == historyStatus
          ? _value.historyStatus
          : historyStatus // ignore: cast_nullable_to_non_nullable
              as String,
      histories: null == histories
          ? _value.histories
          : histories // ignore: cast_nullable_to_non_nullable
              as String,
      historyDate: null == historyDate
          ? _value.historyDate
          : historyDate // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectHistory
    with DiagnosticableTreeMixin
    implements _ProjectHistory {
  const _$_ProjectHistory(
      {required this.historyId,
      required this.historyStatus,
      required this.histories,
      required this.historyDate,
      required this.profileImageUrl,
      required this.nickname});

  factory _$_ProjectHistory.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectHistoryFromJson(json);

  @override
  final int historyId;
  @override
  final String historyStatus;
  @override
  final String histories;
  @override
  final String historyDate;
  @override
  final String profileImageUrl;
  @override
  final String nickname;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectHistory(historyId: $historyId, historyStatus: $historyStatus, histories: $histories, historyDate: $historyDate, profileImageUrl: $profileImageUrl, nickname: $nickname)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProjectHistory'))
      ..add(DiagnosticsProperty('historyId', historyId))
      ..add(DiagnosticsProperty('historyStatus', historyStatus))
      ..add(DiagnosticsProperty('histories', histories))
      ..add(DiagnosticsProperty('historyDate', historyDate))
      ..add(DiagnosticsProperty('profileImageUrl', profileImageUrl))
      ..add(DiagnosticsProperty('nickname', nickname));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectHistory &&
            (identical(other.historyId, historyId) ||
                other.historyId == historyId) &&
            (identical(other.historyStatus, historyStatus) ||
                other.historyStatus == historyStatus) &&
            (identical(other.histories, histories) ||
                other.histories == histories) &&
            (identical(other.historyDate, historyDate) ||
                other.historyDate == historyDate) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, historyId, historyStatus,
      histories, historyDate, profileImageUrl, nickname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectHistoryCopyWith<_$_ProjectHistory> get copyWith =>
      __$$_ProjectHistoryCopyWithImpl<_$_ProjectHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectHistoryToJson(
      this,
    );
  }
}

abstract class _ProjectHistory implements ProjectHistory {
  const factory _ProjectHistory(
      {required final int historyId,
      required final String historyStatus,
      required final String histories,
      required final String historyDate,
      required final String profileImageUrl,
      required final String nickname}) = _$_ProjectHistory;

  factory _ProjectHistory.fromJson(Map<String, dynamic> json) =
      _$_ProjectHistory.fromJson;

  @override
  int get historyId;
  @override
  String get historyStatus;
  @override
  String get histories;
  @override
  String get historyDate;
  @override
  String get profileImageUrl;
  @override
  String get nickname;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectHistoryCopyWith<_$_ProjectHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
