// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeMenu _$HomeMenuFromJson(Map<String, dynamic> json) {
  return _HomeMenu.fromJson(json);
}

/// @nodoc
mixin _$HomeMenu {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  String get attribute => throw _privateConstructorUsedError;
  double? get degree => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this HomeMenu to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeMenu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeMenuCopyWith<HomeMenu> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeMenuCopyWith<$Res> {
  factory $HomeMenuCopyWith(HomeMenu value, $Res Function(HomeMenu) then) =
      _$HomeMenuCopyWithImpl<$Res, HomeMenu>;
  @useResult
  $Res call(
      {int id,
      String name,
      double? score,
      String attribute,
      double? degree,
      String imageUrl});
}

/// @nodoc
class _$HomeMenuCopyWithImpl<$Res, $Val extends HomeMenu>
    implements $HomeMenuCopyWith<$Res> {
  _$HomeMenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeMenu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? score = freezed,
    Object? attribute = null,
    Object? degree = freezed,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String,
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as double?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeMenuImplCopyWith<$Res>
    implements $HomeMenuCopyWith<$Res> {
  factory _$$HomeMenuImplCopyWith(
          _$HomeMenuImpl value, $Res Function(_$HomeMenuImpl) then) =
      __$$HomeMenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      double? score,
      String attribute,
      double? degree,
      String imageUrl});
}

/// @nodoc
class __$$HomeMenuImplCopyWithImpl<$Res>
    extends _$HomeMenuCopyWithImpl<$Res, _$HomeMenuImpl>
    implements _$$HomeMenuImplCopyWith<$Res> {
  __$$HomeMenuImplCopyWithImpl(
      _$HomeMenuImpl _value, $Res Function(_$HomeMenuImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeMenu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? score = freezed,
    Object? attribute = null,
    Object? degree = freezed,
    Object? imageUrl = null,
  }) {
    return _then(_$HomeMenuImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String,
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as double?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeMenuImpl implements _HomeMenu {
  const _$HomeMenuImpl(
      {required this.id,
      required this.name,
      required this.score,
      required this.attribute,
      required this.degree,
      required this.imageUrl});

  factory _$HomeMenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeMenuImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double? score;
  @override
  final String attribute;
  @override
  final double? degree;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'HomeMenu(id: $id, name: $name, score: $score, attribute: $attribute, degree: $degree, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeMenuImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.attribute, attribute) ||
                other.attribute == attribute) &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, score, attribute, degree, imageUrl);

  /// Create a copy of HomeMenu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeMenuImplCopyWith<_$HomeMenuImpl> get copyWith =>
      __$$HomeMenuImplCopyWithImpl<_$HomeMenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeMenuImplToJson(
      this,
    );
  }
}

abstract class _HomeMenu implements HomeMenu {
  const factory _HomeMenu(
      {required final int id,
      required final String name,
      required final double? score,
      required final String attribute,
      required final double? degree,
      required final String imageUrl}) = _$HomeMenuImpl;

  factory _HomeMenu.fromJson(Map<String, dynamic> json) =
      _$HomeMenuImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double? get score;
  @override
  String get attribute;
  @override
  double? get degree;
  @override
  String get imageUrl;

  /// Create a copy of HomeMenu
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeMenuImplCopyWith<_$HomeMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
