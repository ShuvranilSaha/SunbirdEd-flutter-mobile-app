import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/inputs/labeled_radio.dart';

import '../../../../app_localizations.dart';
import '../../custom_elevation.dart';
import 'select_input.dart';

enum SelectInputBottomSheetResultType { SUBMITTED, CANCELED }

class SelectInputBottomSheet extends StatefulWidget {
  final String title;
  final List<SelectOption> options;
  final SelectOption selection;

  SelectInputBottomSheet({
    @required this.title,
    @required this.options,
    @required this.selection,
  });

  @override
  _SelectInputBottomSheetState createState() => _SelectInputBottomSheetState();
}

class _SelectInputBottomSheetState extends State<SelectInputBottomSheet> {
  SelectOption _selection;

  @override
  void initState() {
    super.initState();
    _selection = widget.selection;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2EA),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(flex: 0, child: _buildHeader(context)),
            Expanded(flex: 1, child: _buildBody(context)),
            Expanded(flex: 0, child: _buildFooter(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.options.length,
      itemBuilder: (context, index) {
        return LabeledRadio(
          label: widget.options[index].label,
          value: widget.options[index],
          groupValue: _selection,
          onChanged: (value) {
            setState(() {
              _selection = value;
            });
          },
        );
      },
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomElevation(
                  radius: 30,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('CANCEL')
                          .toUpperCase(),
                      style: Theme.of(context).textTheme.button.copyWith(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: _onCancel,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 1,
                child: CustomElevation(
                  radius: 30,
                  color: Theme.of(context).accentColor,
                  child: FlatButton(
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('BTN_SUBMIT')
                          .toUpperCase(),
                      style: Theme.of(context).textTheme.button.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: _onSubmit,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 8.0),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)
                    .translate("PLEASE_SELECT", arg: widget.title),
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  _onSubmit() {
    Navigator.pop(
        context, [SelectInputBottomSheetResultType.SUBMITTED, _selection]);
  }

  _onCancel() {
    Navigator.pop(
        context, [SelectInputBottomSheetResultType.CANCELED, _selection]);
  }
}
