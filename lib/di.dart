import 'package:get_it/get_it.dart';
import 'package:wayve_test_app/core/ui/_navigation/router_delegate.dart';
import 'package:wayve_test_app/core/ui/base/base_view_model.dart';
import 'package:wayve_test_app/features/user_status/data/repositories/user_repository.dart';
import 'package:wayve_test_app/features/user_status/data/services/user_service.dart';
import 'core/api/http_client.dart';
import 'core/ui/navigation/navigation.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerFactory(() => HttpHelper());

  // locator.registerLazySingleton<NavigationService>(() => NavigationService());

  locator.registerLazySingleton<UserService>(
        () => UserServiceImpl(
      httpHelper: locator.get(),
    ),
  );

  locator.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(),
  );

  locator.registerLazySingleton<AppRouterDelegate>(() => AppRouterDelegate());

}