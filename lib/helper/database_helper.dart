import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:todo_list/models/task.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??=await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationSupportDirectory();
    String path = join(documentsDirectory.path, 'tasks.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
        CREATE TABLE tasks (
          id INTEGER PRIMARY KEY,
          title TEXT,
          description TEXT
        )
      '''
    );
  }

  Future<List<Task>> getTasks() async {
    Database db = await instance.database;

    var tasks = await db.query('tasks', orderBy: 'title');
    List<Task> tasksList = tasks.isNotEmpty ? tasks.map((e) => Task.fromMap(e)).toList() : [];

    return tasksList;
  }

  Future<int> addTask(Task tasks) async {
    Database db = await instance.database;
    return await db.insert('tasks', tasks.toMap());
  }
}