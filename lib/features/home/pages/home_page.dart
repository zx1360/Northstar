import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:northstar/_server/services/io/io_service.dart';
import 'package:northstar/app/theme.dart';
import 'package:northstar/features/home/models/directory_item.dart';
import 'package:northstar/features/home/widgets/directory_section.dart';
import 'package:northstar/features/home/widgets/metadata_section.dart';
import 'package:northstar/features/home/widgets/server_status_card.dart';
import 'package:path/path.dart' as path;

final appDirectoriesProvider = Provider<List<DirectoryItem>>(
  (ref) => [
    DirectoryItem(
      icon: Icons.folder_open_rounded,
      title: "数据存储目录",
      path: path.join(IoService.appDir, "static/essay"),
      color: Colors.orangeAccent,
    ),
    DirectoryItem(
      icon: Icons.logo_dev_rounded,
      title: "日志目录",
      path: path.join(IoService.appDir, "static/essay"),
      color: Colors.blueAccent,
    ),
    DirectoryItem(
      icon: Icons.settings_backup_restore_rounded,
      title: "备份目录",
      path: path.join(IoService.appDir, "static/essay"),
      color: Colors.greenAccent,
    ),
    DirectoryItem(
      icon: Icons.download_rounded,
      title: "下载目录",
      path: path.join(IoService.appDir, "static/essay"),
      color: Colors.purpleAccent,
    ),
  ],
);

final metadataOverviewProvider = FutureProvider<Map<String, dynamic>>((
  ref,
) async {
  // 实际项目中替换为真实的JSON数据获取逻辑
  await Future.delayed(const Duration(milliseconds: 500));
  return {
    "totalFiles": 1568,
    "totalSize": "24.8 GB",
    "lastUpdated": "2024-05-20 14:30",
    "activeConnections": 8,
    "successRate": 98.6,
    "pendingTasks": 3,
  };
});

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 获取主题颜色
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // 通过Riverpod获取状态数据
    // final metadataAsync = ref.watch(metadataOverviewProvider);
    // final appDirectories = ref.watch(appDirectoriesProvider);

    return Scaffold(
      // 顶部导航栏（符合桌面应用风格）
      appBar: AppBar(
        title: Text("应用主页", style: textTheme.titleLarge),
        centerTitle: false,
      ),

      // 主内容区域
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimens.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. webServer状态.
            ServerStatusCard(
              context: context,
              colorTheme: colorTheme,
              textTheme: textTheme,
            ),

            SizedBox(height: AppDimens.spacingXL),

            // 2. 应用目录快捷访问
            DirectorySection(
              context: context,
              directories: ref.watch(appDirectoriesProvider),
              colorTheme: colorTheme,
              textTheme: textTheme,
            ),

            SizedBox(height: AppDimens.spacingXL),

            // 3. 累计数据统计
            MetadataSection(
              context: context,
              colorTheme: colorTheme,
              textTheme: textTheme,
            ),
          ],
        ),
      ),
    );
  }
}
