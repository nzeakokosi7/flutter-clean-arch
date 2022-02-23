import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wayve_test_app/core/ui/_navigation/back_dispatcher.dart';
import 'package:wayve_test_app/core/ui/_navigation/router_delegate.dart';
import 'package:wayve_test_app/core/ui/routing/app_routes.dart';
import 'package:wayve_test_app/core/utils/splash_screen/splash_screen.dart';

import 'core/providers/provider_setup.dart';
import 'core/ui/navigation/navigation.dart';
import 'core/ui/routing/app_router.dart';
import 'core/ui/styles/colors.dart';
import 'di.dart';

class MainApp extends StatelessWidget {
  final bool isDebug;

  const MainApp({
    Key? key,
    this.isDebug = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appDelegate = locator<AppRouterDelegate>();
    AppBackButtonDispatcher appBackButtonDispatcher = AppBackButtonDispatcher(appDelegate);

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: isDebug,
        title: 'WayveTestApp',
        theme: ThemeData(
          fontFamily: 'Inter',
          scaffoldBackgroundColor: AppColors.appBackground,
        ),
        home: Router(
          routerDelegate: appDelegate,
          backButtonDispatcher: appBackButtonDispatcher,
        ),
      ),
    );
  }
}