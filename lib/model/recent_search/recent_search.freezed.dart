// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentSearch _$RecentSearchFromJson(Map<String, dynamic> json) {
  return _RecentSearch.fromJson(json);
}

/// @nodoc
mixin _$RecentSearch {
  String get name => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get donationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentSearchCopyWith<RecentSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentSearchCopyWith<$Res> {
  factory $RecentSearchCopyWith(
          RecentSearch value, $Res Function(RecentSearch) then) =
      _$RecentSearchCopyWithImpl<$Res, RecentSearch>;
  @useResult
  $Res call({String name, String title, int donationId});
}

/// @nodoc
class _$RecentSearchCopyWithImpl<$Res, $Val extends RecentSearch>
    implements $RecentSearchCopyWith<$Res> {
  _$RecentSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? title = null,
    Object? donationId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      donationId: null == donationId
          ? _value.donationId
          : donationId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentSearchImplCopyWith<$Res>
    implements $RecentSearchCopyWith<$Res> {
  factory _$$RecentSearchImplCopyWith(
          _$RecentSearchImpl value, $Res Function(_$RecentSearchImpl) then) =
      __$$RecentSearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String title, int donationId});
}

/// @nodoc
class __$$RecentSearchImplCopyWithImpl<$Res>
    extends _$RecentSearchCopyWithImpl<$Res, _$RecentSearchImpl>
    implements _$$RecentSearchImplCopyWith<$Res> {
  __$$RecentSearchImplCopyWithImpl(
      _$RecentSearchImpl _value, $Res Function(_$RecentSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? title = null,
    Object? donationId = null,
  }) {
    return _then(_$RecentSearchImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      donationId: null == donationId
          ? _value.donationId
          : donationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentSearchImpl with DiagnosticableTreeMixin implements _RecentSearch {
  const _$RecentSearchImpl(
      {required this.name, required this.title, required this.donationId});

  factory _$RecentSearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentSearchImplFromJson(json);

  @override
  final String name;
  @override
  final String title;
  @override
  final int donationId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecentSearch(name: $name, title: $title, donationId: $donationId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecentSearch'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('donationId', donationId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentSearchImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.donationId, donationId) ||
                other.donationId == donationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, title, donationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentSearchImplCopyWith<_$RecentSearchImpl> get copyWith =>
      __$$RecentSearchImplCopyWithImpl<_$RecentSearchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentSearchImplToJson(
      this,
    );
  }
}

abstract class _RecentSearch implements RecentSearch {
  const factory _RecentSearch(
      {required final String name,
      required final String title,
      required final int donationId}) = _$RecentSearchImpl;

  factory _RecentSearch.fromJson(Map<String, dynamic> json) =
      _$RecentSearchImpl.fromJson;

  @override
  String get name;
  @override
  String get title;
  @override
  int get donationId;
  @override
  @JsonKey(ignore: true)
  _$$RecentSearchImplCopyWith<_$RecentSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
