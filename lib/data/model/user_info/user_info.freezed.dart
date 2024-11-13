// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  String get name => throw _privateConstructorUsedError;
  Intensitylevel? get acidity => throw _privateConstructorUsedError;
  Intensitylevel? get body => throw _privateConstructorUsedError;
  Intensitylevel? get bitterness => throw _privateConstructorUsedError;
  Intensitylevel? get sweetness => throw _privateConstructorUsedError;
  List<Aroma?> get aroma => throw _privateConstructorUsedError;
  String get profileImageUrl => throw _privateConstructorUsedError;

  /// Serializes this UserInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {String name,
      Intensitylevel? acidity,
      Intensitylevel? body,
      Intensitylevel? bitterness,
      Intensitylevel? sweetness,
      List<Aroma?> aroma,
      String profileImageUrl});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? acidity = freezed,
    Object? body = freezed,
    Object? bitterness = freezed,
    Object? sweetness = freezed,
    Object? aroma = null,
    Object? profileImageUrl = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      Intensitylevel? acidity,
      Intensitylevel? body,
      Intensitylevel? bitterness,
      Intensitylevel? sweetness,
      List<Aroma?> aroma,
      String profileImageUrl});
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? acidity = freezed,
    Object? body = freezed,
    Object? bitterness = freezed,
    Object? sweetness = freezed,
    Object? aroma = null,
    Object? profileImageUrl = null,
  }) {
    return _then(_$UserInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  const _$UserInfoImpl(
      {required this.name,
      required this.acidity,
      required this.body,
      required this.bitterness,
      required this.sweetness,
      required final List<Aroma?> aroma,
      required this.profileImageUrl})
      : _aroma = aroma;

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final String name;
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
  final String profileImageUrl;

  @override
  String toString() {
    return 'UserInfo(name: $name, acidity: $acidity, body: $body, bitterness: $bitterness, sweetness: $sweetness, aroma: $aroma, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.acidity, acidity) || other.acidity == acidity) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.bitterness, bitterness) ||
                other.bitterness == bitterness) &&
            (identical(other.sweetness, sweetness) ||
                other.sweetness == sweetness) &&
            const DeepCollectionEquality().equals(other._aroma, _aroma) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, acidity, body, bitterness,
      sweetness, const DeepCollectionEquality().hash(_aroma), profileImageUrl);

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {required final String name,
      required final Intensitylevel? acidity,
      required final Intensitylevel? body,
      required final Intensitylevel? bitterness,
      required final Intensitylevel? sweetness,
      required final List<Aroma?> aroma,
      required final String profileImageUrl}) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  String get name;
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
  String get profileImageUrl;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
