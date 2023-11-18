import 'package:dictionary/Presentation/Shared/component.dart';
import 'package:sqflite/sqflite.dart';
import '../Local_DB/Data_Base.dart';
class LocalServices{

final sqlDb =SqlDB();

///get all Todo records:
Future<List<Map<String, dynamic>>> getDictionary({required String sendYourAlphabet}) async {
  print("Future<List<Map<String, dynamic>>> getDictionary ==>$sendYourAlphabet ");
  print('\nget 01==>Local Services\n');
  final Database? db = await sqlDb.db;
  return await db!.rawQuery(
    """
        SELECT "word" FROM $tableName
    WHERE "abjds" = ?
    ORDER BY RANDOM()
    LIMIT 20;
    """,
    [sendYourAlphabet],
  );
}
}