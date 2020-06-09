import 'package:how_to_recipes/core/constants/view_routes.dart';
import 'package:how_to_recipes/core/services/key_storage/key_storage_service.dart';
import 'package:how_to_recipes/core/services/navigation/navigation_service.dart';
import 'package:how_to_recipes/viewmodels/base_veiw_model.dart';

import '../locator.dart';

class OnBoardingVM extends BaseViewModel {
  final _navigationservice = locator<NavigationService>();
  final keystorage = locator<KeyStorageService>();
  int _index = 0;
  int get index => _index;

  void init(){
      keystorage.isFirstTime = false;
  }

  void changeTab(int index) {
    _index = index;
    notifyListeners();
  }

  void gotoHome(){
    _navigationservice.pushReplacementNamed(ViewRoutes.home);
  }
}
