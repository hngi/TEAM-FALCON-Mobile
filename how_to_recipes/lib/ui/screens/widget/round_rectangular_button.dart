import 'package:flutter/material.dart';

class RoundRectangularButton extends StatelessWidget {
  final double radius;
  final Color color;
  final Function onPressed;
  RoundRectangularButton(this.radius, {this.color, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      fillColor: color,
      elevation: 6.0,
      onPressed: onPressed,
      child: Text(
        'Add new',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      constraints: BoxConstraints.tightFor(width: 180.0, height: 50.0),
    );
  }
}
