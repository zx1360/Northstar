import 'package:flutter/material.dart';
import 'package:northstar/app/theme.dart';
import 'package:window_manager/window_manager.dart';

// 自定义标题栏. (传入appBar)
class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const TitleBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return DragToMoveArea(
      child: Container(
        height: preferredSize.height,
        color: AppTheme.background,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // 应用标题
            Text(
              title,
              style: TextStyle(
                color: AppTheme.onBackground,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            // 自定义操作按钮
            if (actions != null) ...actions!,
            const SizedBox(width: 8),
            // 最小化按钮
            IconButton(
              icon: const Icon(Icons.minimize, size: 18),
              color: AppTheme.onSurfaceVariant,
              onPressed: () async => await windowManager.minimize(),
              tooltip: '最小化',
              padding: const EdgeInsets.all(8),
              splashRadius: 16,
            ),
            // 关闭按钮
            IconButton(
              icon: const Icon(Icons.close, size: 18),
              color: AppTheme.onSurfaceVariant,
              onPressed: () async => await windowManager.close(),
              tooltip: '关闭',
              padding: const EdgeInsets.all(8),
              splashRadius: 16,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}