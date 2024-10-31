// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cafe_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CafeInfo _$CafeInfoFromJson(Map<String, dynamic> json) {
  return _CafeInfo.fromJson(json);
}

/// @nodoc
mixin _$CafeInfo {
  String get cafeName => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get ratingCount => throw _privateConstructorUsedError;
  bool get isLike => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  String get cafeImageUrl => throw _privateConstructorUsedError;

  /// Serializes this CafeInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CafeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CafeInfoCopyWith<CafeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeInfoCopyWith<$Res> {
  factory $CafeInfoCopyWith(CafeInfo value, $Res Function(CafeInfo) then) =
      _$CafeInfoCopyWithImpl<$Res, CafeInfo>;
  @useResult
  $Res call(
      {String cafeName,
      double rating,
      int ratingCount,
      bool isLike,
      int likeCount,
      String cafeImageUrl});
}

/// @nodoc
class _$CafeInfoCopyWithImpl<$Res, $Val extends CafeInfo>
    implements $CafeInfoCopyWith<$Res> {
  _$CafeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CafeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cafeName = null,
    Object? rating = null,
    Object? ratingCount = null,
    Object? isLike = null,
    Object? likeCount = null,
    Object? cafeImageUrl = null,
  }) {
    return _then(_value.copyWith(
      cafeName: null == cafeName
          ? _value.cafeName
          : cafeName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingCount: null == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLike: null == isLike
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      cafeImageUrl: null == cafeImageUrl
          ? _value.cafeImageUrl
          : cafeImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CafeInfoImplCopyWith<$Res>
    implements $CafeInfoCopyWith<$Res> {
  factory _$$CafeInfoImplCopyWith(
          _$CafeInfoImpl value, $Res Function(_$CafeInfoImpl) then) =
      __$$CafeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cafeName,
      double rating,
      int ratingCount,
      bool isLike,
      int likeCount,
      String cafeImageUrl});
}

/// @nodoc
class __$$CafeInfoImplCopyWithImpl<$Res>
    extends _$CafeInfoCopyWithImpl<$Res, _$CafeInfoImpl>
    implements _$$CafeInfoImplCopyWith<$Res> {
  __$$CafeInfoImplCopyWithImpl(
      _$CafeInfoImpl _value, $Res Function(_$CafeInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CafeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cafeName = null,
    Object? rating = null,
    Object? ratingCount = null,
    Object? isLike = null,
    Object? likeCount = null,
    Object? cafeImageUrl = null,
  }) {
    return _then(_$CafeInfoImpl(
      cafeName: null == cafeName
          ? _value.cafeName
          : cafeName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingCount: null == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLike: null == isLike
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      cafeImageUrl: null == cafeImageUrl
          ? _value.cafeImageUrl
          : cafeImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CafeInfoImpl implements _CafeInfo {
  const _$CafeInfoImpl(
      {required this.cafeName,
      required this.rating,
      required this.ratingCount,
      required this.isLike,
      required this.likeCount,
      required this.cafeImageUrl});

  factory _$CafeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CafeInfoImplFromJson(json);

  @override
  final String cafeName;
  @override
  final double rating;
  @override
  final int ratingCount;
  @override
  final bool isLike;
  @override
  final int likeCount;
  @override
  final String cafeImageUrl;

  @override
  String toString() {
    return 'CafeInfo(cafeName: $cafeName, rating: $rating, ratingCount: $ratingCount, isLike: $isLike, likeCount: $likeCount, cafeImageUrl: $cafeImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeInfoImpl &&
            (identical(other.cafeName, cafeName) ||
                other.cafeName == cafeName) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount) &&
            (identical(other.isLike, isLike) || other.isLike == isLike) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.cafeImageUrl, cafeImageUrl) ||
                other.cafeImageUrl == cafeImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cafeName, rating, ratingCount,
      isLike, likeCount, cafeImageUrl);

  /// Create a copy of CafeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeInfoImplCopyWith<_$CafeInfoImpl> get copyWith =>
      __$$CafeInfoImplCopyWithImpl<_$CafeInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CafeInfoImplToJson(
      this,
    );
  }
}

abstract class _CafeInfo implements CafeInfo {
  const factory _CafeInfo(
      {required final String cafeName,
      required final double rating,
      required final int ratingCount,
      required final bool isLike,
      required final int likeCount,
      required final String cafeImageUrl}) = _$CafeInfoImpl;

  factory _CafeInfo.fromJson(Map<String, dynamic> json) =
      _$CafeInfoImpl.fromJson;

  @override
  String get cafeName;
  @override
  double get rating;
  @override
  int get ratingCount;
  @override
  bool get isLike;
  @override
  int get likeCount;
  @override
  String get cafeImageUrl;

  /// Create a copy of CafeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CafeInfoImplCopyWith<_$CafeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
