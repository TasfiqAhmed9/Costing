// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      country: json['country'] as String?,
      email: json['t@gmail.com'] as String?,
      img: json['image'] as String?,
      createdOn: json['9 February 2025 at 12:47:22'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'country': instance.country,
      't@gmail.com': instance.email,
      'image': instance.img,
      '9 February 2025 at 12:47:22': instance.createdOn,
    };
