import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/routing/app_routes.dart';
import 'package:wayve_test_app/core/ui/routing/page_route.dart';
import 'package:wayve_test_app/core/utils/splash_screen/splash_screen.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';
import 'package:wayve_test_app/features/user_status/presentation/screens/user_detail_screen.dart';
import 'package:wayve_test_app/features/user_status/presentation/screens/user_list_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return AppPageRoute.routeTo(builder: (_) => const SplashScreen());
      case AppRoutes.userListScreen:
        return AppPageRoute.routeTo(builder: (_)=> const UserListScreen());
      case AppRoutes.userDetailScreen:
        return AppPageRoute.routeTo(builder: (_)=> UserDetailScreen(userEntity: settings.arguments as UserEntity));
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