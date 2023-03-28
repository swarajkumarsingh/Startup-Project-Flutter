import 'package:flutter/material.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static push(Widget page) => navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (_) => page),
      );

  static pushNamed(String routeName) =>
      navigatorKey.currentState?.pushNamed(routeName);

  static pop(Widget page) => navigatorKey.currentState?.pop();
}
