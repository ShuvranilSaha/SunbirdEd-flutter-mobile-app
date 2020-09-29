import 'package:flutter/material.dart';

class RadialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  RadialButton({@required this.onPressed, @required this.child});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
      child: child,
      onPressed: onPressed,
    );
  }
}
