import 'package:eta/config/constants.dart';
import 'package:get/get.dart';

import '../models/word.dart';

class WordApi extends GetConnect{

  // 'https://api.wordnik.com/v4/words.json/wordOfTheDay?date=' +
  // today +
  // '&api_key=' +
  // apiKey;


  Future getWord(String date) async{

    final String urlKey =  'https://api.wordnik.com/v4/words.json/wordOfTheDay?date=' + date + '&api_key=' + apiKey;

    var response = await get(urlKey);
    if(response.status.hasError){
      print('failed');
      return Future.error(response.statusText!);
    }else{
      print(response.body);
      return Word.fromJson(response.body);

    }


  }

}