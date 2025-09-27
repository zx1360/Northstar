import 'package:flutter/material.dart';
import 'package:northstar/app/theme.dart';
import 'package:northstar/shared/widgets/titleBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(
        title: "northstar 北极星",
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 18),
            color: AppTheme.onSurfaceVariant,
            onPressed: () {},
            tooltip: '设置',
          ),
        ],
      ),
      body: const Center(
        child: Text('欢迎使用 PC 端应用', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}