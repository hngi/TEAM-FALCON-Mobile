import 'package:how_to_recipes/core/constants/view_routes.dart';
import 'package:how_to_recipes/core/services/key_storage/key_storage_service.dart';
import 'package:how_to_recipes/core/services/navigation/navigation_service.dart';
import 'package:stacked/stacked.dart';

import '../locator.dart';

class HomeScreenVM extends BaseViewModel {
  final _navigationservice = locator<NavigationService>();
  final _keystorage = locator<KeyStorageService>();
  String _name;
  String get name => _name;

  Future init(){
    _name = _keystorage.name;
  }

  void newRecipe(){
    _navigationservice.pushNamed(ViewRoutes.addrecipe);
  }

  void savedRecipe(){
     _navigationservice.pushNamed(ViewRoutes.savedrecipe);
  }
}
