import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wayve_test_app/core/utils/app_logger.dart';
import 'package:wayve_test_app/core/utils/splash_screen/splash_screen.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';
import 'package:wayve_test_app/features/user_status/presentation/screens/user_detail_screen.dart';
import 'package:wayve_test_app/features/user_status/presentation/screens/user_list_screen.dart';

class NavigationService {
  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // void navigate(context, routeSettings) => Navigator.push(context, AppRouter.generateRoute(routeSettings));
}

class AppPages {
  static const String splash = "/splash";
  static const String userListScreen = "/home";
  static const String userDetailScreen = "/user-detail";
}

class AppRouter {
  static final router = GoRouter(
    routes: _routes,
    initialLocation: AppPages.splash,
    errorPageBuilder: _errorPageBuilder,
    urlPathStrategy: UrlPathStrategy.path,
  );

  static Page<dynamic> _errorPageBuilder(
      BuildContext context, GoRouterState state) {
    AppLogger.log(state.error);
    return
    MaterialPage<SplashScreen>(
      key: state.pageKey,
      child: const SplashScreen(),
    );
  }

  // the routes when the user is logged in
  static final _routes = [
    GoRoute(
      path: AppPages.splash,
      pageBuilder: (context, state) => MaterialPage<SplashScreen>(
        key: state.pageKey,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: AppPages.userListScreen,
      pageBuilder: (context, state) {
        return MaterialPage<UserListScreen>(
          key: state.pageKey,
          child: const UserListScreen(),
        );
      },
    ),
    GoRoute(
      path: AppPages.userDetailScreen,
      pageBuilder: (context, state) {
        return MaterialPage<UserDetailScreen>(
          key: state.pageKey,
          child: UserDetailScreen(userEntity: state.extra as UserEntity),
        );
      },
    ),
  ];
}