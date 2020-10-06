import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/app_localizations.dart';

import 'select_input_bottom_sheet.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class SelectOption<Value> {
  final String label;
  final Value value;

  SelectOption({this.label, this.value});

  @override
  String toString() {
    return 'SelectOption{label: $label, value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SelectOption &&
              runtimeType == other.runtimeType &&
              value == other.value;

  @override
  int get hashCode => value.hashCode;
}

typedef OnSelectionCallback(SelectOption selection);

class SelectInput extends StatefulWidget {
  final String title;
  final List<SelectOption> options;
  final SelectOption selection;
  final OnSelectionCallback onSelection;

  SelectInput({
    Key key,
    this.selection,
    @required this.title,
    @required this.options,
    @required this.onSelection,
  }) : super(key: key);

  @override
  _SelectInputState createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  SelectOption _selection;

  @override
  void initState() {
    super.initState();
    _selection = widget.selection;
  }

  get isActive {
    return widget.options != null && widget.options.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          Row(
            children: [
              Expanded(
                child: OutlineButton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Theme.of(context).accentColor)),
                  disabledBorderColor: const Color(0xFFDDDDDD),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selection?.label ??
                            AppLocalizations.of(context)
                                .translate("PLEASE_SELECT", arg: widget.title),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: _getTextColor(context)),
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.chevron_right,
                          color: _getTextColor(context),
                        ),
                      )
                    ],
                  ),
                  onPressed: isActive ? _onTap : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getTextColor(BuildContext context) {
    if (isActive) {
      return _selection != null
          ? Theme.of(context).textTheme.bodyText1.color
          : Theme.of(context).accentColor;
    } else {
      return const Color(0xFF999999);
    }
  }

  _onTap() async {
    var result = await showModalBottomSheet<List<dynamic>>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return SelectInputBottomSheet(
                title: widget.title,
                options: widget.options,
                selection: _selection);
          },
        ) ??
        [SelectInputBottomSheetResultType.CANCELED, null];

    if (result.first == SelectInputBottomSheetResultType.SUBMITTED) {
      setState(() {
        _selection = result.last;
        widget.onSelection(_selection);
      });
    }
  }
}
