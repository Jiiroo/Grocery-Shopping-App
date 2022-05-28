

import 'package:flutter/material.dart';


  
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() =>
      _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Colors.white,
        backgroundColor: Colors.blue,
        strokeWidth: 4.0,
        onRefresh: () async {
          // Replace this delay with the code to be executed during refresh
          // and return a Future when code finishs execution.
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        // Pull from top to show refresh indicator.
        child: ListView.builder(
          itemCount: 25,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
        ),
      ),
    );
  }
}


//   Widget build(BuildContext context) {
//     return Center(
      
//       child: Card(
//         child:Column(
//           mainAxisSize: MainAxisSize.min,
//           children:<Widget> [Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text('The Enchanted Nightingale'),
                
//                 GestureDetector(
//                     onTap: () {},
//                     child: Icon(
//                       Icons.delete,
//                       size: 35.0,
//                     ),
//                   )

//               ],
//             ),
//           ]
//         )
//       ),
//     );
//   }
// }
