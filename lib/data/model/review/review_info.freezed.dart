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
  Intensitylevel? get acidity => throw _privateConstructorUsedError;
  Intensitylevel? get body => throw _privateConstructorUsedError;
  Intensitylevel? get bitterness => throw _privateConstructorUsedError;
  Intensitylevel? get sweetness => throw _privateConstructorUsedError;
  List<Aroma>? get aroma => throw _privateConstructorUsedError;

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
      List<String> reviewImageUrl,
      Intensitylevel? acidity,
      Intensitylevel? body,
      Intensitylevel? bitterness,
      Intensitylevel? sweetness,
      List<Aroma>? aroma});
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
    Object? acidity = freezed,
    Object? body = freezed,
    Object? bitterness = freezed,
    Object? sweetness = freezed,
    Object? aroma = freezed,
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
      acidity: freezed == acidity
          ? _value.acidity
          : acidity // ignore: cast_nullable_to_non_nullable
              as Intensitylevel?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as Intensitylevel?,
      bitterness: freezed == bitterness
          ? _value.bitterness
          : bitterness // ignore: cast_nullable_to_non_nullable
              as Intensitylevel?,
      sweetness: freezed == sweetness
          ? _value.sweetness
          : sweetness // ignore: cast_nullable_to_non_nullable
              as Intensitylevel?,
      aroma: freezed == aroma
          ? _value.aroma
          : aroma // ignore: cast_nullable_to_non_nullable
              as List<Aroma>?,
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
      List<String> reviewImageUrl,
      Intensitylevel? acidity,
      Intensitylevel? body,
      Intensitylevel? bitterness,
      Intensitylevel? sweetness,
      List<Aroma>? aroma});
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
    Object? acidity = freezed,
    Object? body = freezed,
    Object? bitterness = freezed,
    Object? sweetness = freezed,
    Object? aroma = freezed,
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
      acidity: freezed == acidity
          ? _value.acidity
          : acidity // ignore: cast_nullable_to_non_nullable
              as Intensitylevel?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as Intensitylevel?,
      bitterness: freezed == bitterness
          ? _value.bitterness
          : bitterness // ignore: cast_nullable_to_non_nullable
              as Intensitylevel?,
      sweetness: freezed == sweetness
          ? _value.sweetness
          : sweetness // ignore: cast_nullable_to_non_nullable
              as Intensitylevel?,
      aroma: freezed == aroma
          ? _value._aroma
          : aroma // ignore: cast_nullable_to_non_nullable
              as List<Aroma>?,
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
      required final List<String> reviewImageUrl,
      required this.acidity,
      required this.body,
      required this.bitterness,
      required this.sweetness,
      required final List<Aroma>? aroma})
      : _reviewImageUrl = reviewImageUrl,
        _aroma = aroma;

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
  final Intensitylevel? acidity;
  @override
  final Intensitylevel? body;
  @override
  final Intensitylevel? bitterness;
  @override
  final Intensitylevel? sweetness;
  final List<Aroma>? _aroma;
  @override
  List<Aroma>? get aroma {
    final value = _aroma;
    if (value == null) return null;
    if (_aroma is EqualUnmodifiableListView) return _aroma;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReviewInfo(userName: $userName, rating: $rating, timestamp: $timestamp, reviewText: $reviewText, reviewImageUrl: $reviewImageUrl, acidity: $acidity, body: $body, bitterness: $bitterness, sweetness: $sweetness, aroma: $aroma)';
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
                .equals(other._reviewImageUrl, _reviewImageUrl) &&
            (identical(other.acidity, acidity) || other.acidity == acidity) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.bitterness, bitterness) ||
                other.bitterness == bitterness) &&
            (identical(other.sweetness, sweetness) ||
                other.sweetness == sweetness) &&
            const DeepCollectionEquality().equals(other._aroma, _aroma));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userName,
      rating,
      timestamp,
      reviewText,
      const DeepCollectionEquality().hash(_reviewImageUrl),
      acidity,
      body,
      bitterness,
      sweetness,
      const DeepCollectionEquality().hash(_aroma));

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
      required final List<String> reviewImageUrl,
      required final Intensitylevel? acidity,
      required final Intensitylevel? body,
      required final Intensitylevel? bitterness,
      required final Intensitylevel? sweetness,
      required final List<Aroma>? aroma}) = _$ReviewInfoImpl;

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
  @override
  Intensitylevel? get acidity;
  @override
  Intensitylevel? get body;
  @override
  Intensitylevel? get bitterness;
  @override
  Intensitylevel? get sweetness;
  @override
  List<Aroma>? get aroma;

  /// Create a copy of ReviewInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewInfoImplCopyWith<_$ReviewInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
