import 'package:eta/data/services/word_api.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/models/word.dart';

class HomeController extends GetxController with StateMixin<Word>{


  HomeController({required WordApi wordApi}): _wordApi = wordApi;

  final WordApi _wordApi;
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');


  @override
  void onInit() {
    super.onInit();
    String today = formatter.format(now);
    _wordApi.getWord(today).then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });

  }

}