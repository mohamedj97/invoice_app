// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileResponseDataModel _$GetProfileResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    GetProfileResponseDataModel(
      userId: json['userId'] as int,
      loginId: json['loginId'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      companies: (json['companies'] as List<dynamic>)
          .map((e) => UserCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      roles: (json['roles'] as List<dynamic>)
          .map((e) => CompanyRole.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetProfileResponseDataModelToJson(
        GetProfileResponseDataModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'loginId': instance.loginId,
      'userName': instance.userName,
      'email': instance.email,
      'companies': instance.companies,
      'roles': instance.roles,
    };

GetProfileResponse _$GetProfileResponseFromJson(Map<String, dynamic> json) =>
    GetProfileResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetProfileResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProfileResponseToJson(GetProfileResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
