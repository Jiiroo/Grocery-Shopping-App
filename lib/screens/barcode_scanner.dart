import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:main/models/data_manage.dart';

class BarcodeScanner2 {
  // This widget is the root of your application.

  String scanBarcode = 'Unknown';

  // Platform messages are asynchronous, so we initialize in an async method.
  scanBarcodeNormal() async {
    String barcodeScanRes;
    bool boolChange;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    scanBarcode = barcodeScanRes;

    final data = await SQLHelper.getItems();
    try {
      final existing =
          data.firstWhere((element) => element['barcode'] == scanBarcode);
      final idFind = existing['barcode'];
      final boolFind = existing['status'];
      
      if (boolFind == 1) {
        boolChange = false;
      } else {
        boolChange = true;
      }
      print('$boolFind anddddddddd $boolChange');
      await SQLHelper.updateStatus(idFind, boolChange);
    } on StateError {
      print('not match');
      
    }
  }
}
