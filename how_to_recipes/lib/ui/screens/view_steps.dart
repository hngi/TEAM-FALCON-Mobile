import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:how_to_recipes/core/models/task.dart';

class RecipeDetails extends StatelessWidget {
  final Category category;

  const RecipeDetails({Key key, this.category}) : assert(category != null);

  @override
  Widget build(BuildContext context) {
    print(category.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Top(
              category: category,
            ),
            Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Steps',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  category.description,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Top extends StatelessWidget {
  final Category category;

  const Top({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.0,
      child: Stack(
        children: <Widget>[
          category.imagePath.isEmpty
              ? Image.asset(
                  'assets/images/sample_recipe.png',
                  height: 240.0,
                  width: double.infinity,
                )
              : Image.file(
                  File(category.imagePath),
                  alignment: Alignment.center,
                  height: 240.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
          Container(
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15)),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {},
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                category.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
