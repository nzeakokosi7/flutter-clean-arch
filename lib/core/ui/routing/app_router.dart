import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/routing/page_route.dart';
import 'package:wayve_test_app/core/utils/splash_screen/splash_screen.dart';
import 'package:wayve_test_app/features/user_status/presentation/screens/user_detail_screen.dart';
import 'package:wayve_test_app/features/user_status/presentation/screens/user_list_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return AppPageRoute.routeTo(builder: (_) => const SplashScreen());
      case '/home':
        return AppPageRoute.routeTo(builder: (_)=> const UserListScreen());
      case '/user-detail':
        return AppPageRoute.routeTo(builder: (_)=> const UserDetailScreen());
      default:
        return AppPageRoute.routeTo(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Something went wrong', style: TextStyle(color: Colors.red, fontSize: 20),),
            ),
          ),
        );
    }
  }
}