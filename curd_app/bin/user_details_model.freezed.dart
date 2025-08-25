// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) {
  return _UserDetails.fromJson(json);
}

/// @nodoc
mixin _$UserDetails {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  UserData? get data => throw _privateConstructorUsedError;

  /// Serializes this UserDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailsCopyWith<UserDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsCopyWith<$Res> {
  factory $UserDetailsCopyWith(
    UserDetails value,
    $Res Function(UserDetails) then,
  ) = _$UserDetailsCopyWithImpl<$Res, UserDetails>;
  @useResult
  $Res call({String? id, String? name, String? createdAt, UserData? data});

  $UserDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$UserDetailsCopyWithImpl<$Res, $Val extends UserDetails>
    implements $UserDetailsCopyWith<$Res> {
  _$UserDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as UserData?,
          )
          as $Val,
    );
  }

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDetailsImplCopyWith<$Res>
    implements $UserDetailsCopyWith<$Res> {
  factory _$$UserDetailsImplCopyWith(
    _$UserDetailsImpl value,
    $Res Function(_$UserDetailsImpl) then,
  ) = __$$UserDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? createdAt, UserData? data});

  @override
  $UserDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$UserDetailsImplCopyWithImpl<$Res>
    extends _$UserDetailsCopyWithImpl<$Res, _$UserDetailsImpl>
    implements _$$UserDetailsImplCopyWith<$Res> {
  __$$UserDetailsImplCopyWithImpl(
    _$UserDetailsImpl _value,
    $Res Function(_$UserDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$UserDetailsImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as UserData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDetailsImpl implements _UserDetails {
  const _$UserDetailsImpl({this.id, this.name, this.createdAt, this.data});

  factory _$UserDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDetailsImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? createdAt;
  @override
  final UserData? data;

  @override
  String toString() {
    return 'UserDetails(id: $id, name: $name, createdAt: $createdAt, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdAt, data);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsImplCopyWith<_$UserDetailsImpl> get copyWith =>
      __$$UserDetailsImplCopyWithImpl<_$UserDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDetailsImplToJson(this);
  }
}

abstract class _UserDetails implements UserDetails {
  const factory _UserDetails({
    final String? id,
    final String? name,
    final String? createdAt,
    final UserData? data,
  }) = _$UserDetailsImpl;

  factory _UserDetails.fromJson(Map<String, dynamic> json) =
      _$UserDetailsImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get createdAt;
  @override
  UserData? get data;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailsImplCopyWith<_$UserDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  int? get id => throw _privateConstructorUsedError;
  String? get fName => throw _privateConstructorUsedError;
  String? get lName => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get nationality => throw _privateConstructorUsedError;
  String? get birthYear => throw _privateConstructorUsedError;

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call({
    int? id,
    String? fName,
    String? lName,
    int? age,
    String? nationality,
    String? birthYear,
  });
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fName = freezed,
    Object? lName = freezed,
    Object? age = freezed,
    Object? nationality = freezed,
    Object? birthYear = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            fName: freezed == fName
                ? _value.fName
                : fName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lName: freezed == lName
                ? _value.lName
                : lName // ignore: cast_nullable_to_non_nullable
                      as String?,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            nationality: freezed == nationality
                ? _value.nationality
                : nationality // ignore: cast_nullable_to_non_nullable
                      as String?,
            birthYear: freezed == birthYear
                ? _value.birthYear
                : birthYear // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
    _$UserDataImpl value,
    $Res Function(_$UserDataImpl) then,
  ) = __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? fName,
    String? lName,
    int? age,
    String? nationality,
    String? birthYear,
  });
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
    _$UserDataImpl _value,
    $Res Function(_$UserDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fName = freezed,
    Object? lName = freezed,
    Object? age = freezed,
    Object? nationality = freezed,
    Object? birthYear = freezed,
  }) {
    return _then(
      _$UserDataImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        fName: freezed == fName
            ? _value.fName
            : fName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lName: freezed == lName
            ? _value.lName
            : lName // ignore: cast_nullable_to_non_nullable
                  as String?,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        nationality: freezed == nationality
            ? _value.nationality
            : nationality // ignore: cast_nullable_to_non_nullable
                  as String?,
        birthYear: freezed == birthYear
            ? _value.birthYear
            : birthYear // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl({
    this.id,
    this.fName,
    this.lName,
    this.age,
    this.nationality,
    this.birthYear,
  });

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final int? id;
  @override
  final String? fName;
  @override
  final String? lName;
  @override
  final int? age;
  @override
  final String? nationality;
  @override
  final String? birthYear;

  @override
  String toString() {
    return 'UserData(id: $id, fName: $fName, lName: $lName, age: $age, nationality: $nationality, birthYear: $birthYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fName, fName) || other.fName == fName) &&
            (identical(other.lName, lName) || other.lName == lName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.birthYear, birthYear) ||
                other.birthYear == birthYear));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fName, lName, age, nationality, birthYear);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(this);
  }
}

abstract class _UserData implements UserData {
  const factory _UserData({
    final int? id,
    final String? fName,
    final String? lName,
    final int? age,
    final String? nationality,
    final String? birthYear,
  }) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  int? get id;
  @override
  String? get fName;
  @override
  String? get lName;
  @override
  int? get age;
  @override
  String? get nationality;
  @override
  String? get birthYear;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
