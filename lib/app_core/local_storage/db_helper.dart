import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shorten/view/history/model/history_model.dart';
import 'package:sqflite/sqflite.dart';

//we use the factory keyword when implementing a constructor that doesn’t always create a new instance of its class

class DbHistory {
  final String tblUrlHistory = 'history';
  final String clmnId = 'id';
  final String clmnShortUrl = 'shortUrl';
  final String clmnLongUrl = 'longUrl';

  //created private constructor that can only be accessed in DbHelper Class
  DbHistory._privateConstructor();

  static final DbHistory dbInstance = DbHistory._privateConstructor();

  factory DbHistory() => dbInstance;

  //create the database object and its getter
  Database? _db;

  Future<Database?> get db async {
    //if the database exists return it and if it's not yet created call initDb() for initializing the database
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    //reference the path on the device where the database file will be saved
    Directory dbDirectory = await getApplicationDocumentsDirectory();
    //provide the full path to the databse on the device and the db name
    String dbPath = join(dbDirectory.path, 'shorten.db');
    //return the database
    return await openDatabase(dbPath, version: 1, onCreate: createDb);
  }

  createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tblUrlHistory($clmnId INTEGER PRIMARY KEY, $clmnShortUrl TEXT , $clmnLongUrl TEXT)");
  }

  Future<int> addUrl(String? shortUrl, String? longUrl) async {
    var dbClient = await db;

    await dbClient!.rawInsert(
        "INSERT INTO $tblUrlHistory($clmnShortUrl,$clmnLongUrl) VALUES ('$shortUrl','$longUrl')");
    return 1;
  }
  Future<List<HistoryLocalModel>> getHistoryList() async {
    var dbClient = await db;
    Iterable itemList = await dbClient!.rawQuery('SELECT * FROM $tblUrlHistory');
    List<HistoryLocalModel> returnList = [];
    for (var element in itemList) {


      returnList.add( HistoryLocalModel(
        element[clmnId],
        element[clmnShortUrl],
        element[clmnLongUrl],
      ));
    }
    print(returnList.toString());
    return returnList;
  }
  Future<int> delete(int id) async {
    var dbClient = await db;     // replacd with database instance

    return await dbClient!.delete(
      tblUrlHistory,     // replace with table name
      where: "id = ?",
      whereArgs: [id],   // you need the id
    );
  }
}
