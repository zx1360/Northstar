// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Failure _$FailureFromJson(Map<String, dynamic> json) => Failure(
      type: json['type'] as String,
      url: json['url'] as String,
      reason: json['reason'] as String,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      retryCount: (json['retryCount'] as num?)?.toInt() ?? 0,
      relatedComicId: json['relatedComicId'] as String?,
      relatedChapterId: json['relatedChapterId'] as String?,
    );

Map<String, dynamic> _$FailureToJson(Failure instance) => <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
      'reason': instance.reason,
      'timestamp': instance.timestamp.toIso8601String(),
      'retryCount': instance.retryCount,
      'relatedComicId': instance.relatedComicId,
      'relatedChapterId': instance.relatedChapterId,
    };
