import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewSteps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Image.asset('assets/rice_img.jpg',
            alignment: Alignment.topCenter,),
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
                    "Description",
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
                        "Steps on how i cooked my jollof rice. blah blah Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                        ),
                      )
                  )
                ],
              ),
            )),
            Column(
              children: <Widget>[
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
                      "1 Boil Water",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    ),
                ),
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
                      "2 Add Rice",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],

    ),
    );
}


}
