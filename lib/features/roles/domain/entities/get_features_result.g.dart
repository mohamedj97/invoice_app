// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_features_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFeaturesResult _$GetFeaturesResultFromJson(Map<String, dynamic> json) =>
    GetFeaturesResult(
      result: (json['result'] as List<dynamic>)
          .map((e) => Feature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFeaturesResultToJson(GetFeaturesResult instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
