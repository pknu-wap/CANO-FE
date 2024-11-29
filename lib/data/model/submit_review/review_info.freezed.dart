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
  int get id => throw _privateConstructorUsedError;
  String get memberName => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  Intensitylevel? get acidity => throw _privateConstructorUsedError;
  Intensitylevel? get body => throw _privateConstructorUsedError;
  Intensitylevel? get bitterness => throw _privateConstructorUsedError;
  Intensitylevel? get sweetness => throw _privateConstructorUsedError;
  List<Aroma?> get aroma => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

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
      {int id,
      String memberName,
      String contents,
      double score,
      List<String>? images,
      Intensitylevel? acidity,
      Intensitylevel? body,
      Intensitylevel? bitterness,
      Intensitylevel? sweetness,
      List<Aroma?> aroma,
      DateTime createdAt});
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
    Object? id = null,
    Object? memberName = null,
    Object? contents = null,
    Object? score = null,
    Object? images = freezed,
    Object? acidity = freezed,
    Object? body = freezed,
    Object? bitterness = freezed,
    Object? sweetness = freezed,
    Object? aroma = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      memberName: null == memberName
          ? _value.memberName
          : memberName // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      aroma: null == aroma
          ? _value.aroma
          : aroma // ignore: cast_nullable_to_non_nullable
              as List<Aroma?>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      {int id,
      String memberName,
      String contents,
      double score,
      List<String>? images,
      Intensitylevel? acidity,
      Intensitylevel? body,
      Intensitylevel? bitterness,
      Intensitylevel? sweetness,
      List<Aroma?> aroma,
      DateTime createdAt});
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
    Object? id = null,
    Object? memberName = null,
    Object? contents = null,
    Object? score = null,
    Object? images = freezed,
    Object? acidity = freezed,
    Object? body = freezed,
    Object? bitterness = freezed,
    Object? sweetness = freezed,
    Object? aroma = null,
    Object? createdAt = null,
  }) {
    return _then(_$ReviewInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      memberName: null == memberName
          ? _value.memberName
          : memberName // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      aroma: null == aroma
          ? _value._aroma
          : aroma // ignore: cast_nullable_to_non_nullable
              as List<Aroma?>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewInfoImpl implements _ReviewInfo {
  const _$ReviewInfoImpl(
      {required this.id,
      required this.memberName,
      required this.contents,
      required this.score,
      required final List<String>? images,
      required this.acidity,
      required this.body,
      required this.bitterness,
      required this.sweetness,
      required final List<Aroma?> aroma,
      required this.createdAt})
      : _images = images,
        _aroma = aroma;

  factory _$ReviewInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String memberName;
  @override
  final String contents;
  @override
  final double score;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Intensitylevel? acidity;
  @override
  final Intensitylevel? body;
  @override
  final Intensitylevel? bitterness;
  @override
  final Intensitylevel? sweetness;
  final List<Aroma?> _aroma;
  @override
  List<Aroma?> get aroma {
    if (_aroma is EqualUnmodifiableListView) return _aroma;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aroma);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ReviewInfo(id: $id, memberName: $memberName, contents: $contents, score: $score, images: $images, acidity: $acidity, body: $body, bitterness: $bitterness, sweetness: $sweetness, aroma: $aroma, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.memberName, memberName) ||
                other.memberName == memberName) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.acidity, acidity) || other.acidity == acidity) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.bitterness, bitterness) ||
                other.bitterness == bitterness) &&
            (identical(other.sweetness, sweetness) ||
                other.sweetness == sweetness) &&
            const DeepCollectionEquality().equals(other._aroma, _aroma) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      memberName,
      contents,
      score,
      const DeepCollectionEquality().hash(_images),
      acidity,
      body,
      bitterness,
      sweetness,
      const DeepCollectionEquality().hash(_aroma),
      createdAt);

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
      {required final int id,
      required final String memberName,
      required final String contents,
      required final double score,
      required final List<String>? images,
      required final Intensitylevel? acidity,
      required final Intensitylevel? body,
      required final Intensitylevel? bitterness,
      required final Intensitylevel? sweetness,
      required final List<Aroma?> aroma,
      required final DateTime createdAt}) = _$ReviewInfoImpl;

  factory _ReviewInfo.fromJson(Map<String, dynamic> json) =
      _$ReviewInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get memberName;
  @override
  String get contents;
  @override
  double get score;
  @override
  List<String>? get images;
  @override
  Intensitylevel? get acidity;
  @override
  Intensitylevel? get body;
  @override
  Intensitylevel? get bitterness;
  @override
  Intensitylevel? get sweetness;
  @override
  List<Aroma?> get aroma;
  @override
  DateTime get createdAt;

  /// Create a copy of ReviewInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewInfoImplCopyWith<_$ReviewInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
