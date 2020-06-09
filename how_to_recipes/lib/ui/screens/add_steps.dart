import 'package:flutter/material.dart';
import 'widget/trans_app_bar.dart';
import 'widget/round_rectangular_button.dart';

class AddSteps extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AddSteps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TransAppBar(
          "Create new recipe",
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check,
                  color: Colors.black,
                ))
          ],
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: 500,
                  height: 200,
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: new BoxDecoration(
                      border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22.0),
                          topLeft: Radius.circular(22.0),
                          topRight: Radius.circular(22.0),
                          bottomRight: Radius.circular(22.0))),
                  child: FlatButton(
                    onPressed: () {},
                    child: IconButton(
                        icon: Icon(Icons.photo_camera), onPressed: null),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Meal Name',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Meal Description',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 24, 10, 16),
                  child: Text(
                    'Steps',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: RoundRectangularButton(
                    20.0,
                    color: Color(0xFFFC7A1E),
                    text: 'Add new step',
                    icon: Icons.add,
                    constraints: BoxConstraints.expand(
                      width: 500.0,
                      height: 50.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
