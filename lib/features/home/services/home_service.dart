import 'dart:io';

import 'package:flutter/material.dart';

// 打开Windows资源管理器
Future<void> openExplorer(BuildContext context, String path) async {
  path = path.replaceAll("/", "\\");
  try {
    // 检查路径是否存在
    final directory = Directory(path);
    if (await directory.exists()) {
      // Windows 打开资源管理器命令
      await Process.start('explorer.exe', [path]);
    } else {
      // 路径不存在时提示用户
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("路径不存在: $path"),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("打开目录失败: ${e.toString()}"),
          backgroundColor: Theme.of(context).colorScheme.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
