import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pilgrim/server/myserver.dart';
import 'package:pilgrim/ui/main_ui.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  // 是否为nas环境运行的: 环境变量含有"NAS_MODE"或环境参数有"nas的值."
  final isNasMode =
      const String.fromEnvironment("nas").isNotEmpty ||
      Platform.environment.containsKey("NAS_MODE");
  if (isNasMode) {
    final server = Myserver();
    await server.start(port: 9527);
    await Future.wait([]);
  } else {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = WindowOptions(
      size: const Size(920, 648),
      title: "Northstar 北极星",
      center: true,
    );
    if (Platform.isWindows) {
      await windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      });
    }
    runApp(MyApp());
  }
}

// PC启动时的ui应用
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: const app
    return MaterialApp(
      title: "Pilgrim",
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const HomePage(),
      home: const ServerControlPage(),
    );
  }
}
