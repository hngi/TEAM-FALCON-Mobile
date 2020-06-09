import 'package:how_to_recipes/viewmodels/onboarding_vm.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui_helper.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final int _numPages = 2;
  PageController _pageController;

  List<Widget> _buildPageIndicator(int index) {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == index ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  final _views = <Widget>[Onboarding1(), Onboarding2()];

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: !isActive ? 10.0 : 45.0,
      decoration: BoxDecoration(
        color: !isActive ? Constants.kcolor2 : Constants.kcolor1,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardingVM>.reactive(
      builder: (context, model, _) => Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
                child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) =>
                  _views[model.index],
            )),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(model.index)),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              alignment: Alignment.bottomCenter,
              child: ButtonTheme(
                minWidth: 212.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: model.index == 0
                      ? Text(
                          'Continue',
                          style: TextStyle(fontSize: 18),
                        )
                      : Text('Get Started', style: TextStyle(fontSize: 18)),
                  color: Constants.korange,
                  textColor: Colors.white,
                  onPressed: () =>
                      model.index == 1 ? model.gotoHome() : model.changeTab(1),
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => OnBoardingVM(),
    );
  }
}

class Onboarding1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 100),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/group267.png'),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text('Create quick and simple recipes in minutes',
                  style: TextStyle(fontSize: 24, color: Constants.kcolor1),
                  textAlign: TextAlign.center),
            ),
          ],
        ));
  }
}

class Onboarding2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Hi, Can we please have your name?',
                style: TextStyle(fontSize: 26, color: Constants.kcolor1),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(child: Image.asset('assets/images/group265.png')),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Prefered display name',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
