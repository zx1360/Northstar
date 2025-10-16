// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      id: json['id'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      order: (json['order'] as num).toInt(),
      localPath: json['localPath'] as String?,
      totalImages: (json['totalImages'] as num?)?.toInt() ?? 0,
      downloadedImages: (json['downloadedImages'] as num?)?.toInt() ?? 0,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'order': instance.order,
      'localPath': instance.localPath,
      'totalImages': instance.totalImages,
      'downloadedImages': instance.downloadedImages,
      'isCompleted': instance.isCompleted,
    };
