import 'package:flutter/material.dart';
import 'package:how_to_recipes/core/models/task.dart';
import 'package:how_to_recipes/ui/screens/widget/round_rectangular_button.dart';
import 'package:how_to_recipes/ui/screens/widget/rounded_rectangular_image.dart';
import 'package:how_to_recipes/ui/screens/widget/state_responsive.dart';
import 'package:how_to_recipes/viewmodels/saved_recipes_vm.dart';
import 'package:stacked/stacked.dart';

class SavedRecipesScreen extends StatefulWidget {
  @override
  _SavedRecipesScreenState createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  var _SavedRecipes = <SavedRecipe>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Saved Recipes',
          style: TextStyle(fontSize: 24.0, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.help_outline),
            tooltip: 'Show Help',
            iconSize: 32.0,
            color: Color(0xFFFFAC50),
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
          color: Color(0xFFFFAC50),
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

class SavedRecipe {
  final String image;
  final String title;

  SavedRecipe({this.image, this.title});
}
