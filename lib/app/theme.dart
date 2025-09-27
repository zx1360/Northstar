import 'package:flutter/material.dart';

class AppTheme {
  /// 主色调（参考火绒的蓝色）
  static const Color primary = Color(0xFF1E88E5);
  static const Color primaryLight = Color(0xFF64B5F6);
  static const Color primaryDark = Color(0xFF1565C0);

  /// 背景色
  static const Color background = Color(0xFF1E1E1E);      // 主背景
  static const Color surface = Color(0xFF2D2D2D);        // 卡片、输入框背景
  static const Color surfaceVariant = Color(0xFF252526); // 次要表面
  static const Color divider = Color(0xFF454545);        // 分割线

  /// 文本颜色
  static const Color onPrimary = Colors.white;
  static const Color onBackground = Color(0xFFE0E0E0);
  static const Color onSurface = Color(0xFFE0E0E0);
  static const Color onSurfaceVariant = Color(0xFFBBBBBB);
  static const Color onSurfaceSecondary = Color(0xFF9E9E9E);

  static ThemeData darkTheme() {
    return ThemeData(
      // 基础
      brightness: Brightness.dark,
      useMaterial3: true,

      // 颜色系统
      colorScheme: ColorScheme.dark(
        primary: primary,
        primaryContainer: primaryLight,
        secondary: primaryLight,
        background: background,
        surface: surface,
        surfaceVariant: surfaceVariant,
        onPrimary: onPrimary,
        onBackground: onBackground,
        onSurface: onSurface,
        onSurfaceVariant: onSurfaceVariant,
        outline: divider,
      ),

      // 文本主题
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: onBackground,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          color: onBackground,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: onBackground,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: onSurface,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: onSurfaceVariant,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          color: onSurfaceSecondary,
          fontSize: 12,
        ),
        labelLarge: TextStyle(
          color: onPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),

      // 卡片
      cardTheme: CardThemeData(
        color: surface,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        shadowColor: Colors.black12,
      ),

      // 按钮
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ).copyWith(
          elevation: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) return 4;
            return 2;
          }),
        ),
      ),

      // 文本按钮
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),

      // 输入框
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: divider),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryLight, width: 2),
          borderRadius: BorderRadius.circular(6),
        ),
        labelStyle: TextStyle(color: onSurfaceVariant),
        hintStyle: TextStyle(color: onSurfaceSecondary),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),

      // 分割线
      dividerTheme: DividerThemeData(
        color: divider,
        thickness: 1,
      ),

      // 滚动条
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(primaryLight),
        thickness: MaterialStateProperty.all(6),
        radius: const Radius.circular(3),
      ),

      // 弹窗
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        titleTextStyle: TextStyle(color: onBackground, fontSize: 18, fontWeight: FontWeight.w500),
        contentTextStyle: TextStyle(color: onSurfaceVariant, fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // 菜单
      popupMenuTheme: PopupMenuThemeData(
        color: surface,
        textStyle: TextStyle(color: onSurfaceVariant),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: onBackground,
        elevation: 0,
        titleSpacing: 16,
      ),
    );
  }
}