import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'textbox_widgets.dart';
import 'home_screen.dart';

class AddItems extends StatefulWidget {
  @override
  _AddItems createState() => _AddItems();
}

class _AddItems extends State<AddItems> {
  String _scanBarcode = 'Unknown';
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

   @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
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
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Add Item')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Product Name'),
                        TextField(controller: myController1,),
                        Text('Quantity'),
                        TextField(controller: myController2,),
                        Text('Scan result : $_scanBarcode\n',
                            style: TextStyle(fontSize: 20)),
                        ElevatedButton(
                            onPressed: () => scanBarcodeNormal(),
                            child: Text('Start barcode scan')),
                        
                        ElevatedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              ),
                            child: Text('Save')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            },
                            child: const Text('Cancel')),
                      ]));
            })));
  }
}

// class AddItems extends StatelessWidget {
//   const AddItems({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Add Item'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             CustomForm('Product Name'),
//             CustomForm('Quantity'),
//             ElevatedButton(
//                 onPressed: () {
//                   BarcodeScanner().scanBarcodeNormal();
//                 },
//                 child: const Text('Scan Barcode and Save')),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text('Cancel')),
//         ],
//       )
//     );
//   }
// }
