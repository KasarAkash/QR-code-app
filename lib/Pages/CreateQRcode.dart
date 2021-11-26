// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class CreateQRcode extends StatefulWidget {
  const CreateQRcode({Key? key}) : super(key: key);

  @override
  _CreateQRcodeState createState() => _CreateQRcodeState();
}

class _CreateQRcodeState extends State<CreateQRcode> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create QR Code"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarcodeWidget(
              height: 180,
              width: 180,
              data: controller.text,
              barcode: Barcode.qrCode(),
            ),
            SizedBox(height: 30),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter your data",
                border: OutlineInputBorder(),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.done),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
