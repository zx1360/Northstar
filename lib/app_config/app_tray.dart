import 'dart:io';

import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

Future<void> initSystemTray() async {
  final SystemTray systemTray = SystemTray();

  try {
    // 初始化托盘
    await systemTray.initSystemTray(
      iconPath: "assets/images/48.ico", // 托盘图标
      toolTip: "Northstar北极星", // 鼠标悬停提示
    );

    // 创建右键菜单
    final Menu menu = Menu();
    await menu.buildFrom([
      MenuItemLabel(
        label: "显示窗口",
        onClicked: (item) async {
          await windowManager.show();
          await windowManager.focus();
        },
      ),
      MenuItemLabel(
        label: "隐藏窗口",
        onClicked: (item) {
          windowManager.hide();
        },
      ),
      MenuSeparator(), // 分隔线
      MenuItemLabel(
        label: "退出",
        onClicked: (item) {
          systemTray.destroy();
          exit(0);
        },
      ),
    ]);

    // 设置托盘菜单
    await systemTray.setContextMenu(menu);

    // 点击托盘显示应用.
    systemTray.registerSystemTrayEventHandler((eventName) {
      if (eventName == kSystemTrayEventClick) {
        windowManager.show();
      }
    });
  } catch (error) {
    throw Exception("app初始化托盘失败: $error");
  }
}
