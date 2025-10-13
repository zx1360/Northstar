import 'package:flutter/material.dart';
import 'package:northstar/app/theme.dart';
import 'package:northstar/features/home/models/directory_item.dart';
import 'package:northstar/features/home/services/home_service.dart';
import 'package:northstar/features/home/widgets/directory_card.dart';

class DirectorySection extends StatelessWidget {
  final BuildContext context;
  final List<DirectoryItem> directories;
  final ColorScheme colorTheme;
  final TextTheme textTheme;
  const DirectorySection({
    super.key,
    required this.context,
    required this.directories,
    required this.colorTheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 标题
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "应用目录",
              style: textTheme.titleMedium?.copyWith(
                color: colorTheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: () {
                // TODO: 打开完整目录管理页面
              },
              style: TextButton.styleFrom(
                foregroundColor: colorTheme.primary,
                padding: EdgeInsets.symmetric(horizontal: AppDimens.paddingS),
                minimumSize: const Size(0, 0),
              ),
              child: Text("管理全部"),
            ),
          ],
        ),

        SizedBox(height: AppDimens.spacingM),

        // 目录网格
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 800 ? 4 : 2,
            crossAxisSpacing: AppDimens.spacingM,
            mainAxisSpacing: AppDimens.spacingM,
            childAspectRatio: 3,
          ),
          itemCount: directories.length,
          itemBuilder: (context, index) {
            final item = directories[index];
            return DirectoryCard(
              item: item,
              colorTheme: colorTheme,
              textTheme: textTheme,
              onTap: () => openExplorer(context, item.path),
            );
          },
        ),
      ],
    );
  }
}
