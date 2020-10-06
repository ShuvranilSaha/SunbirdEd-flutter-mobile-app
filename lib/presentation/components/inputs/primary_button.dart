import 'package:flutter/material.dart';

import '../../../app_localizations.dart';
import '../custom_elevation.dart';

class PrimaryButton extends StatelessWidget {
  final bool expanded;
  final bool disabled;
  final double borderRadius;
  final String text;
  final Function onPressed;

  PrimaryButton({
    this.expanded = false,
    this.disabled = false,
    this.borderRadius = 20,
    @required this.text,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (expanded) {
      return Expanded(
        child: _buildButton(context),
      );
    }

    return _buildButton(context);
  }

  _buildButton(BuildContext context) {
    return CustomElevation(
      radius: 20.0,
      color: disabled
          ? Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5)
          : Theme.of(context).accentColor,
      child: FlatButton(
        textColor: Colors.white,
        disabledTextColor: Colors.black54,
        child: Text(
          AppLocalizations.of(context).translate(text),
        ),
        onPressed: disabled ? null : onPressed,
      ),
    );
  }
}
