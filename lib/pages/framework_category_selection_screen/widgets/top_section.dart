import 'package:flutter/material.dart';
import 'package:sunbird_ed_flutter_mobile_app/pages/qr_scanner_screen/qr_scanner_screen.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/custom_elevation.dart';

import '../../../app_localizations.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildQrImage(context),
          _buildTextBody(context),
          SizedBox(
            height: 16,
          ),
          _buildQRScanButton(context)
        ],
      ),
    );
  }

  Widget _buildTextBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)
                .translate("APP_QR_CODE", arg: "Diksha"),
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            AppLocalizations.of(context).translate("QR_CODE_DETAILS"),
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildQrImage(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Image.asset("assets/images/qr_with_book.png"),
      ),
    );
  }

  Widget _buildQRScanButton(BuildContext context) {
    return Center(
      child: Container(
        child: CustomElevation(
          radius: 10,
          color: Theme.of(context).accentColor,
          child: FlatButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.center_focus_strong, color: Colors.white),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  AppLocalizations.of(context).translate("SCAN_QR_CODE"),
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(QrScannerScreen.routeName);
            },
          ),
        ),
      ),
    );
  }
}
