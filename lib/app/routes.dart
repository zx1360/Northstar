import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:northstar/features/home/pages/home_page.dart';
import 'package:northstar/features/overview/pages/overview_page.dart';
import 'package:northstar/features/server/pages/server_page.dart';
import 'package:northstar/features/profile/pages/profile_page.dart';
import 'package:northstar/features/help/pages/help_page.dart';


// 定义路由数据模型
class AppRoute {
  final String path;
  final String name;
  final IconData icon;
  final Widget Function(BuildContext, GoRouterState) builder;

  const AppRoute({
    required this.path,
    required this.name,
    required this.icon,
    required this.builder,
  });
}

// 所有路由定义
final List<AppRoute> routes = [
  AppRoute(
    path: '/home',
    name: 'home',
    icon: IconData(0xe625, fontFamily: 'iconfont'),
    builder: (context, state) => const HomePage(),
  ),
  AppRoute(
    path: '/overview',
    name: 'overview',
    icon: IconData(0xe62f, fontFamily: 'iconfont'),
    builder: (context, state) => const OverviewPage(),
  ),
  AppRoute(
    path: '/server',
    name: 'server',
    icon: IconData(0xf0ac, fontFamily: 'iconfont'),
    builder: (context, state) => const ServerPage(),
  ),
  AppRoute(
    path: '/profile',
    name: 'profile',
    icon: IconData(0xe6b7, fontFamily: 'iconfont'),
    builder: (context, state) => const ProfilePage(),
  ),
  
  AppRoute(
    path: '/help',
    name: 'help',
    icon: IconData(0xe60a, fontFamily: 'iconfont'),
    builder: (context, state) => const HelpPage(),
  ),
];
