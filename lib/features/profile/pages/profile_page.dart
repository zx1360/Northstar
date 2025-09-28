import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      color: colorTheme.surface,
      child: Center(child: Text('Profile页', style: TextStyle(fontSize: 24))),
    );
  }
}
