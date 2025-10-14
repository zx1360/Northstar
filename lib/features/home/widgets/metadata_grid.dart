import 'package:flutter/material.dart';
import 'package:northstar/app/theme.dart';

class MetadataGrid extends StatelessWidget {
  final Map<String, dynamic> metadata;
  final ColorScheme colorTheme;
  final TextTheme textTheme;
  const MetadataGrid({
    super.key,
    required this.metadata,
    required this.colorTheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    // 数据项配置（可根据实际JSON结构调整）
    final metadataItems = [
      {
        "title": "总文件数",
        "value": metadata["totalFiles"].toString(),
        "icon": Icons.file_copy_rounded,
        "color": colorTheme.primary,
      },
      {
        "title": "总大小",
        "value": metadata["totalSize"],
        "icon": Icons.storage_rounded,
        "color": colorTheme.secondary,
      },
      {
        "title": "上次更新",
        "value": metadata["lastUpdated"],
        "icon": Icons.update_rounded,
        "color": colorTheme.tertiary,
      },
      {
        "title": "活跃连接",
        "value": metadata["activeConnections"].toString(),
        "icon": Icons.wifi_rounded,
        "color": colorTheme.primary,
      },
      {
        "title": "成功率",
        "value": "${metadata["successRate"]}%",
        "icon": Icons.check_circle_rounded,
        "color": colorTheme.secondary,
      },
      {
        "title": "待处理任务",
        "value": metadata["pendingTasks"].toString(),
        "icon": Icons.task_alt_rounded,
        "color": colorTheme.error,
      },
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: MediaQuery.of(context).size.width > 1000 ? 3 : 2,
      crossAxisSpacing: AppDimens.spacingM,
      childAspectRatio: 4.8,
      children: metadataItems.map((item) {
        return Card(
          elevation: AppDimens.elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 标题
                Text(
                  item["title"],
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorTheme.onSurfaceVariant,
                  ),
                ),

                // 数值和图标
                Row(
                  children: [
                    Text(
                      item["value"],
                      style: textTheme.headlineSmall?.copyWith(
                        color: item["color"],
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(width: AppDimens.spacingS),

                    Icon(
                      item["icon"] as IconData,
                      color: item["color"],
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
