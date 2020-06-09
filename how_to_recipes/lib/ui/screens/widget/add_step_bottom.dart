import 'package:flutter/material.dart';
import 'package:how_to_recipes/ui/ui_helper.dart';

class AddTaskSheet extends StatelessWidget {
  String newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Step',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, color: Constants.kcolor3),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: Constants.kinputBorder.copyWith(hintText: 'Step number e.g 1,2'),
              onChanged: (text) {
                newTaskTitle = text;
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: Constants.kinputBorder.copyWith(hintText: 'Enter Step Details'),
              onChanged: (text) {
                newTaskTitle = text;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            FlatButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Constants.kcolor3,
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
