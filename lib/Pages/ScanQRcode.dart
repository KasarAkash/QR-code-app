// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRcode extends StatefulWidget {
  const ScanQRcode({Key? key}) : super(key: key);

  @override
  _ScanQRcodeState createState() => _ScanQRcodeState();
}

class _ScanQRcodeState extends State<ScanQRcode> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQRview(context),
          Positioned(
            bottom: 10,
            child: buidResult(),
          ),
        ],
      ),
    );
  }

  Widget buidResult() => Text(
        barcode != null ? '${barcode!.code}' : 'Scan a code!',
        maxLines: 3,
      );

  Widget buildQRview(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderWidth: 10,
          borderLength: 22,
          borderRadius: 12,
          borderColor: Theme.of(context).accentColor,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen(
      (barcode) => setState(() => this.barcode = barcode),
    );
  }
}
