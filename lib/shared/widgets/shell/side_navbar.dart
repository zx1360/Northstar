import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 目前的页面方案, ShellPage包含SideNavbar()Titlebar(),(每次页面跳转连带重绘).
// 页面复杂后的替换方案: 内容部分使用Navigator(), 只刷新内容部分, 以及其他优点.
class SideNavbar extends StatefulWidget {
  final String currentLocation;

  const SideNavbar({super.key, required this.currentLocation});

  @override
  State<SideNavbar> createState() => _SideNavbarState();
}

class _SideNavbarState extends State<SideNavbar> {
  int _selectedIndex = 0;

  void _switchToIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        context.goNamed("home");
        break;
      case 1:
        context.goNamed("overview");
        break;
      case 2:
        context.goNamed("server");
        break;
      case 3:
        context.goNamed("profile");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
          // 侧边导航部分
          Expanded(
            child: NavigationRail(
              backgroundColor: Colors.transparent,
              selectedIconTheme: IconThemeData(color: colorScheme.primary),
              unselectedIconTheme: IconThemeData(
                color: colorScheme.onSurfaceVariant,
              ),
              indicatorColor: colorScheme.primary.withValues(alpha: 0.2),
              labelType: NavigationRailLabelType.none,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(IconData(0xe625, fontFamily: "iconfont")),
                  label: Text(""),
                ),
                NavigationRailDestination(
                  icon: Icon(IconData(0xe62f, fontFamily: "iconfont")),
                  label: Text(""),
                ),
                NavigationRailDestination(
                  icon: Icon(IconData(0xf0ac, fontFamily: "iconfont")),
                  label: Text(""),
                ),
                NavigationRailDestination(
                  icon: Icon(IconData(0xe6b7, fontFamily: "iconfont")),
                  label: Text(""),
                ),
              ],
              selectedIndex: _selectedIndex,
              onDestinationSelected: (value) {
                _switchToIndex(value);
              },
            ),
          ),
          // 底部按钮
          // TODO: md说明页?
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: IconButton(
              onPressed: () {
                print("我去! 点了一下底部按钮!");
              },
              icon: Icon(IconData(0xe60a, fontFamily: "iconfont")),
              splashRadius: 24,
            ),
          ),
        ],
      ),
    );
  }
}
