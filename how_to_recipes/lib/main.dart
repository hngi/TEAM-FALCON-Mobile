import 'package:flutter/material.dart';
import 'package:how_to_recipes/ui/screens/SearchScreen.dart';
import 'package:how_to_recipes/ui/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cook App',
      theme: ThemeData.light(),
      home: SearchScreen(),
    );
  }
}
