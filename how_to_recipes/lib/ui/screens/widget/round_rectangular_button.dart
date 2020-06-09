import 'package:flutter/material.dart';

class RoundRectangularButton extends StatelessWidget {
  final double radius;
  final String text;
  final Color color;
  final Function onPressed;
  final double width;
  final double height;
  final IconData icon;
  final BoxConstraints constraints;
  RoundRectangularButton(this.radius,
      {this.text, this.color, this.onPressed, this.width, this.height, this.icon, this.constraints});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      fillColor: color,
      elevation: 6.0,
      onPressed: onPressed,
        child: ListTile(
          dense: true,
          title: Text(
              text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
          ),

        leading: icon != null ? Icon(icon, color: Colors.white,) : null
      ),
      constraints: constraints,
    );
  }
}
