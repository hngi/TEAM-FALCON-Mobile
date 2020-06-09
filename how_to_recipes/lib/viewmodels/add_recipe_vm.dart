import 'package:how_to_recipes/core/datasources/step_datasource.dart';
import 'package:how_to_recipes/core/models/step.dart';
import 'package:how_to_recipes/locator.dart';
import 'package:how_to_recipes/viewmodels/base_veiw_model.dart';

class AddRecipeVM extends BaseViewModel {
  final stepDb = locator<StepDataSource>();
  final categoryDb = locator<StepDataSource>();
  List<AStep> _steps = [];
  List<AStep> get steps => _steps;
  var _stepId = 0;
  var _catId = 0;

  Future<void> _getStepId() async {
    _stepId = await stepDb.getLastId();
  }

  Future<void> _getCatId() async {
    _stepId = await categoryDb.getLastId();
  }

  Future<void> addStep(String step) async {
    await _getCatId();
    await _getStepId();
    
    final data = AStep(
      id: _stepId + 1,
      description: step,
      categoryId: _catId + 1,
      step: 
    );
  }

  Future<String> getImage() {}
}
