
import 'dart:async';
import 'dart:io' as io;
import 'package:cs606_sec2/model/Owner.dart';
import 'package:cs606_sec2/model/PetRecord.dart';
import 'package:cs606_sec2/model/Purchase.dart';
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
    String path = join(documentsDirectory.path, "pets2.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name PetRecord with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE PetRecord(id INTEGER PRIMARY KEY, petName TEXT, petAge BIGINT)");
    print("Created tables");
    await db.execute(
        "CREATE TABLE Owner(id INTEGER PRIMARY KEY, ownerName TEXT)");
    await db.execute(
        "CREATE TABLE Purchase(transactionId INTEGER PRIMARY KEY, owner_id BIGINT, petrecord_id BIGINT, FOREIGN KEY (owner_id) REFERENCES Owner(id), FOREIGN KEY (petrecord_id) REFERENCES PetRecord(id))");
    print("Created tables");
  }

  // Retrieving pet record from PetRecord Tables
  Future<List<PetRecord>> getPetRecords() async {
    var dbClient = await db;  // Get the singleton database
    List<Map> list = await dbClient.rawQuery('SELECT * FROM PetRecord');
    List<PetRecord> petRecords = [];
    for (int i = 0; i < list.length; i++) {
      Map entry = list[i];
      petRecords.add(new PetRecord(entry["id"], entry["petName"], entry["petAge"]));
    }
    print(petRecords.length);
    return petRecords;
  }
  // Retrieving pet record from PetRecord Tables
  Future<List<Owner>> getOwners() async {
    var dbClient = await db;  // Get the singleton database
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Owner');
    List<Owner> owners = [];
    for (int i = 0; i < list.length; i++) {
      Map entry = list[i];
      owners.add(new Owner(entry["ownerName"], entry["id"]));
    }
    print(owners.length);
    return owners;
  }

  // Retrieving pet record from PetRecord Tables
  Future<List<Purchase>> getPurchases() async {
    var dbClient = await db;  // Get the singleton database
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Purchase');
    // List<Purchase> purchases = [];
    for (int i = 0; i < list.length; i++) {
      Map entry = list[i];
      print(entry["transactionId"].toString() + ":" +  entry["petrecord_id"].toString() + " owned by " +
          entry["owner_id"].toString());
    }
    // print(owners.length);
    return null;
  }

  void savePetRecord(PetRecord petRecord) async {
    var dbClient = await db; // Get the singleton database
    await dbClient.transaction((txn) async {
      String dbQuery = 'INSERT INTO PetRecord(id, petName, petAge) VALUES(' +
          '\'' +
          petRecord.id.toString() +
          '\',\'' +
          petRecord.petName +
          '\',\'' +
          petRecord.petAge.toString() +
          '\'' +
          ')';
      return await txn.rawInsert(dbQuery);
    });
  }
  void saveOwner(Owner owner) async {
    var dbClient = await db; // Get the singleton database
    await dbClient.transaction((txn) async {
      String dbQuery = 'INSERT INTO Owner(id, ownerName) VALUES(' +
          '\'' +
          owner.id.toString() +
          '\',\'' +
          owner.name +
          '\'' +
          ')';
      return await txn.rawInsert(dbQuery);
    });
  }
  void savePurchase(Purchase purchase) async {
    var dbClient = await db; // Get the singleton database
    await dbClient.transaction((txn) async {
      String dbQuery = 'INSERT INTO Purchase(transactionId, owner_id, petrecord_id) VALUES(' +
          '\'' +
          purchase.transactionId.toString()+
          '\',\'' +
          purchase.owner.id.toString() +
          '\',\'' +
          purchase.petRecord.id.toString() +
          '\'' +
          ')';
      return await txn.rawInsert(dbQuery);
    });
  }


  // Retrieve all pets purchased by owner
  Future<List<PetRecord>> getOwnerPets(int ownerId) async {
    var dbClient = await db;  // Get the singleton database

    List<Map> list = await dbClient.rawQuery(
        'SELECT * FROM ' +
            'PetRecord JOIN Purchase ' +
            'ON PetRecord.id = Purchase.petrecord_id '+
            'WHERE owner_id = ' + ownerId.toString());

    List<PetRecord> petRecords = [];
    for (int i = 0; i < list.length; i++) {
      Map entry = list[i];
      petRecords.add(new PetRecord(entry["id"], entry["petName"], entry["petAge"]));
    }
    print(petRecords.length);
    return petRecords;
  }

}