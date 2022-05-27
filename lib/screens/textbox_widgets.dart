import 'package:flutter/material.dart';

// // Define a custom Form widget.
// class CustomForm extends StatefulWidget {
//   const CustomForm({Key? key}) : super(key: key);
//   final String hint_text = '';

  

//   @override
//   _CustomFormState createState() => _CustomFormState();
// }

// // Define a corresponding State class.
// // This class holds the data related to the Form.
// class _CustomFormState extends State<CustomForm> {
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final myController = TextEditingController();

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//           child: TextField(
//             controller: myController,),
//         ),
//       ],
//     );
//   }
// }
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: TextField(
//           controller: myController,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // When the user presses the button, show an alert dialog containing
//         // the text that the user has entered into the text field.
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 // Retrieve the text the that user has entered by using the
//                 // TextEditingController.
//                 content: Text(myController.text),
//               );
//             },
//           );
//         },
//         tooltip: 'Show me the value!',
//         child: const Icon(Icons.text_fields),
//       ),
//     );
//   }
// }

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
