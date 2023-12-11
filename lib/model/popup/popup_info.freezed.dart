// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popup_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PopupInfo _$PopupInfoFromJson(Map<String, dynamic> json) {
  return _PopupInfo.fromJson(json);
}

/// @nodoc
mixin _$PopupInfo {
  int get executionId => throw _privateConstructorUsedError;
  String get regularStatus => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PopupInfoCopyWith<PopupInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopupInfoCopyWith<$Res> {
  factory $PopupInfoCopyWith(PopupInfo value, $Res Function(PopupInfo) then) =
      _$PopupInfoCopyWithImpl<$Res, PopupInfo>;
  @useResult
  $Res call({int executionId, String regularStatus, String title});
}

/// @nodoc
class _$PopupInfoCopyWithImpl<$Res, $Val extends PopupInfo>
    implements $PopupInfoCopyWith<$Res> {
  _$PopupInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? executionId = null,
    Object? regularStatus = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      executionId: null == executionId
          ? _value.executionId
          : executionId // ignore: cast_nullable_to_non_nullable
              as int,
      regularStatus: null == regularStatus
          ? _value.regularStatus
          : regularStatus // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopupInfoImplCopyWith<$Res>
    implements $PopupInfoCopyWith<$Res> {
  factory _$$PopupInfoImplCopyWith(
          _$PopupInfoImpl value, $Res Function(_$PopupInfoImpl) then) =
      __$$PopupInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int executionId, String regularStatus, String title});
}

/// @nodoc
class __$$PopupInfoImplCopyWithImpl<$Res>
    extends _$PopupInfoCopyWithImpl<$Res, _$PopupInfoImpl>
    implements _$$PopupInfoImplCopyWith<$Res> {
  __$$PopupInfoImplCopyWithImpl(
      _$PopupInfoImpl _value, $Res Function(_$PopupInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? executionId = null,
    Object? regularStatus = null,
    Object? title = null,
  }) {
    return _then(_$PopupInfoImpl(
      executionId: null == executionId
          ? _value.executionId
          : executionId // ignore: cast_nullable_to_non_nullable
              as int,
      regularStatus: null == regularStatus
          ? _value.regularStatus
          : regularStatus // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopupInfoImpl with DiagnosticableTreeMixin implements _PopupInfo {
  const _$PopupInfoImpl(
      {required this.executionId,
      required this.regularStatus,
      required this.title});

  factory _$PopupInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopupInfoImplFromJson(json);

  @override
  final int executionId;
  @override
  final String regularStatus;
  @override
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PopupInfo(executionId: $executionId, regularStatus: $regularStatus, title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PopupInfo'))
      ..add(DiagnosticsProperty('executionId', executionId))
      ..add(DiagnosticsProperty('regularStatus', regularStatus))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopupInfoImpl &&
            (identical(other.executionId, executionId) ||
                other.executionId == executionId) &&
            (identical(other.regularStatus, regularStatus) ||
                other.regularStatus == regularStatus) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, executionId, regularStatus, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PopupInfoImplCopyWith<_$PopupInfoImpl> get copyWith =>
      __$$PopupInfoImplCopyWithImpl<_$PopupInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopupInfoImplToJson(
      this,
    );
  }
}

abstract class _PopupInfo implements PopupInfo {
  const factory _PopupInfo(
      {required final int executionId,
      required final String regularStatus,
      required final String title}) = _$PopupInfoImpl;

  factory _PopupInfo.fromJson(Map<String, dynamic> json) =
      _$PopupInfoImpl.fromJson;

  @override
  int get executionId;
  @override
  String get regularStatus;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$PopupInfoImplCopyWith<_$PopupInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
