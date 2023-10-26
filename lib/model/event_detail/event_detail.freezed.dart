// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventDetail _$EventDetailFromJson(Map<String, dynamic> json) {
  return _EventDetail.fromJson(json);
}

/// @nodoc
mixin _$EventDetail {
  EventInfo get eventInfo => throw _privateConstructorUsedError;
  List<Contents> get eventContents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventDetailCopyWith<EventDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDetailCopyWith<$Res> {
  factory $EventDetailCopyWith(
          EventDetail value, $Res Function(EventDetail) then) =
      _$EventDetailCopyWithImpl<$Res, EventDetail>;
  @useResult
  $Res call({EventInfo eventInfo, List<Contents> eventContents});

  $EventInfoCopyWith<$Res> get eventInfo;
}

/// @nodoc
class _$EventDetailCopyWithImpl<$Res, $Val extends EventDetail>
    implements $EventDetailCopyWith<$Res> {
  _$EventDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventInfo = null,
    Object? eventContents = null,
  }) {
    return _then(_value.copyWith(
      eventInfo: null == eventInfo
          ? _value.eventInfo
          : eventInfo // ignore: cast_nullable_to_non_nullable
              as EventInfo,
      eventContents: null == eventContents
          ? _value.eventContents
          : eventContents // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EventInfoCopyWith<$Res> get eventInfo {
    return $EventInfoCopyWith<$Res>(_value.eventInfo, (value) {
      return _then(_value.copyWith(eventInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventDetailImplCopyWith<$Res>
    implements $EventDetailCopyWith<$Res> {
  factory _$$EventDetailImplCopyWith(
          _$EventDetailImpl value, $Res Function(_$EventDetailImpl) then) =
      __$$EventDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EventInfo eventInfo, List<Contents> eventContents});

  @override
  $EventInfoCopyWith<$Res> get eventInfo;
}

/// @nodoc
class __$$EventDetailImplCopyWithImpl<$Res>
    extends _$EventDetailCopyWithImpl<$Res, _$EventDetailImpl>
    implements _$$EventDetailImplCopyWith<$Res> {
  __$$EventDetailImplCopyWithImpl(
      _$EventDetailImpl _value, $Res Function(_$EventDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventInfo = null,
    Object? eventContents = null,
  }) {
    return _then(_$EventDetailImpl(
      eventInfo: null == eventInfo
          ? _value.eventInfo
          : eventInfo // ignore: cast_nullable_to_non_nullable
              as EventInfo,
      eventContents: null == eventContents
          ? _value._eventContents
          : eventContents // ignore: cast_nullable_to_non_nullable
              as List<Contents>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventDetailImpl with DiagnosticableTreeMixin implements _EventDetail {
  const _$EventDetailImpl(
      {required this.eventInfo, required final List<Contents> eventContents})
      : _eventContents = eventContents;

  factory _$EventDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventDetailImplFromJson(json);

  @override
  final EventInfo eventInfo;
  final List<Contents> _eventContents;
  @override
  List<Contents> get eventContents {
    if (_eventContents is EqualUnmodifiableListView) return _eventContents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventContents);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventDetail(eventInfo: $eventInfo, eventContents: $eventContents)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventDetail'))
      ..add(DiagnosticsProperty('eventInfo', eventInfo))
      ..add(DiagnosticsProperty('eventContents', eventContents));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDetailImpl &&
            (identical(other.eventInfo, eventInfo) ||
                other.eventInfo == eventInfo) &&
            const DeepCollectionEquality()
                .equals(other._eventContents, _eventContents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventInfo,
      const DeepCollectionEquality().hash(_eventContents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDetailImplCopyWith<_$EventDetailImpl> get copyWith =>
      __$$EventDetailImplCopyWithImpl<_$EventDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventDetailImplToJson(
      this,
    );
  }
}

abstract class _EventDetail implements EventDetail {
  const factory _EventDetail(
      {required final EventInfo eventInfo,
      required final List<Contents> eventContents}) = _$EventDetailImpl;

  factory _EventDetail.fromJson(Map<String, dynamic> json) =
      _$EventDetailImpl.fromJson;

  @override
  EventInfo get eventInfo;
  @override
  List<Contents> get eventContents;
  @override
  @JsonKey(ignore: true)
  _$$EventDetailImplCopyWith<_$EventDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
