import 'package:flutter/material.dart';
import 'package:how_to_recipes/core/services/key_storage/key_storage_service.dart';
import 'package:how_to_recipes/locator.dart';

class Constants {
  static String appName = "GEWC Mobile";

  //Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.black;
  static Color darkAccent = Colors.white;
  static Color lightBG = Color(0xFFE5E5E5);
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;

  static const kPaddingS = 8.0;
  static const kPaddingM = 16.0;
  static const kPaddingL = 32.0;

  static const kinputBorder = InputDecoration(
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
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(15.0),
      ),
      borderSide: BorderSide(
        style: BorderStyle.solid,
      ),
    ),
  );

  static const kcolor1 = Color(0xFF1D1754);
  static const kcolor2 = Color(0xFFC4C4C4);
  static const korange = Color(0xFFFFAC50);
  static const kcolor3 = Color(0xFFFC7A1E);
  static const kdarkOrange = Color(0xFF8E3900);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    cardColor: darkPrimary.withOpacity(0.5),
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
    ),
  );
}

class AppStateNotifier extends ChangeNotifier {
  final keystorage = locator<KeyStorageService>();

  void updateTheme() {
    keystorage.isDarkMOde = !keystorage.isDarkMOde;
    notifyListeners();
  }
}
