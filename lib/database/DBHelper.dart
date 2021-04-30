
import 'dart:async';
import 'dart:io' as io;
import 'package:cs606_sec2/model/PetRecord.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper{

  static Database _db; // singleton pattern

  Future<Database> get db async {
    if(_db != null)
      return _db;

    // Create singleton since it doesn't exist yet.
    _db = await initDb();
    return _db;
  }

  ///Creating a database with name pets.db in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "pets.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  /// Creating a table name PetRecord with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE PetRecord(id INTEGER PRIMARY KEY, petName TEXT, petAge BIGINT )");
    print("Created tables");
  }

  /// Retrieving petRecords from PetRecords Tables
  Future<List<PetRecord>> getPetRecords() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM PetRecord');
    List<PetRecord> petRecords = [];
    for (int i = 0; i < list.length; i++) {
      Map currentRow = list[i];
      petRecords.add(new PetRecord(currentRow["petName"], currentRow["petAge"]));
    }
    print(petRecords.length);
    return petRecords;
  }

  /// Save given pet record to database
  void savePetRecord(PetRecord petRecord) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      String sqlQuery = 'INSERT INTO PetRecord(petName, petAge) VALUES(' +
          '\'' +
          petRecord.petName +
          '\',\'' +
          petRecord.petAge.toString() +
          '\'' +
          ')';

      return await txn.rawInsert(sqlQuery);
    });
  }


}