import 'package:flutter/material.dart';


class ListCard extends StatelessWidget {
  const ListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Card(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children:<Widget> [Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('The Enchanted Nightingale'),
                
                GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.delete,
                      size: 35.0,
                    ),
                  )

              ],
            ),
          ]
        )
      ),
    );
  }
}
