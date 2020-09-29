import 'package:flutter/material.dart';

class RadialBox extends StatelessWidget {
  final Widget child;
  final Color color;

  RadialBox({this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color(0x3D000000),
            blurRadius: 4.0,
            spreadRadius: 0.0,
            offset: Offset(
              0.0,
              2.0,
            ),
          ),
        ],
        color: color,
      ),
      child: child,
    );
  }
}
