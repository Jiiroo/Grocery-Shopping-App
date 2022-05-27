import 'add_items.dart';
import 'home_widget.dart';
import 'package:flutter/material.dart';
import 'scan_barcode.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.home,
      size: 150,
    ),
    Icon(
      Icons.question_mark,
      size: 150,
    ),
    // Icon(
    //   Icons.chat,
    //   size: 150,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery Shopping List'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddItems()),
                  );
                },
                child: Icon(
                  Icons.add,
                  size: 30.0,
                ),
              )),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'About Us'
          ),
      
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.chat),
          //   label: 'Chats',
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.qr_code_scanner_rounded), onPressed: () => ScanSave().scanBarcodeNormal()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static List<Widget> _widgetOptions = <Widget>[
//     ListCard(),
//     ScanSave(),
//     Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Grocery List'),
//         actions: <Widget>[
//           Padding(
//               padding: EdgeInsets.only(right: 20.0),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AddItems()),
//                   );
//                 },
//                 child: Icon(
//                   Icons.add,
//                   size: 30.0,
//                 ),
//               )),
//         ],
//       ),
//       body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//         _widgetOptions.elementAt(_selectedIndex),
//       ]),
//       bottomNavigationBar: BottomNavigationBar(
//         items:  <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.qr_code_scanner_rounded),
//             label: 'Scan Barcode',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.question_mark),
//             label: 'About Us',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color.fromARGB(255, 0, 183, 255),
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// // class HomeScreen extends StatelessWidget {
// //   HomeScreen({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Grocery List'),
// //           actions: <Widget>[
// //             Padding(
// //                 padding: EdgeInsets.only(right: 20.0),
// //                 child: GestureDetector(
// //                   onTap: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => const AddItems()),
// //                     );
// //                   },
// //                   child: Icon(
// //                     Icons.add,
// //                     size: 30.0,
// //                   ),
// //                 )),
// //           ],
// //         ),
// //         body: Column(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [ListCard(),
// //           ScanButton()],
// //         ));
// //   }
// // }

// // class ScanButton extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Align(
// //       alignment: Alignment.bottomRight,
// //       child: Padding(
// //           padding: EdgeInsets.only(right: 20.0),
// //           child: GestureDetector(
// //             onTap: () {},
// //             child: Icon(
// //               Icons.add,
// //               size: 30.0,
// //             ),
// //           )
// //       ),
// //     );
// //   }
// // }
