import 'package:flutter/material.dart';
import 'package:how_to_recipes/ui/ui_helper.dart';

class TransAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final String title;
  TransAppBar(this.title, {this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(
              fontSize: 24.0,
              color: Constants.weirdBlue,
              fontFamily: Constants.kfont),
        ),
        actions: actions);
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
