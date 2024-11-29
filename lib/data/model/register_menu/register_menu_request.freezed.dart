// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_menu_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterMenuRequest _$RegisterMenuRequestFromJson(Map<String, dynamic> json) {
  return _RegisterMenuRequest.fromJson(json);
}

/// @nodoc
mixin _$RegisterMenuRequest {
  String get cafeName => throw _privateConstructorUsedError;
  String get menuName => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this RegisterMenuRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterMenuRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterMenuRequestCopyWith<RegisterMenuRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterMenuRequestCopyWith<$Res> {
  factory $RegisterMenuRequestCopyWith(
          RegisterMenuRequest value, $Res Function(RegisterMenuRequest) then) =
      _$RegisterMenuRequestCopyWithImpl<$Res, RegisterMenuRequest>;
  @useResult
  $Res call({String cafeName, String menuName, int price, String? imageUrl});
}

/// @nodoc
class _$RegisterMenuRequestCopyWithImpl<$Res, $Val extends RegisterMenuRequest>
    implements $RegisterMenuRequestCopyWith<$Res> {
  _$RegisterMenuRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterMenuRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cafeName = null,
    Object? menuName = null,
    Object? price = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      cafeName: null == cafeName
          ? _value.cafeName
          : cafeName // ignore: cast_nullable_to_non_nullable
              as String,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterMenuRequestImplCopyWith<$Res>
    implements $RegisterMenuRequestCopyWith<$Res> {
  factory _$$RegisterMenuRequestImplCopyWith(_$RegisterMenuRequestImpl value,
          $Res Function(_$RegisterMenuRequestImpl) then) =
      __$$RegisterMenuRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cafeName, String menuName, int price, String? imageUrl});
}

/// @nodoc
class __$$RegisterMenuRequestImplCopyWithImpl<$Res>
    extends _$RegisterMenuRequestCopyWithImpl<$Res, _$RegisterMenuRequestImpl>
    implements _$$RegisterMenuRequestImplCopyWith<$Res> {
  __$$RegisterMenuRequestImplCopyWithImpl(_$RegisterMenuRequestImpl _value,
      $Res Function(_$RegisterMenuRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterMenuRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cafeName = null,
    Object? menuName = null,
    Object? price = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$RegisterMenuRequestImpl(
      cafeName: null == cafeName
          ? _value.cafeName
          : cafeName // ignore: cast_nullable_to_non_nullable
              as String,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterMenuRequestImpl implements _RegisterMenuRequest {
  const _$RegisterMenuRequestImpl(
      {required this.cafeName,
      required this.menuName,
      required this.price,
      required this.imageUrl});

  factory _$RegisterMenuRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterMenuRequestImplFromJson(json);

  @override
  final String cafeName;
  @override
  final String menuName;
  @override
  final int price;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'RegisterMenuRequest(cafeName: $cafeName, menuName: $menuName, price: $price, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterMenuRequestImpl &&
            (identical(other.cafeName, cafeName) ||
                other.cafeName == cafeName) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cafeName, menuName, price, imageUrl);

  /// Create a copy of RegisterMenuRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterMenuRequestImplCopyWith<_$RegisterMenuRequestImpl> get copyWith =>
      __$$RegisterMenuRequestImplCopyWithImpl<_$RegisterMenuRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterMenuRequestImplToJson(
      this,
    );
  }
}

abstract class _RegisterMenuRequest implements RegisterMenuRequest {
  const factory _RegisterMenuRequest(
      {required final String cafeName,
      required final String menuName,
      required final int price,
      required final String? imageUrl}) = _$RegisterMenuRequestImpl;

  factory _RegisterMenuRequest.fromJson(Map<String, dynamic> json) =
      _$RegisterMenuRequestImpl.fromJson;

  @override
  String get cafeName;
  @override
  String get menuName;
  @override
  int get price;
  @override
  String? get imageUrl;

  /// Create a copy of RegisterMenuRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterMenuRequestImplCopyWith<_$RegisterMenuRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
