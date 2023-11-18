
import '../Local_Services/Local_Services.dart';

class KidsRepository{

  final LocalServices localDb =LocalServices();
  ///get
  Future<List<dynamic>>getAllDictionary({required String sendYourAlphabet })async {
    List<Map<String, dynamic>> value =await localDb.getDictionary(sendYourAlphabet: sendYourAlphabet) ;
    print("\n\nFuture<List<dynamic>>getAllDictionary ==> $value \n\n");
      return value;
  }
}