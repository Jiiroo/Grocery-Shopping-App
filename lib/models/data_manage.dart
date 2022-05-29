import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        product TEXT,
        barcode TEXT,
        status BOOL
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'beta_shopssss.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(
      String product, String barcode, bool status) async {
    final db = await SQLHelper.db();

    final data = {'product': product, 'barcode': barcode, 'status': status};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(int id, String product) async {
    final db = await SQLHelper.db();

    final data = {
      'product': product,
    };

    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Update status
  static Future<int> updateStatus(String id, bool status) async {
    final db = await SQLHelper.db();

    final data = {
      'status': status,
    };

    final result =
        await db.update('items', data, where: "barcode = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}

// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/services.dart';
// import 'package:main/db/data_base.dart';
// import 'package:path/path.dart';
// import 'dart:async';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// class DatabaseHelper {
//   static final DatabaseHelper _instance = new DatabaseHelper.internal();
//   factory DatabaseHelper() => _instance;
//   static Database _db;
//   Future<Database> get db async {
//     if (_db != null) {
//       return _db;
//     }
//     _db = await initDb();
//     return _db;
//   }
//   DatabaseHelper.internal();
//   initDb() async {
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, "data_flutter.db");
    
//     // Only copy if the database doesn't exist
//     //if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
//       // Load database from asset and copy
//       ByteData data = await rootBundle.load(join('data', 'flutter.db'));
//       List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//       // Save copied asset to documents
//       await new File(path).writeAsBytes(bytes);
//     //}
//     var ourDb = await openDatabase(path);
//     return ourDb;
//   }
// }



// // final String tableNotes = 'shopping';

// // class NoteFields {
// //   static final List<String> values = [
// //     /// Add all fields
// //     id, quantity, product, scans
// //   ];

// //   static final String id = '_id';
// //   static final String quantity = 'quantity';
// //   static final String scans = 'scans';
// //   static final String product = 'title';
// //   // static final String time = 'time';
// // }

// // class Note {
// //   final int? id;
// //   final int quantity;
// //   final String product;
// //   final int scans;

// //   // final DateTime createdTime;

// //   const Note({
// //     this.id,
// //     required this.quantity,
// //     required this.product,
// //     required this.scans,
    
// //     // required this.createdTime,
    
// //   });

// //   Note copy({
// //     int? id,
// //     int? quantity,
// //     int? scans,
// //     String? product,
// //     DateTime? createdTime,
// //   }) =>
// //       Note(
// //         id: id ?? this.id,
// //         quantity: quantity ?? this.quantity,
// //         scans: scans ?? this.scans,
// //         product: product ?? this.product,
// //         // createdTime: createdTime ?? this.createdTime,
// //       );

// //   static Note fromJson(Map<String, Object?> json) => Note(
// //         id: json[NoteFields.id] as int?,
// //         quantity: json[NoteFields.quantity] as int,
// //         scans: json[NoteFields.scans] as int,
// //         product: json[NoteFields.product] as String,
// //         // createdTime: DateTime.parse(json[NoteFields.time] as String),
// //       );

// //   Map<String, Object?> toJson() => {
// //         NoteFields.id: id,
// //         NoteFields.product: product,
// //         NoteFields.quantity: quantity,
// //         NoteFields.scans: scans,
// //         // NoteFields.time: createdTime.toIso8601String(),
// //       };
// // }