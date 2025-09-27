import 'package:flutter/material.dart';
import 'package:northstar/app/theme.dart';
import 'package:northstar/features/home/home_page.dart';

// PC启动时的ui应用
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: const app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "northstar 北极星",
      theme: AppTheme.darkTheme(),
      home: const HomePage(),
    );
  }
}