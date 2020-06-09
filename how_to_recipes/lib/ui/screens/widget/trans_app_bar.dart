import 'package:flutter/material.dart';

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
          style: TextStyle(fontSize: 24.0, color: Colors.black),
        ),
        actions: actions);
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
