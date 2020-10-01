import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/custom_elevation.dart';

import '../../../app_localizations.dart';

class BottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            _buildOvalBoundary(context),
            _buildOrText(context),
          ],
        ),
        _buildTextBody(context),
        _buildFrameworkSelectionButton(context),
      ],
    );
  }

  Widget _buildOrText(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, -16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        decoration: BoxDecoration(
          color: Color(0xFF999999),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(
          AppLocalizations.of(context).translate("OR"),
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildOvalBoundary(BuildContext context) {
    const height = 125.0;
    return Container(
      height: height / 2,
      child: Wrap(
        children: [
          Transform.translate(
            offset: Offset(0.0, -height / 2),
            child: ClipRect(
              child: Transform.translate(
                offset: Offset(0.0, height / 2),
                child: ClipOval(
                  child: Container(
                    color: Colors.white,
                    child: SizedBox(
                      height: height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextBody(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context).translate("NO_QR_CODE_QSTN"),
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  AppLocalizations.of(context).translate("PROVIDE_BELOW_INFO"),
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFrameworkSelectionButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  AppLocalizations.of(context).translate("BOARD"),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Theme.of(context).accentColor),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: CustomElevation(
                    radius: 20.0,
                    color: Theme.of(context).accentColor,
                    child: FlatButton(
                      child: Text(
                        AppLocalizations.of(context)
                            .translate("BOARD_OPTION_TEXT"),
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
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
