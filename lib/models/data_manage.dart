final String tableNotes = 'shopping';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, product, quantity, scans
  ];

  static final String id = '_id';
  static final String quantity = 'quantity';
  static final String scans = 'scans';
  static final String product = 'title';
  // static final String time = 'time';
}

class Note {
  final int? id;
  final int quantity;
  final int scans;
  final String product;
  // final DateTime createdTime;

  const Note({
    this.id,
    required this.quantity,
    required this.scans,
    required this.product,
    // required this.createdTime,
    
  });

  Note copy({
    int? id,
    int? quantity,
    int? scans,
    String? product,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        scans: scans ?? this.scans,
        product: product ?? this.product,
        // createdTime: createdTime ?? this.createdTime,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        quantity: json[NoteFields.quantity] as int,
        scans: json[NoteFields.scans] as int,
        product: json[NoteFields.product] as String,
        // createdTime: DateTime.parse(json[NoteFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.product: product,
        NoteFields.quantity: quantity,
        NoteFields.scans: scans,
        // NoteFields.time: createdTime.toIso8601String(),
      };
}
