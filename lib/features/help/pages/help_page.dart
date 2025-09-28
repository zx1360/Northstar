import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      color: colorTheme.surface,
      child: Center(
          child: Text('helper_page'),
        ),
    );
  }
}