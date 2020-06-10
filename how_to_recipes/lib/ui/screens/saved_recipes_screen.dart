import 'package:flutter/material.dart';
import 'package:how_to_recipes/core/models/task.dart';
import 'package:how_to_recipes/ui/screens/widget/round_rectangular_button.dart';
import 'package:how_to_recipes/ui/screens/widget/rounded_rectangular_image.dart';
import 'package:how_to_recipes/ui/screens/widget/state_responsive.dart';
import 'package:how_to_recipes/ui/screens/widget/trans_app_bar.dart';
import 'package:how_to_recipes/ui/ui_helper.dart';
import 'package:how_to_recipes/viewmodels/saved_recipes_vm.dart';
import 'package:stacked/stacked.dart';

class SavedRecipesScreen extends StatefulWidget {
  @override
  _SavedRecipesScreenState createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.lightBG,
      appBar: TransAppBar(
          " Saved Recipes",
          actions: <Widget>[
            IconButton(
            icon: Icon(Icons.help_outline),
            iconSize: 32.0,
            color: Constants.weirdBlue,
            onPressed: () {},
          ),
          ],
        ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: _buildSuggestions(),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 48),
        child: RoundRectangularButton(
          20.0,
          text: 'Add new',
          color: Color(0xFFFFAC50),
          constraints: BoxConstraints.expand(
            width: 180.0,
            height: 50.0,
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    return ViewModelBuilder<SavedRecipesVM>.reactive(
      viewModelBuilder: () => SavedRecipesVM(),
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => StateResponsive(
        state: model.state,
        busyWidget: Center(child: CircularProgressIndicator()),
        idleWidget: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              return _buildRow(model.list[index]);
            }),
      ),
    );
  }

  Widget _buildRow(Category category) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 1.0,
      child: Container(
        height: 100.0,
        padding: EdgeInsets.fromLTRB(12.0, 10.0, 16.0, 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 0,
                child: RoundRectangularImage(
                  borderRadius: 15.0,
                  image: Image.asset(
                    'assets/images/sample_recipe.png',
                    height: 150.0,
                    width: 100.0,
                  ),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(category.title,
                      style: TextStyle(fontFamily: 'DMSans', fontSize: 18.0),
                      textAlign: TextAlign.start),
                )),
            Expanded(
                flex: 0,
                child: IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      size: 32.0,
                    ),
                    onPressed: () {})),
          ],
        ),
      ),
    );
  }
}
