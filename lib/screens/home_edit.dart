// import 'package:flutter/material.dart';
// import 'package:main/db/data_base.dart';
// import 'package:main/models/data_manage.dart';
// import 'package:main/widget/note_form_widget.dart';

// class AddEditNotePage extends StatefulWidget {
//   final Note? note;

//   const AddEditNotePage({
//     Key? key,
//     this.note,
//   }) : super(key: key);
//   @override
//   _AddEditNotePageState createState() => _AddEditNotePageState();
// }

// class _AddEditNotePageState extends State<AddEditNotePage> {
//   final _formKey = GlobalKey<FormState>();
//   late int quantity;
//   late int scans;
//   late String product;

//   @override
//   void initState() {
//     super.initState();

//     quantity = widget.note?.quantity ?? 0;
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           actions: [buildButton()],
//         ),
//         body: Form(
//           key: _formKey,
//           child: NoteFormWidget(
//             product: product,
//             quantity: quantity,
//             scans: scans,
//             onChangedProduct: (product) => setState(() => this.product = product),
//             onChangedQuantity: (quantity) => setState(() => this.quantity = quantity),
//             onChangedScans: (scans) => setState(() => this.scans = scans),
            
//           ),
//         ),
//       );

//   Widget buildButton() {
//     final isFormValid = product.isNotEmpty;

//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           onPrimary: Colors.white,
//           primary: isFormValid ? null : Colors.grey.shade700,
//         ),
//         onPressed: addOrUpdateNote,
//         child: Text('Save'),
//       ),
//     );
//   }

//   void addOrUpdateNote() async {
//     final isValid = _formKey.currentState!.validate();

//     if (isValid) {
//       final isUpdating = widget.note != null;

//       if (isUpdating) {
//         await updateNote();
//       } else {
//         await addNote();
//       }

//       Navigator.of(context).pop();
//     }
//   }

//   Future updateNote() async {
//     final note = widget.note!.copy(
//       product: product,
//       quantity: quantity,
//       scans: scans
//     );

//     await ItemEntry.instance.update(note);
//   }

//   Future addNote() async {
//     final note = Note(
//       product: product,
//       quantity: quantity,
//       scans: 0,
      
      
//     );

//     await ItemEntry.instance.create(note);
//   }
// }
