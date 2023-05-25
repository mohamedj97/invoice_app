// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_features_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFeaturesResponseModel _$GetFeaturesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetFeaturesResponseModel(
      result: (json['result'] as List<dynamic>)
          .map((e) => Feature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFeaturesResponseModelToJson(
        GetFeaturesResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

GetFeaturesResponse _$GetFeaturesResponseFromJson(Map<String, dynamic> json) =>
    GetFeaturesResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetFeaturesResponseModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetFeaturesResponseToJson(
        GetFeaturesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
