import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final int? quantity;
  final int? scans;
  final String? product;
  final ValueChanged<String> onChangedProduct;
  final ValueChanged<int> onChangedQuantity;
  final ValueChanged<int> onChangedScans;

  const NoteFormWidget({
    Key? key,
    this.quantity = 0,
    this.product = '',
    this.scans = 0,
    required this.onChangedProduct,
    required this.onChangedScans,
    required this.onChangedQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: (quantity ?? 0).toDouble(),
                      min: 0,
                      max: 5,
                      divisions: 5,
                      onChanged: (number) => onChangedQuantity(number.toInt()),
                    ),
                  )
                ],
              ),
              buildTitle(),
              SizedBox(height: 8),
              buildDescription(),
              SizedBox(height: 16),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: product,
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Title',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The title cannot be empty' : null,
        onChanged: onChangedProduct,
      );

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
      );
}
