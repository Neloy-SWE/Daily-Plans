import 'package:daily_plans/screens/screen_task.dart';
import 'package:flutter/material.dart';
import '../screens/screen_recycle_bin.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case TaskScreen.id:
        return MaterialPageRoute(
          builder: (_) => const TaskScreen(),
        );
      default:
        return null;
    }
  }
}
