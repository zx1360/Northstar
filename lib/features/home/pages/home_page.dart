import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:northstar/app/theme.dart';
import 'package:northstar/features/home/providers/directories_provider.dart';
import 'package:northstar/features/home/widgets/directory_section.dart';
import 'package:northstar/features/home/widgets/metadata_section.dart';
import 'package:northstar/features/home/widgets/server_status_card.dart';


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
