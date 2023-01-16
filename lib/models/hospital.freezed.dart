// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hospital.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Hospital _$HospitalFromJson(Map<String, dynamic> json) {
  return _Hospital.fromJson(json);
}

/// @nodoc
mixin _$Hospital {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get web => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HospitalCopyWith<Hospital> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalCopyWith<$Res> {
  factory $HospitalCopyWith(Hospital value, $Res Function(Hospital) then) =
      _$HospitalCopyWithImpl<$Res>;
  $Res call({int id, String name, String address, String web});
}

/// @nodoc
class _$HospitalCopyWithImpl<$Res> implements $HospitalCopyWith<$Res> {
  _$HospitalCopyWithImpl(this._value, this._then);

  final Hospital _value;
  // ignore: unused_field
  final $Res Function(Hospital) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? web = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      web: web == freezed
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_HospitalCopyWith<$Res> implements $HospitalCopyWith<$Res> {
  factory _$$_HospitalCopyWith(
          _$_Hospital value, $Res Function(_$_Hospital) then) =
      __$$_HospitalCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String address, String web});
}

/// @nodoc
class __$$_HospitalCopyWithImpl<$Res> extends _$HospitalCopyWithImpl<$Res>
    implements _$$_HospitalCopyWith<$Res> {
  __$$_HospitalCopyWithImpl(
      _$_Hospital _value, $Res Function(_$_Hospital) _then)
      : super(_value, (v) => _then(v as _$_Hospital));

  @override
  _$_Hospital get _value => super._value as _$_Hospital;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? web = freezed,
  }) {
    return _then(_$_Hospital(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      web: web == freezed
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Hospital implements _Hospital {
  const _$_Hospital(
      {required this.id,
      required this.name,
      required this.address,
      required this.web});

  factory _$_Hospital.fromJson(Map<String, dynamic> json) =>
      _$$_HospitalFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String address;
  @override
  final String web;

  @override
  String toString() {
    return 'Hospital(id: $id, name: $name, address: $address, web: $web)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Hospital &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.web, web));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(web));

  @JsonKey(ignore: true)
  @override
  _$$_HospitalCopyWith<_$_Hospital> get copyWith =>
      __$$_HospitalCopyWithImpl<_$_Hospital>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HospitalToJson(
      this,
    );
  }
}

abstract class _Hospital implements Hospital {
  const factory _Hospital(
      {required final int id,
      required final String name,
      required final String address,
      required final String web}) = _$_Hospital;

  factory _Hospital.fromJson(Map<String, dynamic> json) = _$_Hospital.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String get web;
  @override
  @JsonKey(ignore: true)
  _$$_HospitalCopyWith<_$_Hospital> get copyWith =>
      throw _privateConstructorUsedError;
}
