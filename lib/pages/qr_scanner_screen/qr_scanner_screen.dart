import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
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
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: TopBar(
                  MediaQuery.of(context).size.height * (1 / 3),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("sample"),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: OutlineButton(child: Text('Go back', style: TextStyle(color: Colors.black),), onPressed: () {
                    Navigator.of(context).pop();
                  },),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
