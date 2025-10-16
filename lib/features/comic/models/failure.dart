import 'package:json_annotation/json_annotation.dart';

part 'failure.g.dart';

@JsonSerializable()
class Failure {
  final String type; // 'comic', 'chapter', 'image'
  final String url; // 失败的资源URL
  final String reason; // 失败原因
  final DateTime timestamp; // 失败时间戳
  final int retryCount; // 已重试次数
  final String? relatedComicId; // 关联的漫画ID
  final String? relatedChapterId; // 关联的章节ID
  
  Failure({
    required this.type,
    required this.url,
    required this.reason,
    DateTime? timestamp,
    this.retryCount = 0,
    this.relatedComicId,
    this.relatedChapterId,
  }) : timestamp = timestamp ?? DateTime.now();

  factory Failure.fromJson(Map<String, dynamic> json) => _$FailureFromJson(json);

  Map<String, dynamic> toJson() => _$FailureToJson(this);
}