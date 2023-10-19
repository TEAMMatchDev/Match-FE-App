// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banners.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Banners _$BannersFromJson(Map<String, dynamic> json) {
  return _Banners.fromJson(json);
}

/// @nodoc
mixin _$Banners {
  int get bannerId => throw _privateConstructorUsedError;
  String get bannerType => throw _privateConstructorUsedError;
  String get bannerImg => throw _privateConstructorUsedError;
  String? get eventId => throw _privateConstructorUsedError;
  String get contentsUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BannersCopyWith<Banners> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannersCopyWith<$Res> {
  factory $BannersCopyWith(Banners value, $Res Function(Banners) then) =
      _$BannersCopyWithImpl<$Res, Banners>;
  @useResult
  $Res call(
      {int bannerId,
      String bannerType,
      String bannerImg,
      String? eventId,
      String contentsUrl});
}

/// @nodoc
class _$BannersCopyWithImpl<$Res, $Val extends Banners>
    implements $BannersCopyWith<$Res> {
  _$BannersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerId = null,
    Object? bannerType = null,
    Object? bannerImg = null,
    Object? eventId = freezed,
    Object? contentsUrl = null,
  }) {
    return _then(_value.copyWith(
      bannerId: null == bannerId
          ? _value.bannerId
          : bannerId // ignore: cast_nullable_to_non_nullable
              as int,
      bannerType: null == bannerType
          ? _value.bannerType
          : bannerType // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImg: null == bannerImg
          ? _value.bannerImg
          : bannerImg // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentsUrl: null == contentsUrl
          ? _value.contentsUrl
          : contentsUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannersImplCopyWith<$Res> implements $BannersCopyWith<$Res> {
  factory _$$BannersImplCopyWith(
          _$BannersImpl value, $Res Function(_$BannersImpl) then) =
      __$$BannersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int bannerId,
      String bannerType,
      String bannerImg,
      String? eventId,
      String contentsUrl});
}

/// @nodoc
class __$$BannersImplCopyWithImpl<$Res>
    extends _$BannersCopyWithImpl<$Res, _$BannersImpl>
    implements _$$BannersImplCopyWith<$Res> {
  __$$BannersImplCopyWithImpl(
      _$BannersImpl _value, $Res Function(_$BannersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerId = null,
    Object? bannerType = null,
    Object? bannerImg = null,
    Object? eventId = freezed,
    Object? contentsUrl = null,
  }) {
    return _then(_$BannersImpl(
      bannerId: null == bannerId
          ? _value.bannerId
          : bannerId // ignore: cast_nullable_to_non_nullable
              as int,
      bannerType: null == bannerType
          ? _value.bannerType
          : bannerType // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImg: null == bannerImg
          ? _value.bannerImg
          : bannerImg // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentsUrl: null == contentsUrl
          ? _value.contentsUrl
          : contentsUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BannersImpl with DiagnosticableTreeMixin implements _Banners {
  const _$BannersImpl(
      {required this.bannerId,
      required this.bannerType,
      required this.bannerImg,
      this.eventId,
      required this.contentsUrl});

  factory _$BannersImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannersImplFromJson(json);

  @override
  final int bannerId;
  @override
  final String bannerType;
  @override
  final String bannerImg;
  @override
  final String? eventId;
  @override
  final String contentsUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Banners(bannerId: $bannerId, bannerType: $bannerType, bannerImg: $bannerImg, eventId: $eventId, contentsUrl: $contentsUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Banners'))
      ..add(DiagnosticsProperty('bannerId', bannerId))
      ..add(DiagnosticsProperty('bannerType', bannerType))
      ..add(DiagnosticsProperty('bannerImg', bannerImg))
      ..add(DiagnosticsProperty('eventId', eventId))
      ..add(DiagnosticsProperty('contentsUrl', contentsUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannersImpl &&
            (identical(other.bannerId, bannerId) ||
                other.bannerId == bannerId) &&
            (identical(other.bannerType, bannerType) ||
                other.bannerType == bannerType) &&
            (identical(other.bannerImg, bannerImg) ||
                other.bannerImg == bannerImg) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.contentsUrl, contentsUrl) ||
                other.contentsUrl == contentsUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, bannerId, bannerType, bannerImg, eventId, contentsUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannersImplCopyWith<_$BannersImpl> get copyWith =>
      __$$BannersImplCopyWithImpl<_$BannersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BannersImplToJson(
      this,
    );
  }
}

abstract class _Banners implements Banners {
  const factory _Banners(
      {required final int bannerId,
      required final String bannerType,
      required final String bannerImg,
      final String? eventId,
      required final String contentsUrl}) = _$BannersImpl;

  factory _Banners.fromJson(Map<String, dynamic> json) = _$BannersImpl.fromJson;

  @override
  int get bannerId;
  @override
  String get bannerType;
  @override
  String get bannerImg;
  @override
  String? get eventId;
  @override
  String get contentsUrl;
  @override
  @JsonKey(ignore: true)
  _$$BannersImplCopyWith<_$BannersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
