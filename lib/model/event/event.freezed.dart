// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  int get eventId => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get smallTitle => throw _privateConstructorUsedError;
  String get eventStatus => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {int eventId,
      String thumbnail,
      String title,
      String smallTitle,
      String eventStatus,
      String startDate,
      String endDate});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? thumbnail = null,
    Object? title = null,
    Object? smallTitle = null,
    Object? eventStatus = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      smallTitle: null == smallTitle
          ? _value.smallTitle
          : smallTitle // ignore: cast_nullable_to_non_nullable
              as String,
      eventStatus: null == eventStatus
          ? _value.eventStatus
          : eventStatus // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventImplCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int eventId,
      String thumbnail,
      String title,
      String smallTitle,
      String eventStatus,
      String startDate,
      String endDate});
}

/// @nodoc
class __$$EventImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$EventImpl>
    implements _$$EventImplCopyWith<$Res> {
  __$$EventImplCopyWithImpl(
      _$EventImpl _value, $Res Function(_$EventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? thumbnail = null,
    Object? title = null,
    Object? smallTitle = null,
    Object? eventStatus = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$EventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      smallTitle: null == smallTitle
          ? _value.smallTitle
          : smallTitle // ignore: cast_nullable_to_non_nullable
              as String,
      eventStatus: null == eventStatus
          ? _value.eventStatus
          : eventStatus // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventImpl with DiagnosticableTreeMixin implements _Event {
  const _$EventImpl(
      {required this.eventId,
      required this.thumbnail,
      required this.title,
      required this.smallTitle,
      required this.eventStatus,
      required this.startDate,
      required this.endDate});

  factory _$EventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventImplFromJson(json);

  @override
  final int eventId;
  @override
  final String thumbnail;
  @override
  final String title;
  @override
  final String smallTitle;
  @override
  final String eventStatus;
  @override
  final String startDate;
  @override
  final String endDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event(eventId: $eventId, thumbnail: $thumbnail, title: $title, smallTitle: $smallTitle, eventStatus: $eventStatus, startDate: $startDate, endDate: $endDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event'))
      ..add(DiagnosticsProperty('eventId', eventId))
      ..add(DiagnosticsProperty('thumbnail', thumbnail))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('smallTitle', smallTitle))
      ..add(DiagnosticsProperty('eventStatus', eventStatus))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('endDate', endDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.smallTitle, smallTitle) ||
                other.smallTitle == smallTitle) &&
            (identical(other.eventStatus, eventStatus) ||
                other.eventStatus == eventStatus) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, thumbnail, title,
      smallTitle, eventStatus, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      __$$EventImplCopyWithImpl<_$EventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventImplToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {required final int eventId,
      required final String thumbnail,
      required final String title,
      required final String smallTitle,
      required final String eventStatus,
      required final String startDate,
      required final String endDate}) = _$EventImpl;

  factory _Event.fromJson(Map<String, dynamic> json) = _$EventImpl.fromJson;

  @override
  int get eventId;
  @override
  String get thumbnail;
  @override
  String get title;
  @override
  String get smallTitle;
  @override
  String get eventStatus;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  @JsonKey(ignore: true)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventInfo _$EventInfoFromJson(Map<String, dynamic> json) {
  return _EventInfo.fromJson(json);
}

/// @nodoc
mixin _$EventInfo {
  int get eventId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get smallTitle => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventInfoCopyWith<EventInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventInfoCopyWith<$Res> {
  factory $EventInfoCopyWith(EventInfo value, $Res Function(EventInfo) then) =
      _$EventInfoCopyWithImpl<$Res, EventInfo>;
  @useResult
  $Res call(
      {int eventId,
      String title,
      String smallTitle,
      String startDate,
      String endDate});
}

/// @nodoc
class _$EventInfoCopyWithImpl<$Res, $Val extends EventInfo>
    implements $EventInfoCopyWith<$Res> {
  _$EventInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? title = null,
    Object? smallTitle = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      smallTitle: null == smallTitle
          ? _value.smallTitle
          : smallTitle // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventInfoImplCopyWith<$Res>
    implements $EventInfoCopyWith<$Res> {
  factory _$$EventInfoImplCopyWith(
          _$EventInfoImpl value, $Res Function(_$EventInfoImpl) then) =
      __$$EventInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int eventId,
      String title,
      String smallTitle,
      String startDate,
      String endDate});
}

/// @nodoc
class __$$EventInfoImplCopyWithImpl<$Res>
    extends _$EventInfoCopyWithImpl<$Res, _$EventInfoImpl>
    implements _$$EventInfoImplCopyWith<$Res> {
  __$$EventInfoImplCopyWithImpl(
      _$EventInfoImpl _value, $Res Function(_$EventInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? title = null,
    Object? smallTitle = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$EventInfoImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      smallTitle: null == smallTitle
          ? _value.smallTitle
          : smallTitle // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventInfoImpl with DiagnosticableTreeMixin implements _EventInfo {
  const _$EventInfoImpl(
      {required this.eventId,
      required this.title,
      required this.smallTitle,
      required this.startDate,
      required this.endDate});

  factory _$EventInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventInfoImplFromJson(json);

  @override
  final int eventId;
  @override
  final String title;
  @override
  final String smallTitle;
  @override
  final String startDate;
  @override
  final String endDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventInfo(eventId: $eventId, title: $title, smallTitle: $smallTitle, startDate: $startDate, endDate: $endDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventInfo'))
      ..add(DiagnosticsProperty('eventId', eventId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('smallTitle', smallTitle))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('endDate', endDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventInfoImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.smallTitle, smallTitle) ||
                other.smallTitle == smallTitle) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, title, smallTitle, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventInfoImplCopyWith<_$EventInfoImpl> get copyWith =>
      __$$EventInfoImplCopyWithImpl<_$EventInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventInfoImplToJson(
      this,
    );
  }
}

abstract class _EventInfo implements EventInfo {
  const factory _EventInfo(
      {required final int eventId,
      required final String title,
      required final String smallTitle,
      required final String startDate,
      required final String endDate}) = _$EventInfoImpl;

  factory _EventInfo.fromJson(Map<String, dynamic> json) =
      _$EventInfoImpl.fromJson;

  @override
  int get eventId;
  @override
  String get title;
  @override
  String get smallTitle;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  @JsonKey(ignore: true)
  _$$EventInfoImplCopyWith<_$EventInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
