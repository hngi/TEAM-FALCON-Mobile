import 'package:flutter/material.dart';
import 'package:how_to_recipes/ui/screens/onboarding.dart';
import 'package:how_to_recipes/ui/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: Onboarding(),
    );
  }
}
