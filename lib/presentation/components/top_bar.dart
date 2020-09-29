import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final double height;

  TopBar(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
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
        ]
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image(
                    image: AssetImage('assets/images/leaves_bottom.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
