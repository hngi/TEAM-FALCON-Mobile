import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:how_to_recipes/ui/ui_helper.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool pressed = false;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.lightBG,
      body: Center(
        child: PageView(
          children: <Widget>[
            SafeArea(
              child: Scaffold(
                backgroundColor: Constants.lightBG,
                body: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Image(
                          alignment: Alignment.bottomCenter,
                          height: 320.0,
                          width: 322.0,
                          image: AssetImage('assets/images/group267.png'),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.center,
                          width: 212.0,
                          // height: 78.0,
                          child:
                              Text('Create quick and simple recipes in minutes',
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Constants.weirdBlue,
                                    fontFamily: Constants.kfont,
                                  ),
                                  textAlign: TextAlign.center),
                        ),
                      ),
                      Container(
                        height: 200,
                        alignment: Alignment.bottomCenter,
                        child: ButtonTheme(
                          minWidth: 212.0,
                          height: 50.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text('Continue'),
                            color: Colors.orange,
                            textColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                pressed = true;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Scaffold(
                backgroundColor: Constants.lightBG,
                body: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: 30.0),
                          height: 52,
                          width: 212,
                          child: Text(
                            'Hi, Can we please have your name?',
                            style: TextStyle(
                              fontSize: 24,
                              color: Constants.weirdBlue,
                              fontFamily: 'DMSans',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Image(
                          alignment: Alignment.bottomCenter,
                          height: 198.0,
                          width: 198.0,
                          image: AssetImage('assets/images/group265.png'),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            width: 366,
                            height: 50,
                            margin: EdgeInsets.only(top: 50),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '  Preferred display name',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        alignment: Alignment.bottomCenter,
                        child: ButtonTheme(
                          minWidth: 212.0,
                          height: 50.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text('Get Started'),
                            color: Colors.orange,
                            textColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                pressed = true;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
