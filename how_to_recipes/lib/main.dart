import 'package:flutter/material.dart';
import 'package:how_to_recipes/core/services/key_storage/key_storage_service.dart';
import 'package:how_to_recipes/core/services/navigation/navigation_service.dart';
import 'package:how_to_recipes/core/utils/logger.dart';
import 'package:how_to_recipes/locator.dart';
import 'package:how_to_recipes/provider_setup.dart';
import 'package:how_to_recipes/ui/router..dart';
import 'package:how_to_recipes/ui/screens/splash_screen.dart';
import 'package:how_to_recipes/ui/ui_helper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLogger(test: false);
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final navigationService = locator<NavigationService>();
  final keystorage = locator<KeyStorageService>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<AppStateNotifier>(
          builder:
              (BuildContext context, AppStateNotifier value, Widget child) =>
                  MaterialApp(
                    title: 'My Recipe Diary',
                    theme: Constants.lightTheme,
                    darkTheme: Constants.darkTheme,
                    navigatorKey: navigationService.navigatorKey,
                    onGenerateRoute: Router.generateRoute,
                    home: SplashScreen(),
                    //    home: SavedRecipesScreen(),
                  )),
    );
  }
}
