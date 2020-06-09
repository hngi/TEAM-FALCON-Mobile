import 'package:flutter/material.dart';

class AddSteps extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AddSteps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.transparent,
       title: Text(
         "Create new recipe",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.black,
            )
          )
        ],
      ),
      body: Container(
        child: Column(
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
                bottomRight: Radius.circular(22.0)
                )
            ),
      child: FlatButton(
        child: IconButton(
            icon: Icon(Icons.camera_enhance),
            onPressed: null),
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
          margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Steps",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          )),
      Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          height: 50.0,
          width: 500.0,
          decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22.0),
                  topLeft: Radius.circular(22.0),
                  topRight: Radius.circular(22.0))),
          child: Text(
            "Add Steps",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
        ),
    ));
  }
}
