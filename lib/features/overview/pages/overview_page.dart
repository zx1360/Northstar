import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      color: colorTheme.surface,
      child: Center(child: Text("overview_page")),
    );
  }
}
