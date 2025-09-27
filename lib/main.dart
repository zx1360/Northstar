import 'dart:io';
// web服务器.
import 'package:northstar/_server/myserver.dart';
import 'package:northstar/app/app.dart';
import 'package:northstar/app_config/app_tray.dart';
import 'package:northstar/app_config/app_window.dart';
// 应用配置 (窗口, 托盘等)
// ui相关.
import 'package:flutter/material.dart';


void main() async {
  // 系统环境变量含有"NAS_MODE"或运行环境参数有"nas的值."
  // flutter run -d windows --dart-define=nas=true
  final isNasMode =
      const String.fromEnvironment("nas").isNotEmpty ||
      Platform.environment.containsKey("NAS_MODE");
  // 如果是nas环境, 只启动服务而无ui.
  if (isNasMode) {
    final server = Myserver();
    await server.start(port: 9527);
    await Future.wait([]);
  }
  // 带ui的桌面运行环境.
  else {
    WidgetsFlutterBinding.ensureInitialized();
    // 初始化窗体配置 初始化系统托盘
    await initWindow();
    await initSystemTray();
    runApp(MyApp());
  }
}
