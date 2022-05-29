import 'package:flutter/material.dart';
import 'package:main/models/data_manage.dart';
import 'package:main/screens/scan_barcode.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  // All journals
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }

  final TextEditingController _productConttoller = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _productConttoller.text = existingJournal['product'];
      // _quantityController.text = existingJournal['quantity'];
    }
  
    showModalBottomSheet(
        backgroundColor: const Color.fromARGB(255, 255, 197, 92),
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => SafeArea(child: Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 250,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _productConttoller,
                    decoration: const InputDecoration(hintText: 'Product'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 146, 1, 0),
                      textStyle: const TextStyle(
                      fontWeight: FontWeight.bold)),
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }

                      // Clear the text fields
                      _productConttoller.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Add Item' : 'Update'),
                  )
                ],
              ),
            ),)
            );
  }

// Insert a new journal to the database
  Future<void> _addItem() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    String barcode = barcodeScanRes;
    await SQLHelper.createItem(_productConttoller.text, barcode, true);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(id, _productConttoller.text);
    _refreshJournals();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted an item!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    Future<Null> _refresh() async {
      _refreshJournals();
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 184, 183, 182),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 197, 92),
          title: const Text('Grocery Shopping List', 
            style: TextStyle(
              color: Color.fromARGB(255, 11, 11, 11),
              fontWeight: FontWeight.bold)
            ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_box_outlined, color: Color.fromARGB(255, 0, 0, 0) ,),
              tooltip: 'Add to Shopping List',
              onPressed: () => _showForm(null),
            )
          ],
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  _refresh();
                },
                child: ListView.builder(
                  itemCount: _journals.length,
                  itemBuilder: (BuildContext context, index) {
                    return Card(
                      color: (_journals[index]['status'] == 0
                          ? Colors.red
                          : Color.fromARGB(255, 255, 197, 92)),
                      margin: const EdgeInsets.all(15),
                      child: ListTile(
                          title: Text(_journals[index]['product'],
                          style: const TextStyle(
                                color: Color.fromARGB(255, 11, 11, 11),
                                fontWeight: FontWeight.bold)),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () =>
                                      _showForm(_journals[index]['id']),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () =>
                                      _deleteItem(_journals[index]['id']),
                                ),
                              ],
                            ),
                          )
                      ),
                    );
                  },
                ),
              )
            );
  }
}
