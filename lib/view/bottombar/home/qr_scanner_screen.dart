
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../widgets/appbar.dart';
import '../../../widgets/my_text.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'JELOG',
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                print('Barcode found! ${barcode.rawValue}');
              }
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: "Scanner le QR Code",
                color: Colors.white, size: 18, weight: FontWeight.bold,
              ),
              SizedBox(height: 16),
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () => cameraController.start(),
                child: Column(
                  children: [
                    Icon(Icons.refresh, color: Colors.white, size: 30),
                    SizedBox(height: 5),
                    MyText(text:"Toucher pour re-scanner", color: Colors.white),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}