import 'package:go_router/go_router.dart';
import 'package:northstar/features/home/home_page.dart';

final List<RouteBase> routes = [
  GoRoute(path: "/home", name: "home", builder: (context, state) => HomePage()),
  GoRoute(path: ""),
];
