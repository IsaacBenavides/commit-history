import 'package:commit_history_mobile/modules/history/screen.dart';
import 'package:commit_history_mobile/modules/repo/screen.dart';
import 'package:commit_history_mobile/ui/routes/names.dart';
import 'package:flutter/material.dart';

class CustomRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.repo:
        return MaterialPageRoute(
          builder: (context) => const RepoScreen(),
          settings: settings,
        );
      case Routes.history:
        return MaterialPageRoute(
          builder: (context) => const HistoryScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
          settings: settings,
        );
    }
  }
}
