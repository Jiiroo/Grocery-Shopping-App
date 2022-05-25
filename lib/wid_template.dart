import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  Color _color;

  //contructor
  Template(this._color);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: this._color,
      ),
        child: Text('Hi')
    );
  }
}
