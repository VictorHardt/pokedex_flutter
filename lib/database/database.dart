import 'package:path/path.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
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
  await db.execute("PRAGMA foreign_keys=ON");
  }

  Future<void> inserirCustomPokemon(Pokemon pokemon) async {
    try {
      final db = await instance.database;
      var pokeomnMap = pokemon.toMap();

      await db.insert(
        'customPokemon',
        pokeomnMap,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Erro" + e.toString());
    }
  }

  Future<List<Pokemon>> getAllCustomPokemons() async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps =
        await db.rawQuery('SELECT * FROM customPokemon');

    List<Pokemon> retData = [];
    for (var m in maps) {
      retData.add(Pokemon.fromBD(m));
    }

    return retData;
  }
}