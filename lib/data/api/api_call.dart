import 'package:dio/dio.dart';
import 'package:eta/config/constants.dart';
import 'package:eta/data/models/word.dart';

import 'logging.dart';

class ApiCall{

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());

  Future<Word> getWord({required String date, required String apiKey}) async {
    Word? word;

    try {
      Response wordData = await _dio.get(baseUrl, queryParameters: {
        '?date=':date,
        '&api_key=':apiKey
      });

      print('User Info: ${wordData.data}');

      word = Word.fromJson(wordData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }

    return word!;
  }


}