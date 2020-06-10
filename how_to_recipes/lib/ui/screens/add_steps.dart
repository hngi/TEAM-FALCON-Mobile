import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:how_to_recipes/ui/ui_helper.dart';
import 'widget/trans_app_bar.dart';
import 'widget/round_rectangular_button.dart';
import 'package:dotted_border/dotted_border.dart';

class AddSteps extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AddSteps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TransAppBar(
          " Create new recipe",
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check,
                  color: Constants.weirdBlue,
                ))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    height: 200,
                    margin: EdgeInsets.symmetric(vertical: 32.0),
                    child: FlatButton(
                      padding: EdgeInsets.all(4),
                      onPressed: () {},
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(22.0),
                        color: Constants.lightOrange,
                        strokeWidth: 2.0,
                        dashPattern: [10, 10],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset('assets/images/camera.svg',
                                semanticsLabel: 'Camera'),
                                SizedBox(
                                  height: 16.0,
                                ),
                            Text(
                              'add image (optional)',
                              style: TextStyle(
                                fontFamily: Constants.kfont,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(bottom: 32.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Meal Name',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 24.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Meal Description',
                    ),
                    maxLines: 4,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Steps',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontFamily: Constants.kfont),
                    textAlign: TextAlign.start,
                  ),
                ),
                RoundRectangularButton(
                  20.0,
                  color: Color(0xFFFC7A1E),
                  text: 'Add new step',
                  icon: Icons.add,
                  constraints: BoxConstraints.expand(
                    height: 50.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
