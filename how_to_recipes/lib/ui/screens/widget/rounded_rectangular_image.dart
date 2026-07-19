import 'package:flutter/material.dart';

class RoundRectangularImage extends StatelessWidget {
  final double borderRadius;
  final Image image;

  RoundRectangularImage({this.borderRadius, this.image});
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: image
              );
  }
}