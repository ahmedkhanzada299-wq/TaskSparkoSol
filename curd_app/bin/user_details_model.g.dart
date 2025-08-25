// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailsImpl _$$UserDetailsImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailsImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] as String?,
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserDetailsImplToJson(_$UserDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'data': instance.data,
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      id: (json['id'] as num?)?.toInt(),
      fName: json['fName'] as String?,
      lName: json['lName'] as String?,
      age: (json['age'] as num?)?.toInt(),
      nationality: json['nationality'] as String?,
      birthYear: json['birthYear'] as String?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fName': instance.fName,
      'lName': instance.lName,
      'age': instance.age,
      'nationality': instance.nationality,
      'birthYear': instance.birthYear,
    };
