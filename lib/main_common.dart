import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/api/config.dart';
import 'core/enums/environment.dart';
import 'di.dart';
import 'main.dart';

Environment globalEnvironment = Environment.dev;

Future<void> mainCommon(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    //setup DI
    await setupLocator();

    //load environment variables from .env
    await dotenv.load(fileName: ".env");

    Config.envStatus = environment;
    globalEnvironment = environment;

    runApp(MainApp(
      isDebug: environment == Environment.dev,
    ));
  }, (exception, stackTrace) async {

  });
}
