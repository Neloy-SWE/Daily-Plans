import 'package:daily_plans/components/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../screens/screen_recycle_bin.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case BottomNavBar.id:
        return MaterialPageRoute(
          builder: (_) => BottomNavBar(),
        );
      default:
        return null;
    }
  }
}
