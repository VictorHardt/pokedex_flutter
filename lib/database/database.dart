import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static final DB instance = DB._init();

  static Database? _database;

  DB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('database.db');
    return _database!;
  }

  Future onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path,
        version: 1, onConfigure: onConfigure, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // Necessário para o funcionamento do delete em cascata

    await db.execute('''
CREATE TABLE customPokemon(
            idCustomPokemon INTEGER PRIMARY KEY AUTOINCREMENT,
            name STRING,
            abilities STRING,
            image STRING
          )
''');
  }
}