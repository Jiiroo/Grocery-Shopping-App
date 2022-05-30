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

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'beta_shopssss.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(
      String product, String barcode, bool status) async {
    final db = await SQLHelper.db();

    final data = {'product': product, 'barcode': barcode, 'status': status};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

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
