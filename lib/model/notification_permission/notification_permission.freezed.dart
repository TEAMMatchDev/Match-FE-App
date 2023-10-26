// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_permission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationPermission _$NotificationPermissionFromJson(
    Map<String, dynamic> json) {
  return _NotificationPermission.fromJson(json);
}

/// @nodoc
mixin _$NotificationPermission {
  bool get serviceAlarm => throw _privateConstructorUsedError;
  bool get eventAlarm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationPermissionCopyWith<NotificationPermission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPermissionCopyWith<$Res> {
  factory $NotificationPermissionCopyWith(NotificationPermission value,
          $Res Function(NotificationPermission) then) =
      _$NotificationPermissionCopyWithImpl<$Res, NotificationPermission>;
  @useResult
  $Res call({bool serviceAlarm, bool eventAlarm});
}

/// @nodoc
class _$NotificationPermissionCopyWithImpl<$Res,
        $Val extends NotificationPermission>
    implements $NotificationPermissionCopyWith<$Res> {
  _$NotificationPermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceAlarm = null,
    Object? eventAlarm = null,
  }) {
    return _then(_value.copyWith(
      serviceAlarm: null == serviceAlarm
          ? _value.serviceAlarm
          : serviceAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
      eventAlarm: null == eventAlarm
          ? _value.eventAlarm
          : eventAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationPermissionImplCopyWith<$Res>
    implements $NotificationPermissionCopyWith<$Res> {
  factory _$$NotificationPermissionImplCopyWith(
          _$NotificationPermissionImpl value,
          $Res Function(_$NotificationPermissionImpl) then) =
      __$$NotificationPermissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool serviceAlarm, bool eventAlarm});
}

/// @nodoc
class __$$NotificationPermissionImplCopyWithImpl<$Res>
    extends _$NotificationPermissionCopyWithImpl<$Res,
        _$NotificationPermissionImpl>
    implements _$$NotificationPermissionImplCopyWith<$Res> {
  __$$NotificationPermissionImplCopyWithImpl(
      _$NotificationPermissionImpl _value,
      $Res Function(_$NotificationPermissionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceAlarm = null,
    Object? eventAlarm = null,
  }) {
    return _then(_$NotificationPermissionImpl(
      serviceAlarm: null == serviceAlarm
          ? _value.serviceAlarm
          : serviceAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
      eventAlarm: null == eventAlarm
          ? _value.eventAlarm
          : eventAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationPermissionImpl
    with DiagnosticableTreeMixin
    implements _NotificationPermission {
  const _$NotificationPermissionImpl(
      {required this.serviceAlarm, required this.eventAlarm});

  factory _$NotificationPermissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationPermissionImplFromJson(json);

  @override
  final bool serviceAlarm;
  @override
  final bool eventAlarm;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationPermission(serviceAlarm: $serviceAlarm, eventAlarm: $eventAlarm)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationPermission'))
      ..add(DiagnosticsProperty('serviceAlarm', serviceAlarm))
      ..add(DiagnosticsProperty('eventAlarm', eventAlarm));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationPermissionImpl &&
            (identical(other.serviceAlarm, serviceAlarm) ||
                other.serviceAlarm == serviceAlarm) &&
            (identical(other.eventAlarm, eventAlarm) ||
                other.eventAlarm == eventAlarm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, serviceAlarm, eventAlarm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationPermissionImplCopyWith<_$NotificationPermissionImpl>
      get copyWith => __$$NotificationPermissionImplCopyWithImpl<
          _$NotificationPermissionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationPermissionImplToJson(
      this,
    );
  }
}

abstract class _NotificationPermission implements NotificationPermission {
  const factory _NotificationPermission(
      {required final bool serviceAlarm,
      required final bool eventAlarm}) = _$NotificationPermissionImpl;

  factory _NotificationPermission.fromJson(Map<String, dynamic> json) =
      _$NotificationPermissionImpl.fromJson;

  @override
  bool get serviceAlarm;
  @override
  bool get eventAlarm;
  @override
  @JsonKey(ignore: true)
  _$$NotificationPermissionImplCopyWith<_$NotificationPermissionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
