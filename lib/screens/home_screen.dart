import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:main/screens/about_us.dart';
import 'package:main/screens/barcode_scanner.dart';
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
    AboutUs(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 183, 182),
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
          color: const Color.fromARGB(255, 255, 197, 92),
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
              rippleColor: const Color.fromARGB(255, 93, 75, 75),
              hoverColor: const Color.fromARGB(255, 39, 31, 31),
              gap: 1,
              activeColor: Color.fromARGB(162, 255, 255, 255),
              iconSize: 30,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color.fromARGB(255, 146, 1, 0),
              color: const Color.fromARGB(255, 0, 0, 0),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 146, 1, 0),
          child: const Icon(Icons.qr_code_scanner_rounded),
          onPressed: () => BarcodeScanner2().scanBarcodeNormal()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
