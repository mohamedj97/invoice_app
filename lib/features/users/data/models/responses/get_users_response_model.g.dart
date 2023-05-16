// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersResponseModel _$GetUsersResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUsersResponseModel(
      users: (json['users'] as List<dynamic>)
          .map((e) => CompanyUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUsersResponseModelToJson(
        GetUsersResponseModel instance) =>
    <String, dynamic>{
      'users': instance.users,
    };

GetUsersResponse _$GetUsersResponseFromJson(Map<String, dynamic> json) =>
    GetUsersResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetUsersResponseModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUsersResponseToJson(GetUsersResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
