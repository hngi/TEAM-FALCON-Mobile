import 'package:flutter/material.dart';
import 'package:how_to_recipes/core/datasources/step_datasource.dart';
import 'package:how_to_recipes/core/mixins/validators.dart';
import 'package:how_to_recipes/core/models/step.dart';
import 'package:how_to_recipes/locator.dart';
import 'package:how_to_recipes/ui/ui_helper.dart';
import 'package:how_to_recipes/viewmodels/base_veiw_model.dart';
import 'package:image_picker/image_picker.dart';

class AddRecipeVM extends BaseViewModel with Validators{
  final stepDb = locator<StepDataSource>();
  final categoryDb = locator<StepDataSource>();
  final picker = ImagePicker();
  List<AStep> _steps = [];
  List<AStep> get steps => _steps;

  List<Widget> _widgets = [];
  List<Widget> get widgets => _widgets;
  var _stepId = 0;
  var _catId = 0;

  String _image;
  String get image => _image;

  Future<void> _getStepId() async {
    _stepId = await stepDb.getLastId() ?? 0;
  }

  Future<void> _getCatId() async {
    _stepId = await categoryDb.getLastId() ?? 0;
  }

  Future<void> addStep(String step, int stepNum) async {
    await _getCatId();
    await _getStepId();

    final data = AStep(
        id: _stepId + 1,
        description: step,
        categoryId: _catId + 1,
        step: stepNum);

    await stepDb.addSteps(data);
    notifyListeners();
  }

  Future<String> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    return pickedFile.path;
  }

  void addWidgets(String step, int stepNum){
    print(step);
    _widgets.add(_newWidget(step,stepNum));
    notifyListeners();
  }

  Widget _newWidget(String step, int stepNum) {
    return Container(
      decoration: BoxDecoration(
          color: Constants.kcolor3, borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Text(
          stepNum.toString(),
          style: TextStyle(color: Colors.white),
        ),
        title: Text(
          step,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
  
}
