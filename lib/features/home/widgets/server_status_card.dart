import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:northstar/app/theme.dart';
import 'package:northstar/providers/northstar/status_provider.dart';

class ServerStatusCard extends ConsumerWidget {
  final BuildContext context;
  final ColorScheme colorTheme;
  final TextTheme textTheme;
  const ServerStatusCard({
    super.key,
    required this.context,
    required this.colorTheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: 此处还没有响应式数据的效果, 因为启动的时候没有用到riverpod, state没更改.
    final isRunning = ref.watch(appStatusProvider).server.isRunning;
    return Card(
      elevation: AppDimens.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppDimens.paddingL),
        child: Row(
          children: [
            // 状态指示灯
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: isRunning
                    ? colorTheme.secondary
                    : colorTheme.onSurfaceVariant,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: isRunning
                        ? colorTheme.secondary.withOpacity(0.3)
                        : Colors.transparent,
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),

            SizedBox(width: AppDimens.spacingM),

            // 状态信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Web服务状态",
                    style: textTheme.titleMedium?.copyWith(
                      color: colorTheme.onSurface,
                    ),
                  ),
                  SizedBox(height: AppDimens.spacingXS),
                  Text(
                    isRunning
                        ? "服务已启动 (端口: 8080) - 可通过 http://localhost:8080 访问"
                        : "服务已停止 - 点击启动按钮开启服务",
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorTheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            // 快捷操作（示例：查看日志）
            TextButton.icon(
              onPressed: () {
                // TODO: 打开Web服务日志逻辑
              },
              icon: Icon(Icons.description_rounded, size: 16),
              label: Text("查看日志"),
              style: TextButton.styleFrom(
                foregroundColor: colorTheme.primary,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingM,
                  vertical: AppDimens.paddingXS,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
