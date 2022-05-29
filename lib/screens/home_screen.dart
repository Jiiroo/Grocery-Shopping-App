import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'scan_barcode.dart';
import 'package:main/widget/home_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    MyHomePage(),
    Icon(
      Icons.question_mark,
      size: 150,
    ),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(0)),
          color: Color.fromARGB(255, 82, 100, 149),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[300]!,
              gap: 1,
              activeColor: const Color.fromRGBO(53, 93, 58, 1),
              iconSize: 30,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: const Color.fromRGBO(238, 236, 223, 1),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.question_mark,
                  text: 'About Us',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.qr_code_scanner_rounded), onPressed: () => ScanSave().startBarcodeScanStream()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// class HomeScreen extends StatefulWidget {

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   static const List<Widget> _pages = <Widget>[
//    Icon(
//       Icons.home,
//       size: 150,),
//     Icon(
//       Icons.question_mark,
//       size: 150,
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
//         title: const Text('Grocery Shopping List'),
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
//       body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [ _pages.elementAt(_selectedIndex),]
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         iconSize: 25,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.question_mark),
//             label: 'About Us'
//           ),
    
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//       floatingActionButton:
//       FloatingActionButton(child: Icon(Icons.qr_code_scanner_rounded), onPressed: () => ScanSave().scanBarcodeNormal()),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }


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
