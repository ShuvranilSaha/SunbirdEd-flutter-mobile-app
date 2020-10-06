import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    @required this.label,
    @required this.groupValue,
    @required this.value,
    @required this.onChanged,
    this.padding,
  });

  final String label;
  final EdgeInsets padding;
  final dynamic groupValue;
  final dynamic value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding ?? EdgeInsets.all(0),
        child: Row(
          children: <Widget>[
            Radio<dynamic>(
              groupValue: groupValue,
              value: value,
              onChanged: (dynamic newValue) {
                onChanged(newValue);
              },
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
