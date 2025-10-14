import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
    final server = ref.watch(appStatusProvider).server;
    return Card(
      elevation: AppDimens.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.paddingL),
        child: Row(
          children: [
            // 状态指示灯
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: server.isRunning
                    ? colorTheme.secondary
                    : colorTheme.onSurfaceVariant,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: server.isRunning
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
                    server.isRunning
                        ? "服务已启动 (端口: ${server.port}) - ${server.address} 访问"
                        : "服务已停止",
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
                context.replaceNamed("server");
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
