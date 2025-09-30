import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 48,
      color: colorScheme.surface,
      child: Row(
        children: [
          Expanded(
            child: DragToMoveArea(
              child: Container(
                height: double.infinity,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.keyboard_double_arrow_down_sharp, color: colorScheme.onSurfaceVariant),
            onPressed: () {},
            tooltip: '菜单',
            splashRadius: 20,
          ),
          IconButton(
            icon: Icon(Icons.remove, color: colorScheme.onSurfaceVariant),
            onPressed: () async => await windowManager.minimize(),
            tooltip: '最小化',
            splashRadius: 20,
          ),
          IconButton(
            icon: Icon(Icons.close, color: colorScheme.onSurfaceVariant),
            onPressed: () async => await windowManager.hide(),
            tooltip: '关闭',
            splashRadius: 20,
          ),
        ],
      ),
    );
  }
}
