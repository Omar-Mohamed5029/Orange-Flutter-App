
import 'dart:io';
import 'package:orange_ws/data/models/notes_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  DatabaseHelper._privatConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privatConstructor();

  static Database? _database;
  Future<Database> get database async => _database  = await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes(
          id INTEGER PRIMARY KEY,
          title TEXT ,
          description TEXT
      )
      ''');
  }
  Future<List<NotesModel>> getNotes() async {
    Database db = await instance.database;
    var notes = await db.query('notes');
    List<NotesModel> NotesList = notes.isNotEmpty
        ? notes.map((c) => NotesModel.fromMap(c)).toList()
        : [];
    return NotesList;
  }
  Future<int> add(NotesModel note) async {
    Database db = await instance.database;
    return await db.insert('notes', note.toMap());
  }
}