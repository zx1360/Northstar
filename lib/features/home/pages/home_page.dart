import 'package:flutter/material.dart';

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