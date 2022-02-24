import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wayve_test_app/core/ui/navigation/navigation.dart';

import 'core/providers/provider_setup.dart';

import 'core/ui/styles/colors.dart';

class MainApp extends StatelessWidget {
  final bool isDebug;

  const MainApp({
    Key? key,
    this.isDebug = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: isDebug,
        title: 'WayveTestApp',
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
        theme: ThemeData(
          fontFamily: 'Inter',
          scaffoldBackgroundColor: AppColors.appBackground,
        ),
      ),
    );
  }
}