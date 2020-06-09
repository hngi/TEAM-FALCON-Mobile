import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {

  @override
  _OnboardingState createState() => _OnboardingState();
  
}

class _OnboardingState extends State<Onboarding> {
  bool pressed=false;
  PageController _pageController;

  @override 
  void initState(){
    super.initState();
    _pageController= PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:PageView(
            children: <Widget>[
              Scaffold(
                backgroundColor: Colors.white,
                body: Container(margin: EdgeInsets.only(
                  top: 150),
                
                  child: Column(
                    children: <Widget>[
                      Align(alignment: Alignment.topCenter,
                        child:Image.asset('assets/images/group267.png'),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:90),
                        width: 212.0,
                        height: 78.0,
                        child: Text('Create quick and simple recipes in minutes',
                        style: TextStyle(fontSize: 26),
                        textAlign: TextAlign.center),
                      ),
                      
                      Container(
                        height:200,
                        alignment: Alignment.bottomCenter,
                        child:ButtonTheme(
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

              Scaffold(
                backgroundColor: Colors.white,
                body: Container(margin: EdgeInsets.only(
                  top: 120),
                  alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                  bottom: 50),
                  
                      height: 52,
                      width: 212,
                      child: Text('Hi, Can we please have your name?',
                        style: TextStyle(fontSize: 26),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                    Align(alignment: Alignment.bottomCenter,
                      child:Image.asset('assets/images/group265.png'),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                      width: 366,
                      height: 50,
                      margin: EdgeInsets.only(top:50),
                     child: TextField(
                       decoration: InputDecoration(
                         hintText: '  Preferred display name',
                       ),
                      ),
                    ),
                    
                    Container(
                      height:300,
                      alignment: Alignment.bottomCenter,
                      child :ButtonTheme(
                        minWidth: 212.0,
                        height: 50.0,
                        child:RaisedButton(
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
            ],
          ),
        ),
    );
  }
}