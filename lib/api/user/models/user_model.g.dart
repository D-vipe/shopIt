// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      shopId: json['shopId'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phone': instance.phone,
      'avatarUrl': instance.avatarUrl,
      'shopId': instance.shopId,
    };
