import 'package:get_it/get_it.dart';
import 'package:how_to_recipes/core/datasources/step_datasource.dart';
import 'package:how_to_recipes/core/datasources/task_datasource.dart';
import 'package:how_to_recipes/core/services/Database/database.dart';
import 'package:how_to_recipes/core/services/key_storage/key_storage_impl.dart';
import 'package:how_to_recipes/core/services/key_storage/key_storage_service.dart';
import 'package:how_to_recipes/core/services/navigation/navigation_service.dart';
import 'package:how_to_recipes/core/services/navigation/navigation_service_impl.dart';

GetIt locator = GetIt.instance;

/// Setup function that is run before the App is run.
///   - Sets up singletons that can be called from anywhere
/// in the app by using locator<Service>() call.
///   - Also sets up factor methods for view models.
Future<void> setupLocator({bool test = false}) async {
  
  // Services
  locator.registerLazySingleton<NavigationService>(
    () => NavigationServiceImpl(),
  );

  locator.registerLazySingleton<DatabaseH>(() => DatabaseHImpl());

  if (!test) {
    await _setupSharedPreferences();
  }

  // Utils
  locator.registerLazySingleton<CategoryDataSource>(() => CategoryDataSourceImpl());
  locator.registerLazySingleton<StepDataSource>(() => StepDataSourceImpl());

  // External
}

Future<void> _setupSharedPreferences() async {
  final instance = await KeyStorageServiceImpl.getInstance();
  locator.registerLazySingleton<KeyStorageService>(() => instance);
}
