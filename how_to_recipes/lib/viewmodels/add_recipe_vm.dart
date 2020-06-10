import 'package:flutter/material.dart';
import 'package:how_to_recipes/core/constants/view_state.dart';
import 'package:how_to_recipes/core/datasources/step_datasource.dart';
import 'package:how_to_recipes/core/datasources/task_datasource.dart';
import 'package:how_to_recipes/core/mixins/validators.dart';
import 'package:how_to_recipes/core/models/step.dart';
import 'package:how_to_recipes/core/models/task.dart';
import 'package:how_to_recipes/core/services/navigation/navigation_service.dart';
import 'package:how_to_recipes/locator.dart';
import 'package:how_to_recipes/ui/ui_helper.dart';
import 'package:how_to_recipes/viewmodels/base_veiw_model.dart';
import 'package:image_picker/image_picker.dart';

class AddRecipeVM extends BaseViewModel with Validators {
  final stepDb = locator<StepDataSource>();
  final nav = locator<NavigationService>();
  final categoryDb = locator<CategoryDataSource>();
  final picker = ImagePicker();
  final formKey = GlobalKey<FormState>();

  

  final TextEditingController mealController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  List<AStep> _steps = [];
  List<AStep> get steps => _steps;

  String _image = '';
  String get imagePath => _image;

  List<Widget> _widgets = [];
  List<Widget> get widgets => _widgets;
  var _stepId = 0;
  var _catId = 0;

  
  Future init() {
    setState(ViewState.Idle);
    _getCatId();
  }

  Future<void> _getCatId() async {
    print(_catId);
    _stepId = await categoryDb.getLastId() ?? 0;
  }

  Future<void> addRecipe() async {
    var data = Category(id: _catId + 1, title: mealController.text, description: descController.text, imagePath: _image );
    await categoryDb.addCategory(data);
    mealController.clear();
    descController.clear();
    _image = '';
    nav.pop();
  }

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    print(pickedFile.path);
    _image = pickedFile.path;
    setState(ViewState.DataFetched);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mealController.dispose();
    descController.dispose();
  }

  // Future<void> _getStepId() async {
  //    print(_stepId);
  //   _stepId = await stepDb.getLastId() ?? 0;
  // }
  // Future<void> addStep(String step, int stepNum) async {
  //   final data = AStep(
  //       id: _stepId + 1,
  //       description: step,
  //       categoryId: _catId + 1,
  //       step: stepNum);

  //   await stepDb.addSteps(data);
  //   notifyListeners();
  // }

  // Future<String> getImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.camera);
  //   return pickedFile.path;
  // }

  // void addWidgets() {
  //   print(descController.text);
  //   addStep(descController.text, int.parse(numberController.text));
  //   print(_widgets.length);
  //   descController.clear();
  //   numberController.clear();
  //   notifyListeners();
  // }

}

// Text(
//           stepNum.toString(),
//           style: TextStyle(color: Colors.white),
//         ),
//         title: Text(
//           step,
//           style: TextStyle(color: Colors.white),
//         ),
