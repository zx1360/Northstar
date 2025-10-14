import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:northstar/app/theme.dart';
import 'package:northstar/features/home/pages/home_page.dart';
import 'package:northstar/features/home/widgets/metadata_grid.dart';

class MetadataSection extends ConsumerWidget {
  final BuildContext context;
  final ColorScheme colorTheme;
  final TextTheme textTheme;
  const MetadataSection({
    super.key,
    required this.context,
    required this.colorTheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 标题
        Text(
          "数据概览",
          style: textTheme.titleMedium?.copyWith(
            color: colorTheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: AppDimens.spacingM),

        MetadataGrid(
            colorTheme: colorTheme,
            textTheme: textTheme,
          ),
      ],
    );
  }
}
