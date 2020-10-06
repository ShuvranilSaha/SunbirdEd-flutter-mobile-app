import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sunbird_ed_flutter_mobile_app/app_localizations.dart';
import 'package:sunbird_ed_flutter_mobile_app/presentation/components/top_bar.dart';

class QrScannerScreen extends StatefulWidget {
  static const routeName = "/qr-scanner";

  @override
  _QrScannerScreenState createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "");
  var qrText = "";
  QRViewController controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scannedData) {
      setState(() {
        qrText = scannedData;
      });
      print(qrText);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * (2 / 3) + 40,
                width: MediaQuery.of(context).size.width,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.white,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: TopBar(
                  MediaQuery
                      .of(context)
                      .size
                      .height * (1 / 3),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: ClipRect(
                child: Transform.translate(
                  offset: Offset(0.0, 50.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * (1 / 3),
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: FlareActor(
                        "assets/flare/qr_scan.flr",
                        animation: "Animations",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 50,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)
                          .translate("SCAN_QR_CODE"),),
                      Text(AppLocalizations.of(context)
                          .translate("SCAN_QR_INSTRUCTION")),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              child: SafeArea(
                child: FlatButton(
                  color: Color(0xCC000000),
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context).translate("NO_QR_CODE"),
                      ),
                      SizedBox(width: 8.0),
                      Icon(Icons.info_outline)
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
