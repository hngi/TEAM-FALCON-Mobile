import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:how_to_recipes/core/models/step.dart';
import 'package:how_to_recipes/ui/screens/widget/add_step_bottom.dart';
import 'package:how_to_recipes/ui/screens/widget/state_responsive.dart';
import 'package:how_to_recipes/ui/ui_helper.dart';
import 'package:how_to_recipes/viewmodels/add_recipe_vm.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class AddRecipe extends StatelessWidget {
  Widget _newWidget(AStep step) {
    print(step);
    return Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Constants.kcolor3, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(
                step.step.toString(),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 10),
              Text(
                step.description,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AddRecipeVM>(context);
    return ViewModelBuilder<AddRecipeVM>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => AddRecipeVM(),
      builder: (context, mode, _) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              "Create new recipe",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.black,
                ),
                onPressed: () {
                  if (!model.formKey.currentState.validate()) return;
                  model.addRecipe();
                },
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: model.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    StateResponsive(
                      state: model.state,
                      dataFetchedWidget: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 212.0,
                          child: Image(
                            image: FileImage(File(model.imagePath ?? '')),
                          ),
                        ),
                      ),
                      idleWidget: DottedBorder(
                        dashPattern: [6, 3, 2, 3],
                        strokeWidth: 2,
                        borderType: BorderType.RRect,
                        color: Constants.korange,
                        radius: Radius.circular(12),
                        padding: EdgeInsets.all(6),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Container(
                            height: 212.0,
                            width: double.infinity,
                            child: FlatButton(
                                onPressed: () {
                                  model.getImage();
                                },
                                child: Image.asset('assets/images/camera.png')),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: model.mealController,
                      validator: (s) =>
                          model.validateTextField(model.mealController.text),
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Meal Name',
                      ),
                    ),

                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Steps",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: TextFormField(
                        controller: model.descController,
                        validator: (s) =>
                            model.validateTextField(model.descController.text),
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Steps',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // ListView.builder(
                    //   itemCount: model.steps.length,
                    //   itemBuilder: (context, index) =>
                    //       _newWidget(model.steps[index]),
                    //   shrinkWrap: true,
                    // ),
                    // InkWell(
                    //   borderRadius: BorderRadius.circular(15),
                    //   onTap: () {
                    //     showModalBottomSheet(
                    //         context: context,
                    //         isScrollControlled: true,
                    //         builder: (context) {
                    //           return SingleChildScrollView(
                    //               child: Padding(
                    //             padding: EdgeInsets.only(
                    //                 bottom:
                    //                     MediaQuery.of(context).viewInsets.bottom),
                    //             child: AddTaskSheet(),
                    //           ));
                    //         });
                    //   },
                    //   child: Container(
                    //     margin: EdgeInsets.only(top: 10),
                    //     decoration: BoxDecoration(
                    //         color: Constants.kcolor3,
                    //         borderRadius: BorderRadius.circular(15)),
                    //     child: ListTile(
                    //       leading: Icon(Icons.add, color: Colors.white),
                    //       title: Text(
                    //         'Add new step',
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class StepItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Constants.kcolor3, borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Text(
          '1',
          style: TextStyle(color: Colors.white),
        ),
        title: Text(
          'do this',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
