import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      //backgroundColor: Colors.red,

      body: Column(
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
            'CookApp',
            style: TextStyle(
                fontFamily: 'DMSans',
                fontWeight: FontWeight.w500,
                fontSize: 24.0),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
