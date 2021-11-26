// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class ScanQRcode extends StatefulWidget {
  const ScanQRcode({Key? key}) : super(key: key);

  @override
  _ScanQRcodeState createState() => _ScanQRcodeState();
}

class _ScanQRcodeState extends State<ScanQRcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
    );
  }
}
