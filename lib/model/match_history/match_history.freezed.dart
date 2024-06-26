// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchHistory _$MatchHistoryFromJson(Map<String, dynamic> json) {
  return _MatchHistory.fromJson(json);
}

/// @nodoc
mixin _$MatchHistory {
  int get historyId => throw _privateConstructorUsedError;
  String get historyStatus => throw _privateConstructorUsedError;
  String get histories => throw _privateConstructorUsedError;
  String get historyDate => throw _privateConstructorUsedError;
  String? get flameImage => throw _privateConstructorUsedError;
  List<HistoryImages>? get donationHistoryImages =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchHistoryCopyWith<MatchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchHistoryCopyWith<$Res> {
  factory $MatchHistoryCopyWith(
          MatchHistory value, $Res Function(MatchHistory) then) =
      _$MatchHistoryCopyWithImpl<$Res, MatchHistory>;
  @useResult
  $Res call(
      {int historyId,
      String historyStatus,
      String histories,
      String historyDate,
      String? flameImage,
      List<HistoryImages>? donationHistoryImages});
}

/// @nodoc
class _$MatchHistoryCopyWithImpl<$Res, $Val extends MatchHistory>
    implements $MatchHistoryCopyWith<$Res> {
  _$MatchHistoryCopyWithImpl(this._value, this._then);

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
    Object? flameImage = freezed,
    Object? donationHistoryImages = freezed,
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
      flameImage: freezed == flameImage
          ? _value.flameImage
          : flameImage // ignore: cast_nullable_to_non_nullable
              as String?,
      donationHistoryImages: freezed == donationHistoryImages
          ? _value.donationHistoryImages
          : donationHistoryImages // ignore: cast_nullable_to_non_nullable
              as List<HistoryImages>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchHistoryImplCopyWith<$Res>
    implements $MatchHistoryCopyWith<$Res> {
  factory _$$MatchHistoryImplCopyWith(
          _$MatchHistoryImpl value, $Res Function(_$MatchHistoryImpl) then) =
      __$$MatchHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int historyId,
      String historyStatus,
      String histories,
      String historyDate,
      String? flameImage,
      List<HistoryImages>? donationHistoryImages});
}

/// @nodoc
class __$$MatchHistoryImplCopyWithImpl<$Res>
    extends _$MatchHistoryCopyWithImpl<$Res, _$MatchHistoryImpl>
    implements _$$MatchHistoryImplCopyWith<$Res> {
  __$$MatchHistoryImplCopyWithImpl(
      _$MatchHistoryImpl _value, $Res Function(_$MatchHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyId = null,
    Object? historyStatus = null,
    Object? histories = null,
    Object? historyDate = null,
    Object? flameImage = freezed,
    Object? donationHistoryImages = freezed,
  }) {
    return _then(_$MatchHistoryImpl(
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
      flameImage: freezed == flameImage
          ? _value.flameImage
          : flameImage // ignore: cast_nullable_to_non_nullable
              as String?,
      donationHistoryImages: freezed == donationHistoryImages
          ? _value._donationHistoryImages
          : donationHistoryImages // ignore: cast_nullable_to_non_nullable
              as List<HistoryImages>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchHistoryImpl with DiagnosticableTreeMixin implements _MatchHistory {
  const _$MatchHistoryImpl(
      {required this.historyId,
      required this.historyStatus,
      required this.histories,
      required this.historyDate,
      this.flameImage,
      final List<HistoryImages>? donationHistoryImages})
      : _donationHistoryImages = donationHistoryImages;

  factory _$MatchHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchHistoryImplFromJson(json);

  @override
  final int historyId;
  @override
  final String historyStatus;
  @override
  final String histories;
  @override
  final String historyDate;
  @override
  final String? flameImage;
  final List<HistoryImages>? _donationHistoryImages;
  @override
  List<HistoryImages>? get donationHistoryImages {
    final value = _donationHistoryImages;
    if (value == null) return null;
    if (_donationHistoryImages is EqualUnmodifiableListView)
      return _donationHistoryImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchHistory(historyId: $historyId, historyStatus: $historyStatus, histories: $histories, historyDate: $historyDate, flameImage: $flameImage, donationHistoryImages: $donationHistoryImages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchHistory'))
      ..add(DiagnosticsProperty('historyId', historyId))
      ..add(DiagnosticsProperty('historyStatus', historyStatus))
      ..add(DiagnosticsProperty('histories', histories))
      ..add(DiagnosticsProperty('historyDate', historyDate))
      ..add(DiagnosticsProperty('flameImage', flameImage))
      ..add(
          DiagnosticsProperty('donationHistoryImages', donationHistoryImages));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchHistoryImpl &&
            (identical(other.historyId, historyId) ||
                other.historyId == historyId) &&
            (identical(other.historyStatus, historyStatus) ||
                other.historyStatus == historyStatus) &&
            (identical(other.histories, histories) ||
                other.histories == histories) &&
            (identical(other.historyDate, historyDate) ||
                other.historyDate == historyDate) &&
            (identical(other.flameImage, flameImage) ||
                other.flameImage == flameImage) &&
            const DeepCollectionEquality()
                .equals(other._donationHistoryImages, _donationHistoryImages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      historyId,
      historyStatus,
      histories,
      historyDate,
      flameImage,
      const DeepCollectionEquality().hash(_donationHistoryImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchHistoryImplCopyWith<_$MatchHistoryImpl> get copyWith =>
      __$$MatchHistoryImplCopyWithImpl<_$MatchHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchHistoryImplToJson(
      this,
    );
  }
}

abstract class _MatchHistory implements MatchHistory {
  const factory _MatchHistory(
      {required final int historyId,
      required final String historyStatus,
      required final String histories,
      required final String historyDate,
      final String? flameImage,
      final List<HistoryImages>? donationHistoryImages}) = _$MatchHistoryImpl;

  factory _MatchHistory.fromJson(Map<String, dynamic> json) =
      _$MatchHistoryImpl.fromJson;

  @override
  int get historyId;
  @override
  String get historyStatus;
  @override
  String get histories;
  @override
  String get historyDate;
  @override
  String? get flameImage;
  @override
  List<HistoryImages>? get donationHistoryImages;
  @override
  @JsonKey(ignore: true)
  _$$MatchHistoryImplCopyWith<_$MatchHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HistoryImages _$HistoryImagesFromJson(Map<String, dynamic> json) {
  return _HistoryImages.fromJson(json);
}

/// @nodoc
mixin _$HistoryImages {
  int get imageId => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryImagesCopyWith<HistoryImages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryImagesCopyWith<$Res> {
  factory $HistoryImagesCopyWith(
          HistoryImages value, $Res Function(HistoryImages) then) =
      _$HistoryImagesCopyWithImpl<$Res, HistoryImages>;
  @useResult
  $Res call({int imageId, String imageUrl});
}

/// @nodoc
class _$HistoryImagesCopyWithImpl<$Res, $Val extends HistoryImages>
    implements $HistoryImagesCopyWith<$Res> {
  _$HistoryImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryImagesImplCopyWith<$Res>
    implements $HistoryImagesCopyWith<$Res> {
  factory _$$HistoryImagesImplCopyWith(
          _$HistoryImagesImpl value, $Res Function(_$HistoryImagesImpl) then) =
      __$$HistoryImagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int imageId, String imageUrl});
}

/// @nodoc
class __$$HistoryImagesImplCopyWithImpl<$Res>
    extends _$HistoryImagesCopyWithImpl<$Res, _$HistoryImagesImpl>
    implements _$$HistoryImagesImplCopyWith<$Res> {
  __$$HistoryImagesImplCopyWithImpl(
      _$HistoryImagesImpl _value, $Res Function(_$HistoryImagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = null,
    Object? imageUrl = null,
  }) {
    return _then(_$HistoryImagesImpl(
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryImagesImpl
    with DiagnosticableTreeMixin
    implements _HistoryImages {
  const _$HistoryImagesImpl({required this.imageId, required this.imageUrl});

  factory _$HistoryImagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryImagesImplFromJson(json);

  @override
  final int imageId;
  @override
  final String imageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HistoryImages(imageId: $imageId, imageUrl: $imageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HistoryImages'))
      ..add(DiagnosticsProperty('imageId', imageId))
      ..add(DiagnosticsProperty('imageUrl', imageUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryImagesImpl &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageId, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryImagesImplCopyWith<_$HistoryImagesImpl> get copyWith =>
      __$$HistoryImagesImplCopyWithImpl<_$HistoryImagesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryImagesImplToJson(
      this,
    );
  }
}

abstract class _HistoryImages implements HistoryImages {
  const factory _HistoryImages(
      {required final int imageId,
      required final String imageUrl}) = _$HistoryImagesImpl;

  factory _HistoryImages.fromJson(Map<String, dynamic> json) =
      _$HistoryImagesImpl.fromJson;

  @override
  int get imageId;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$HistoryImagesImplCopyWith<_$HistoryImagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
