import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable()
class Chapter {
  final String id; // 章节唯一标识
  final String title; // 章节标题
  final String url; // 章节页面URL
  final int order; // 章节顺序
  
  // 本地元数据
  String? localPath; // 本地存储路径
  int totalImages; // 总图片数
  int downloadedImages; // 已下载图片数
  bool isCompleted; // 是否完整下载
  
  Chapter({
    required this.id,
    required this.title,
    required this.url,
    required this.order,
    this.localPath,
    this.totalImages = 0,
    this.downloadedImages = 0,
    this.isCompleted = false,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}