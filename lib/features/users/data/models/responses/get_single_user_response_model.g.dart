// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_single_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSingleUserResponseModel _$GetSingleUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetSingleUserResponseModel(
      user: CompanyUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSingleUserResponseModelToJson(
        GetSingleUserResponseModel instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

GetSingleUserResponse _$GetSingleUserResponseFromJson(
        Map<String, dynamic> json) =>
    GetSingleUserResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetSingleUserResponseModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSingleUserResponseToJson(
        GetSingleUserResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
