import 'package:flutter/material.dart';
import '../../utils/consts/texts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io' show Platform;

class QRPageView extends StatefulWidget {
  const QRPageView({Key? key}) : super(key: key);

  @override
  State<QRPageView> createState() => _QRPageViewState();
}

class _QRPageViewState extends State<QRPageView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  void _onQRViewCreated(QRViewController controller) {
    debugPrint(
        'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS');
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 800,
        padding: const EdgeInsets.fromLTRB(14, 20, 14, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            const AppBarText(text: 'SCAN QR'),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(14),
              height: 400,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    cutOutSize: MediaQuery.of(context).size.width * 0.8),
              ),
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: InvText(
                  text:
                      'Place the QR code in the frame and wait a few seconds for the code to be scanned',
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
