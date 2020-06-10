import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:how_to_recipes/core/models/task.dart';

class RecipeDetails extends StatelessWidget {
  final Category category;

  const RecipeDetails({Key key, this.category}) : assert(category != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.file(
            File(category.imagePath),
            alignment: Alignment.topCenter,
          ),
          SizedBox(height: 30.0),
          Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Meal",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          category.title,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                          ),
                        ))
                  ],
                ),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  category.description,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
