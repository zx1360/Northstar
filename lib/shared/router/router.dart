import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:northstar/app/routes.dart';

final GoRouter router = GoRouter(
  initialLocation: "/home",
  routes: routes,
  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text("当前页面不存在!"))),
);
