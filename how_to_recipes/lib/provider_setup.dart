import 'package:how_to_recipes/ui/ui_helper.dart';
import 'package:how_to_recipes/viewmodels/add_recipe_vm.dart';
import 'package:how_to_recipes/viewmodels/base_veiw_model.dart';
import 'package:how_to_recipes/viewmodels/onboarding_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// List of providers that provider transforms into a widget tree
/// with the main app as the child of that tree, so that the entire
/// app can use these streams anywhere there is a [BuildContext]
List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableProviders = [
  ChangeNotifierProvider<AppStateNotifier>(
      create: (context) => AppStateNotifier()),
  
  ChangeNotifierProvider<OnBoardingVM>(create: (context) => OnBoardingVM()),
  ChangeNotifierProvider<AddRecipeVM>(create: (context) => AddRecipeVM())
];
