import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/routing/app_router.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void navigate(context, routeSettings) => Navigator.push(context, AppRouter.generateRoute(routeSettings));
}