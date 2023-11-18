import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../../Presentation/Shared/component.dart';
//=============================================
class SqlDB{

  static final SqlDB sqlDb =SqlDB();
  Database? _database;

  //get Database
  Future<Database?> get db async{
    if(_database==null) {
      return await initDatabase();
    }
    else{
      return _database;
    }
  }
//initDataBase
Future<Database> initDatabase() async {
    print('initDatabase #01\n');
  // Construct a file path to copy database to
    print('initDatabase #02:$getApplicationDocumentsDirectory\n');

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print('\n documentsDirectory #02 ==> $documentsDirectory');

    String path = join(documentsDirectory.path, "asset_database.db");

    print('path #03 ==> $path');

    // Only copy if the database doesn't exist
  if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
    // Load database from asset and copy
    ByteData data = await rootBundle.load(join('assets', 'kidDB.db'));
    print("rootBundle.load(join('assets', 'kidDB.db'))${rootBundle.load(join('assets', 'kidDB.db'))}");
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    print('rootBundle #04 ==> $data');

    // Save copied asset to documents
    print("File(path).writeAsBytes(bytes)} ${File(path).writeAsBytes(bytes)}");
    await File(path).writeAsBytes(bytes);
  }

  // open copied database
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String databasePath = join(appDocDir.path, 'asset_database.db');
    print('databasePath $databasePath');
  Database myDataBase = await openDatabase(databasePath,onCreate:_onCreate ,version: 1);
    print('myDataBase #04 ==> $myDataBase');

    return myDataBase;
}

  Future<void>_onCreate(Database db,int version)async
  {
    //To Create a Table:
    await db.execute("""
    CREATE TABLE "$tableName"(
    "word_Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "abjds" TEXT,
    "word" TEXT , 
    "definition" TEXT ,
    "english_translation" TEXT,
    "exam" TEXT,
    "story" TEXT,
    "english_exam" TEXT,
    "english_story" TEXT)
    """).then((value)  {
      print('\n\n\n ================Create First Table Success Fully\n\n\n ================');
    }).catchError((onError)
    {
      print('\n\n\n ================ Can not Create Table:${onError.toString()}===========\n\n\n');
    });
  }

}