// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:northstar/app/routes.dart';

// TODO: 考虑考虑stateless/stateful 组件及复用及背后机制.
class SideNavbar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const SideNavbar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentIndex = navigationShell.currentIndex;

    return Container(
      color: colorScheme.background,
      child: Column(
        children: [
          // 顶部图片
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/icons/48.ico", width: 48, height: 48),
            ),
          ),
          // 留出空格
          SizedBox(height: 20),

          Expanded(
            child: NavigationRail(
              backgroundColor: Colors.transparent,
              selectedIconTheme: IconThemeData(
                color: colorScheme.primary,
                size: 32,
              ),
              unselectedIconTheme: IconThemeData(
                color: colorScheme.onSurfaceVariant,
                size: 28,
              ),
              indicatorColor: colorScheme.primary.withValues(alpha: 0.2),
              indicatorShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),

              labelType: NavigationRailLabelType.none,
              destinations: [
                for (final route in routes.take(4))
                  NavigationRailDestination(
                    icon: Icon(route.icon),
                    label: const SizedBox.shrink(),
                  ),
              ],
              selectedIndex: currentIndex < 4 ? currentIndex : null,
              onDestinationSelected: (index) {
                navigationShell.goBranch(index);
              },

              trailing: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: IconButton(
                  onPressed: () async {
                    print("我去! 点了一下底部按钮!");
                    navigationShell.goBranch(4);
                  },
                  icon: Icon(IconData(0xe60a, fontFamily: "iconfont")),
                  iconSize: 28,
                  color: currentIndex == 4
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                  splashRadius: 28,
                ),
              ),
              trailingAtBottom: true,
            ),
          ),
        ],
      ),
    );
  }
}
