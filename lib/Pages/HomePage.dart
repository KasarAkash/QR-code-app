// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:qr_code_app/Pages/CreateQRcode.dart';
import 'package:qr_code_app/Pages/ScanQRcode.dart';
import 'package:qr_code_app/Widgets/MyButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR code'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              child: Button(title: "Create QR Code"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CreateQRcode(),
                  ),
                );
              },
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ScanQRcode(),
                  ),
                );
              },
              child: Button(title: "Scan QR Code"),
            ),
          ],
        ),
      ),
    );
  }
}
