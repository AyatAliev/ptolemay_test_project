import 'package:flutter/material.dart';
import 'package:ptolemay_test_project/core/constant/route_name.dart';
import 'package:ptolemay_test_project/features/presentation/screen/home/home_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteName.home: (context) => const HomeScreen(),
      };
}
