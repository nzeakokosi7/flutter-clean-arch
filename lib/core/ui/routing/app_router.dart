import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/routing/page_route.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return AppPageRoute.routeTo(builder: (_) => const Scaffold(
          body: Center(
            child: Text('Splash Screen'),
          ),
        ));
      default:
        return AppPageRoute.routeTo(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          ),
        );
    }
  }
}