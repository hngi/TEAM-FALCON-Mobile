import 'package:how_to_recipes/core/constants/view_routes.dart';
import 'package:how_to_recipes/core/constants/view_state.dart';
import 'package:how_to_recipes/core/services/key_storage/key_storage_service.dart';
import 'package:how_to_recipes/core/services/navigation/navigation_service.dart';
import 'package:how_to_recipes/viewmodels/base_veiw_model.dart';

import '../locator.dart';

class SplashScreenVM extends BaseViewModel {
  final _navigationservice = locator<NavigationService>();
  final keystorage = locator<KeyStorageService>();

  Future startUp() async {
    setState(ViewState.Busy);
keystorage.isFirstTime = true;
    if (keystorage.isFirstTime) {
      await Future.delayed(Duration(seconds: 3));
      
      _navigationservice.pushReplacementNamed(ViewRoutes.onboarding);
    } else {
      await Future.delayed(Duration(seconds: 3));
      _navigationservice.pushReplacementNamed(ViewRoutes.savedrecipe);
    }
  }
}
