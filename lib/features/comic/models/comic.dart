import 'package:json_annotation/json_annotation.dart';
import 'package:northstar/features/comic/models/chapter.dart';

part 'comic.g.dart';

@JsonSerializable()
class Comic {
  final String id; // 唯一标识
  final String title; // 漫画标题
  final String author; // 作者
  final String coverUrl; // 封面图片URL
  final String description; // 漫画简介
  final List<String> genres; // 题材分类
  final String sourceUrl; // 漫画详情页URL
  final List<Chapter> chapters; // 章节列表

  // 本地元数据
  String? localCoverPath; // 本地封面路径
  DateTime? downloadTime; // 下载时间
  bool isCompleted; // 是否完整下载

  Comic({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.description,
    required this.genres,
    required this.sourceUrl,
    required this.chapters,
    this.localCoverPath,
    this.downloadTime,
    this.isCompleted = false,
  });

  Comic copyWith({
    String? id,
    String? title,
    String? author,
    String? coverUrl,
    String? description,
    List<String>? genres,
    String? sourceUrl,
    List<Chapter>? chapters,
    String? localCoverPath,
    DateTime? downloadTime,
    bool? isCompleted,
  }) {
    return Comic(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      coverUrl: coverUrl ?? this.coverUrl,
      description: description ?? this.description,
      genres: genres ?? this.genres,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      chapters: chapters ?? this.chapters,
      localCoverPath: localCoverPath ?? this.localCoverPath,
      downloadTime: downloadTime ?? this.downloadTime,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);

  Map<String, dynamic> toJson() => _$ComicToJson(this);
}
