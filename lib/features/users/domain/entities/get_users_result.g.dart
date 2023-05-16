// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersResult _$GetUsersResultFromJson(Map<String, dynamic> json) =>
    GetUsersResult(
      users: (json['users'] as List<dynamic>)
          .map((e) => CompanyUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUsersResultToJson(GetUsersResult instance) =>
    <String, dynamic>{
      'users': instance.users,
    };
