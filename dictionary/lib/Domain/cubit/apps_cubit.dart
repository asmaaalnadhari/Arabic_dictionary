import 'package:bloc/bloc.dart';
import 'package:dictionary/Data/KidsRepository/Kids_Repository.dart';
import 'package:meta/meta.dart';
part 'apps_state.dart';

class AppsCubit extends Cubit<AppsState> {
  AppsCubit() : super(GetDictionaryInitial());
  final _repository=KidsRepository();
  List<dynamic> words=[];

  void getAllWords({required String sendYourAlphabet})async
  {
    print('-------------------getAllDictionary Start-------------------');

    try{

      words=await _repository.getAllDictionary(sendYourAlphabet: sendYourAlphabet);
      print('\n\n-------------------getAllDictionary words List: $words-------------------\n\n');
      print('\n words before clear $words');
      print('\n words After clear $words');
      // emit(GetDictionaryLoaded(allMyWords: words));

    }
    catch(e){
      print('-------------------getCubitError ${e.toString()}-------------------');
      emit(GetDictionaryFailed());
    }
  }
}
