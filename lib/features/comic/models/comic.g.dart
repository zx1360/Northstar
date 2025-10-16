// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comic _$ComicFromJson(Map<String, dynamic> json) => Comic(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      coverUrl: json['coverUrl'] as String,
      description: json['description'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      sourceUrl: json['sourceUrl'] as String,
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      localCoverPath: json['localCoverPath'] as String?,
      downloadTime: json['downloadTime'] == null
          ? null
          : DateTime.parse(json['downloadTime'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$ComicToJson(Comic instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'coverUrl': instance.coverUrl,
      'description': instance.description,
      'genres': instance.genres,
      'sourceUrl': instance.sourceUrl,
      'chapters': instance.chapters,
      'localCoverPath': instance.localCoverPath,
      'downloadTime': instance.downloadTime?.toIso8601String(),
      'isCompleted': instance.isCompleted,
    };
