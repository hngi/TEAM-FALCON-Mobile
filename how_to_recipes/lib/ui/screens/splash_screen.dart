import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:how_to_recipes/viewmodels/splash_screen_vm.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      //backgroundColor: Colors.red,

      body: ViewModelBuilder<SplashScreenVM>.reactive(
        viewModelBuilder: () => SplashScreenVM(),
        onModelReady: (model) => model.startUp(),
        builder: (context, model, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(
                'assets/images/app_logo.png',
              ),
              height: 214.0,
              width: 214.0,
            ),
            Text(
              'My Recipe Diary',
              style: TextStyle(
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
