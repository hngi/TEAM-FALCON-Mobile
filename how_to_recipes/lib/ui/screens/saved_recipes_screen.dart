import 'dart:io';

import 'package:flutter/material.dart';
import 'package:how_to_recipes/core/models/task.dart';
import 'package:how_to_recipes/ui/screens/view_steps.dart';
import 'package:how_to_recipes/ui/screens/widget/empty_screen.dart';
import 'package:how_to_recipes/ui/screens/widget/round_rectangular_button.dart';
import 'package:how_to_recipes/ui/screens/widget/rounded_rectangular_image.dart';
import 'package:how_to_recipes/ui/screens/widget/state_responsive.dart';
import 'package:how_to_recipes/viewmodels/saved_recipes_vm.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class SavedRecipesScreen extends StatefulWidget {
  @override
  _SavedRecipesScreenState createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SavedRecipesVM>.nonReactive(
        viewModelBuilder: () => SavedRecipesVM(),
        onModelReady: (model) => model.init(),
        builder: (context, model, _) => Scaffold(
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
                // actions: <Widget>[
                //   IconButton(
                //     icon: const Icon(Icons.help_outline),
                //     tooltip: 'Show Help',
                //     iconSize: 32.0,
                //     color: Color(0xFFFFAC50),
                //     onPressed: () {},
                //   ),
                // ],
              ),
              body: Container(
                padding: EdgeInsets.only(top: 20),
                child: _buildSuggestions(),
              ),
              floatingActionButton: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 5, 20),
                child: RoundRectangularButton(
                  20.0,
                  color: Color(0xFFFFAC50),
                  onPressed: () {
                    model.newRecipe();
                  },
                ),
              ),
            ));
  }

  Widget _buildSuggestions() {
    return ViewModelBuilder<SavedRecipesVM>.reactive(
      viewModelBuilder: () => SavedRecipesVM(),
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => StateResponsive(
        state: model.state,
        busyWidget: Center(child: CircularProgressIndicator()),
        noDataAvailableWidget: EmptyScreen(),
        idleWidget: ListView.builder(
            itemCount: model.list.length,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              return _buildRow(model.list[index], context);
            }),
      ),
    );
  }

  Widget _buildRow(Category category, BuildContext context) {
    final model = Provider.of<SavedRecipesVM>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RecipeDetails(
                      category: category,
                    )));
      },
      child: Card(
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
                    image: category.imagePath.isEmpty
                        ? Image.asset(
                            'assets/images/sample_recipe.png',
                            height: 150.0,
                            width: 100.0,
                          )
                        : Image.file(
                            File(category.imagePath),
                            alignment: Alignment.center,
                            height: 150.0,
                            width: 100.0,
                            fit: BoxFit.cover,
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
                        Icons.delete,
                        size: 32.0,
                      ),
                      onPressed: () {
                        model.deleteRecipe(category);
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
