import 'package:go_router/go_router.dart';
import 'package:northstar/features/help/pages/help_page.dart';

import 'package:northstar/shared/widgets/shell/shell_page.dart';
import 'package:northstar/features/home/pages/home_page.dart';
import 'package:northstar/features/overview/pages/overview_page.dart';
import 'package:northstar/features/profile/pages/profile_page.dart';
import 'package:northstar/features/server/pages/server_page.dart';

final List<RouteBase> routes = [
  ShellRoute(
    builder: (context, state, child) {
      return ShellPage(currentLocation: state.uri.toString() ,child: child);
    },
    routes: [
      GoRoute(
        path: "/home",
        name: "home",
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: "/overview",
        name: "overview",
        builder: (context, state) => const OverviewPage(),
      ),
      GoRoute(
        path: "/server",
        name: "server",
        builder: (context, state) => const ServerPage (),
      ),
      GoRoute(
        path: "/profile",
        name: "profile",
        builder: (context, state) => const ProfilePage(),
      ),

      GoRoute(
        path: "/help",
        name: "help",
        builder: (context, state) => const HelpPage(),
      ),
    ],
  ),
];
