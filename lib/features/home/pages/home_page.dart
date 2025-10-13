import 'package:flutter/material.dart';


// TODO:  展示主要信息, server是否启动, static目录的打开按钮等.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      color: colorTheme.surface,
      child: Center(
          child: Text('PC 端应用', style: TextStyle(fontSize: 24)),
        ),
    );
  }
}