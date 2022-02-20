import 'package:get_it/get_it.dart';
import 'core/ui/navigation/navigation.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}