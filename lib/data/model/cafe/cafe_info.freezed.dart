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
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get favorites => throw _privateConstructorUsedError;
  String get operationHours => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<MenuItem> get menuItems => throw _privateConstructorUsedError;

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
      {String name,
      String location,
      double rating,
      int favorites,
      String operationHours,
      List<String> tags,
      List<MenuItem> menuItems});
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
    Object? name = null,
    Object? location = null,
    Object? rating = null,
    Object? favorites = null,
    Object? operationHours = null,
    Object? tags = null,
    Object? menuItems = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as int,
      operationHours: null == operationHours
          ? _value.operationHours
          : operationHours // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      menuItems: null == menuItems
          ? _value.menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<MenuItem>,
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
      {String name,
      String location,
      double rating,
      int favorites,
      String operationHours,
      List<String> tags,
      List<MenuItem> menuItems});
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
    Object? name = null,
    Object? location = null,
    Object? rating = null,
    Object? favorites = null,
    Object? operationHours = null,
    Object? tags = null,
    Object? menuItems = null,
  }) {
    return _then(_$CafeInfoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as int,
      operationHours: null == operationHours
          ? _value.operationHours
          : operationHours // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      menuItems: null == menuItems
          ? _value._menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<MenuItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CafeInfoImpl implements _CafeInfo {
  const _$CafeInfoImpl(
      {required this.name,
      required this.location,
      required this.rating,
      required this.favorites,
      required this.operationHours,
      required final List<String> tags,
      required final List<MenuItem> menuItems})
      : _tags = tags,
        _menuItems = menuItems;

  factory _$CafeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CafeInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String location;
  @override
  final double rating;
  @override
  final int favorites;
  @override
  final String operationHours;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<MenuItem> _menuItems;
  @override
  List<MenuItem> get menuItems {
    if (_menuItems is EqualUnmodifiableListView) return _menuItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuItems);
  }

  @override
  String toString() {
    return 'CafeInfo(name: $name, location: $location, rating: $rating, favorites: $favorites, operationHours: $operationHours, tags: $tags, menuItems: $menuItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.favorites, favorites) ||
                other.favorites == favorites) &&
            (identical(other.operationHours, operationHours) ||
                other.operationHours == operationHours) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._menuItems, _menuItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      location,
      rating,
      favorites,
      operationHours,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_menuItems));

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
      {required final String name,
      required final String location,
      required final double rating,
      required final int favorites,
      required final String operationHours,
      required final List<String> tags,
      required final List<MenuItem> menuItems}) = _$CafeInfoImpl;

  factory _CafeInfo.fromJson(Map<String, dynamic> json) =
      _$CafeInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get location;
  @override
  double get rating;
  @override
  int get favorites;
  @override
  String get operationHours;
  @override
  List<String> get tags;
  @override
  List<MenuItem> get menuItems;

  /// Create a copy of CafeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CafeInfoImplCopyWith<_$CafeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return _MenuItem.fromJson(json);
}

/// @nodoc
mixin _$MenuItem {
  String get name => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  bool get isBestSeller => throw _privateConstructorUsedError;

  /// Serializes this MenuItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemCopyWith<MenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemCopyWith<$Res> {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) then) =
      _$MenuItemCopyWithImpl<$Res, MenuItem>;
  @useResult
  $Res call(
      {String name,
      String rating,
      String price,
      String description,
      String image,
      bool isBestSeller});
}

/// @nodoc
class _$MenuItemCopyWithImpl<$Res, $Val extends MenuItem>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rating = null,
    Object? price = null,
    Object? description = null,
    Object? image = null,
    Object? isBestSeller = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isBestSeller: null == isBestSeller
          ? _value.isBestSeller
          : isBestSeller // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuItemImplCopyWith<$Res>
    implements $MenuItemCopyWith<$Res> {
  factory _$$MenuItemImplCopyWith(
          _$MenuItemImpl value, $Res Function(_$MenuItemImpl) then) =
      __$$MenuItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String rating,
      String price,
      String description,
      String image,
      bool isBestSeller});
}

/// @nodoc
class __$$MenuItemImplCopyWithImpl<$Res>
    extends _$MenuItemCopyWithImpl<$Res, _$MenuItemImpl>
    implements _$$MenuItemImplCopyWith<$Res> {
  __$$MenuItemImplCopyWithImpl(
      _$MenuItemImpl _value, $Res Function(_$MenuItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rating = null,
    Object? price = null,
    Object? description = null,
    Object? image = null,
    Object? isBestSeller = null,
  }) {
    return _then(_$MenuItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isBestSeller: null == isBestSeller
          ? _value.isBestSeller
          : isBestSeller // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemImpl implements _MenuItem {
  const _$MenuItemImpl(
      {required this.name,
      required this.rating,
      required this.price,
      required this.description,
      required this.image,
      this.isBestSeller = false});

  factory _$MenuItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemImplFromJson(json);

  @override
  final String name;
  @override
  final String rating;
  @override
  final String price;
  @override
  final String description;
  @override
  final String image;
  @override
  @JsonKey()
  final bool isBestSeller;

  @override
  String toString() {
    return 'MenuItem(name: $name, rating: $rating, price: $price, description: $description, image: $image, isBestSeller: $isBestSeller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isBestSeller, isBestSeller) ||
                other.isBestSeller == isBestSeller));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, rating, price, description, image, isBestSeller);

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      __$$MenuItemImplCopyWithImpl<_$MenuItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemImplToJson(
      this,
    );
  }
}

abstract class _MenuItem implements MenuItem {
  const factory _MenuItem(
      {required final String name,
      required final String rating,
      required final String price,
      required final String description,
      required final String image,
      final bool isBestSeller}) = _$MenuItemImpl;

  factory _MenuItem.fromJson(Map<String, dynamic> json) =
      _$MenuItemImpl.fromJson;

  @override
  String get name;
  @override
  String get rating;
  @override
  String get price;
  @override
  String get description;
  @override
  String get image;
  @override
  bool get isBestSeller;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
