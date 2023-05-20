// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_single_user_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSingleUserResult _$GetSingleUserResultFromJson(Map<String, dynamic> json) =>
    GetSingleUserResult(
      user: CompanyUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSingleUserResultToJson(
        GetSingleUserResult instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
