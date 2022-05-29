// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'textbox_widgets.dart';
// import 'package:main/screens/home_screen.dart';
// import 'package:main/models/data_manage.dart';

// class AddItems extends StatefulWidget {
//   @override
//   _AddItems createState() => _AddItems();
// }

// class _AddItems extends State<AddItems> {
//   List<Map<String, dynamic>> _journals = [];
//   bool _isLoading = true;
//   // This function is used to fetch all data from the database
//   void _refreshJournals() async {
//     final data = await SQLHelper.getItems();
//     setState(() {
//       _journals = data;
//       _isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _refreshJournals();
//   }

//   String _scanBarcode = 'Unknown';
//   final TextEditingController _myController1 = TextEditingController();
//   final TextEditingController _myController2 = TextEditingController();

// // Insert a new journal to the database
//   Future<void> _addItem() async {
//     await SQLHelper.createItem(_myController1.text, _myController2.text);
//     _refreshJournals();
//   }

// // Update an existing journal
//   Future<void> _updateItem(int id) async {
//     await SQLHelper.updateItem(id, _myController1.text, _myController2.text);
//     _refreshJournals();
//   }

// // Delete an item
//   void _deleteItem(int id) async {
//     await SQLHelper.deleteItem(id);
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//       content: Text('Successfully deleted a journal!'),
//     ));
//     _refreshJournals();
//   }

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     _myController1.dispose();
//     _myController2.dispose();
//     super.dispose();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> scanBarcodeNormal() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(title: const Text('Add Item')),
//             body: Builder(builder: (BuildContext context) {
//               return Container(
//                   alignment: Alignment.center,
//                   child: Flex(
//                       direction: Axis.vertical,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text('Product Name'),
//                         TextField(
//                           controller: _myController1,
//                         ),
//                         Text('Quantity'),
//                         TextField(
//                           controller: _myController2,
//                         ),
//                         Text('Scan result : $_scanBarcode\n',
//                             style: TextStyle(fontSize: 20)),
//                         ElevatedButton(
//                             onPressed: () => scanBarcodeNormal(),
//                             child: Text('Start barcode scan')),
//                         ElevatedButton(
//                             onPressed: () => Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => HomeScreen()),
//                                 ),
//                             child: Text('Save')),
//                         ElevatedButton(
//                             onPressed: () async {
//                                 // Save new journal
//                                 if (id == null) {
//                                   await _addItem();
//                                 }

//                                 if (id != null) {
//                                   await _updateItem(id);
//                                 }
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => HomeScreen()),
//                               );
//                             },
//                             child: const Text('Cancel')),
//                       ]));
//             })));
//   }
// }

// // class AddItems extends StatelessWidget {
// //   const AddItems({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Add Item'),
// //         ),
// //         body: Column(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: <Widget>[
// //             CustomForm('Product Name'),
// //             CustomForm('Quantity'),
// //             ElevatedButton(
// //                 onPressed: () {
// //                   BarcodeScanner().scanBarcodeNormal();
// //                 },
// //                 child: const Text('Scan Barcode and Save')),
// //             ElevatedButton(
// //                 onPressed: () {
// //                   Navigator.pop(context);
// //                 },
// //                 child: const Text('Cancel')),
// //         ],
// //       )
// //     );
// //   }
// // }
