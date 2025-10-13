import 'package:flutter/material.dart';
import 'package:northstar/app/theme.dart';
import 'package:northstar/features/home/models/directory_item.dart';

class DirectoryCard extends StatelessWidget {
  final DirectoryItem item;
  final ColorScheme colorTheme;
  final TextTheme textTheme;
  final VoidCallback onTap;
  const DirectoryCard({
    super.key,
    required this.item,
    required this.colorTheme,
    required this.textTheme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimens.elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      color: colorTheme.surfaceContainerHighest,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.paddingM,
            vertical: AppDimens.paddingS,
          ),
          child: Row(
            children: [
              // 图标
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: item.color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(
                    AppDimens.smallBorderRadius,
                  ),
                ),
                child: Icon(item.icon, color: item.color, size: 20),
              ),

              SizedBox(width: AppDimens.spacingM),

              // 标题和路径
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.title,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorTheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppDimens.spacingXS),
                    Text(
                      item.path,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorTheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // 箭头图标
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: colorTheme.onSurfaceVariant,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
