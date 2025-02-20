// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorModelImpl _$$ErrorModelImplFromJson(Map<String, dynamic> json) =>
    _$ErrorModelImpl(
      message: json['message'] as String,
      code: json['code'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ErrorModelImplToJson(_$ErrorModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'timestamp': instance.timestamp.toIso8601String(),
    };
