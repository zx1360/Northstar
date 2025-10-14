import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'metadata_provider.g.dart';

@riverpod
Future<Map<String, dynamic>> metadata(MetadataRef ref) async {
  // 实际项目中替换为真实的JSON数据获取逻辑
  await Future.delayed(const Duration(milliseconds: 500));
  return {
    "totalFiles": 1568,
    "totalSize": "24.8 GB",
    "lastUpdated": "2024-05-20 14:30",
    "activeConnections": 8,
    "successRate": 98.6,
    "pendingTasks": 3,
  };
}
