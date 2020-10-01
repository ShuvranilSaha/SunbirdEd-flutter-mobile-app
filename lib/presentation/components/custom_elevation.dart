import 'package:flutter/material.dart';

class CustomElevation extends StatelessWidget {
  final Widget child;
  final double radius;
  final Color color;

  CustomElevation(
      {@required this.child, @required this.radius, @required this.color})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        boxShadow: [
          BoxShadow(
            color: Color(0x25000000),
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(
              5.0,
              5.0,
            ),
          ),
        ],
      ),
      child: this.child,
    );
  }
}
