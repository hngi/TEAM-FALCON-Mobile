import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No Data',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
