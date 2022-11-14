import 'dart:async';

import 'package:flutter_application_4/model/todomodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class TodoListRepository {
  Database? _database;
  String tableId = 'todoList';

  Future<Database> get database async {
    if (_database != null) return _database!;

    return await initDB();
  }

  initDB() async {
    String path = join(await getDatabasesPath(), '$tableId.db');

    return await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  FutureOr<void> _onCreate(Database db, int version) {
    print('여기로 들어와?');
    String sql = '''
      CREATE TABLE $tableId(
        no INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT, 
        content TEXT,
        recordDate DATETIME)
      ''';

    // TEXT타입은 Stirng 타입
    // No타입은 int타입

    db.execute(sql);
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {}

  Future<void> createItem({
    String title = 'title',
    String content = 'content',
    String recordDate = 'recordtime',
  }) async {
    var db = await database;

    var insertData = {
      "title": title,
      "content": content,
      "recordDate": recordDate,
    };

    print('insertData $insertData');
    await db.insert(tableId, insertData);
  }

  Future<List<Map<String, Object?>>> getAllData() async {
    var db = await database;
    print('aaaaaa ${await db.rawQuery('SELECT * FROM todoList')}');
    return await db.rawQuery('SELECT * FROM todoList');
  }

  readItem(int id) async {
    final db = await database;
    // var res = await db.rawQuery('SELECT * FROM $tableId WHERE id = ?', [no]);
    var res = await db.query(tableId, where: 'no = ?', whereArgs: [id]);
    print('res $res');
    return res;
  }

  Future<bool> deleteItem(int no) async {
    final db = await database;
    await db.delete(tableId, where: 'no = ?', whereArgs: [no]);
    print('aaaaa ttt  = ${await db.delete(tableId, where: 'no = ?', whereArgs: [
          no
        ])}');
    return true;
  }

  deleteAllItem() async {
    final db = await database;
    await db.rawDelete('DELETE FROM $tableId');
  }

  updateItem({
    int no = 0,
    String title = '',
    String content = '',
  }) async {
    final db = await database;

    // await db.update(tableId, where: 'id', whereArgs: [
    //   title,
    //   content,
    // ]);

    await db.rawUpdate(
        'UPDATE $tableId SET title = ?, content = ? WHERE no = ?',
        [title, content, no]);

    // await db.rawQuery(
    //     'UPDATE $tableId SET content = $content SET title = $title WHERE no = $no');
  }
}
