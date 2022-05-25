import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  String hint_text;

  CustomForm(this.hint_text);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration:  InputDecoration(
              border: UnderlineInputBorder(),
              labelText: this.hint_text,
            ),
          ),
        ),
      ],
    );
  }
}
