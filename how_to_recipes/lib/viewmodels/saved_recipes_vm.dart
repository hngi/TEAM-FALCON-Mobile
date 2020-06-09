import 'package:how_to_recipes/core/constants/view_state.dart';
import 'package:how_to_recipes/core/datasources/task_datasource.dart';
import 'package:how_to_recipes/core/models/task.dart';
import 'package:how_to_recipes/viewmodels/base_veiw_model.dart';

import '../locator.dart';

class SavedRecipesVM extends BaseViewModel{
  final _data = locator<CategoryDataSource>();
  List<Category> _list = [];
  List<Category> get list => _list;

  Future<void> init() async {
    await _attemptFetchData();
  }

  Future<void> _attemptFetchData() async {
    setState(ViewState.Busy);

    try {
      final fetchData = await _data.getCategory();
      _list = fetchData.toList();
      _chechIfDataIsEmpty();
    } catch (e) {}
  }

  void _chechIfDataIsEmpty() {
    _list.isEmpty
        ? setState(ViewState.NoDataAvailable)
        : setState(ViewState.Idle);
  }
}