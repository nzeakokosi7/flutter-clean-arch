import 'package:flutter/material.dart';
import 'package:wayve_test_app/core/ui/_navigation/back_dispatcher.dart';
import 'package:wayve_test_app/core/ui/base/base_view_model.dart';
import 'package:wayve_test_app/core/ui/routing/app_routes.dart';
import 'package:wayve_test_app/core/utils/splash_screen/splash_screen.dart';
import 'package:wayve_test_app/features/user_status/domain/entities/user_entity.dart';
import 'package:wayve_test_app/features/user_status/presentation/screens/user_detail_screen.dart';
import 'package:wayve_test_app/features/user_status/presentation/screens/user_list_screen.dart';

class AppRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  final List<Page> _pages = [];
  late AppBackButtonDispatcher backButtonDispatcher;

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // AppRouterDelegate(this.appState) {
  //   appState.addListener(() {
  //     notifyListeners();
  //   });
  // }

  /// Getter for a list that cannot be changed
  List<MaterialPage> get pages => List.unmodifiable(_pages);

  /// Number of pages function
  int numPages() => _pages.length;

  @override
  List<Page> get currentConfiguration => _pages;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: buildPages(),
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (canPop()) {
      popRoute();
      return true;
    } else {
      return false;
    }
  }


  bool canPop() {
    return _pages.length > 1;
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _pages.removeLast();
      return Future.value(true);
    }
    return Future.value(false);
  }

  MaterialPage _createPage(Widget child, RouteSettings routeSettings) {
    return MaterialPage(
        child: child,
        key: Key(routeSettings.name!) as LocalKey,
        name: routeSettings.name,
        arguments: routeSettings.arguments);
  }

  void _addPageData(Widget child, RouteSettings routeSettings) {
    _pages.add(
      _createPage(child, routeSettings),
    );
  }

  void goTo({required String name, dynamic arguments}) {
    _addPage(RouteSettings(name: name, arguments: arguments));
    notifyListeners();
  }
  void _addPage(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.home:
        _addPageData( SplashScreen(), routeSettings);
        break;
      case AppRoutes.userListScreen:
        _addPageData(const UserListScreen(), routeSettings);
        break;
      case AppRoutes.userDetailScreen:
        _addPageData(UserDetailScreen(userEntity: routeSettings.arguments as UserEntity), routeSettings);
        break;
      default:
        _addPageData(const Scaffold(
          body: Center(
            child: Text('Something went wrong', style: TextStyle(color: Colors.red, fontSize: 20),),
          ),
        ), routeSettings);

    }
  }

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {
    // _addPage(const RouteSettings(name: AppRoutes.home));
  }

  List<Page> buildPages() {
    _addPage(const RouteSettings(name: AppRoutes.home));
    return pages;
  }

}