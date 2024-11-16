// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewInfo _$ReviewInfoFromJson(Map<String, dynamic> json) {
  return _ReviewInfo.fromJson(json);
}

/// @nodoc
mixin _$ReviewInfo {
  String get userName => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get reviewText => throw _privateConstructorUsedError;
  List<String> get reviewImageUrl => throw _privateConstructorUsedError;

  /// Serializes this ReviewInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewInfoCopyWith<ReviewInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewInfoCopyWith<$Res> {
  factory $ReviewInfoCopyWith(
          ReviewInfo value, $Res Function(ReviewInfo) then) =
      _$ReviewInfoCopyWithImpl<$Res, ReviewInfo>;
  @useResult
  $Res call(
      {String userName,
      String rating,
      DateTime timestamp,
      String reviewText,
      List<String> reviewImageUrl});
}

/// @nodoc
class _$ReviewInfoCopyWithImpl<$Res, $Val extends ReviewInfo>
    implements $ReviewInfoCopyWith<$Res> {
  _$ReviewInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? rating = null,
    Object? timestamp = null,
    Object? reviewText = null,
    Object? reviewImageUrl = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviewText: null == reviewText
          ? _value.reviewText
          : reviewText // ignore: cast_nullable_to_non_nullable
              as String,
      reviewImageUrl: null == reviewImageUrl
          ? _value.reviewImageUrl
          : reviewImageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewInfoImplCopyWith<$Res>
    implements $ReviewInfoCopyWith<$Res> {
  factory _$$ReviewInfoImplCopyWith(
          _$ReviewInfoImpl value, $Res Function(_$ReviewInfoImpl) then) =
      __$$ReviewInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String rating,
      DateTime timestamp,
      String reviewText,
      List<String> reviewImageUrl});
}

/// @nodoc
class __$$ReviewInfoImplCopyWithImpl<$Res>
    extends _$ReviewInfoCopyWithImpl<$Res, _$ReviewInfoImpl>
    implements _$$ReviewInfoImplCopyWith<$Res> {
  __$$ReviewInfoImplCopyWithImpl(
      _$ReviewInfoImpl _value, $Res Function(_$ReviewInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? rating = null,
    Object? timestamp = null,
    Object? reviewText = null,
    Object? reviewImageUrl = null,
  }) {
    return _then(_$ReviewInfoImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviewText: null == reviewText
          ? _value.reviewText
          : reviewText // ignore: cast_nullable_to_non_nullable
              as String,
      reviewImageUrl: null == reviewImageUrl
          ? _value._reviewImageUrl
          : reviewImageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewInfoImpl implements _ReviewInfo {
  const _$ReviewInfoImpl(
      {required this.userName,
      required this.rating,
      required this.timestamp,
      required this.reviewText,
      required final List<String> reviewImageUrl})
      : _reviewImageUrl = reviewImageUrl;

  factory _$ReviewInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewInfoImplFromJson(json);

  @override
  final String userName;
  @override
  final String rating;
  @override
  final DateTime timestamp;
  @override
  final String reviewText;
  final List<String> _reviewImageUrl;
  @override
  List<String> get reviewImageUrl {
    if (_reviewImageUrl is EqualUnmodifiableListView) return _reviewImageUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewImageUrl);
  }

  @override
  String toString() {
    return 'ReviewInfo(userName: $userName, rating: $rating, timestamp: $timestamp, reviewText: $reviewText, reviewImageUrl: $reviewImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewInfoImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.reviewText, reviewText) ||
                other.reviewText == reviewText) &&
            const DeepCollectionEquality()
                .equals(other._reviewImageUrl, _reviewImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userName, rating, timestamp,
      reviewText, const DeepCollectionEquality().hash(_reviewImageUrl));

  /// Create a copy of ReviewInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewInfoImplCopyWith<_$ReviewInfoImpl> get copyWith =>
      __$$ReviewInfoImplCopyWithImpl<_$ReviewInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewInfoImplToJson(
      this,
    );
  }
}

abstract class _ReviewInfo implements ReviewInfo {
  const factory _ReviewInfo(
      {required final String userName,
      required final String rating,
      required final DateTime timestamp,
      required final String reviewText,
      required final List<String> reviewImageUrl}) = _$ReviewInfoImpl;

  factory _ReviewInfo.fromJson(Map<String, dynamic> json) =
      _$ReviewInfoImpl.fromJson;

  @override
  String get userName;
  @override
  String get rating;
  @override
  DateTime get timestamp;
  @override
  String get reviewText;
  @override
  List<String> get reviewImageUrl;

  /// Create a copy of ReviewInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewInfoImplCopyWith<_$ReviewInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
