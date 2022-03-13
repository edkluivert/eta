import 'package:eta/data/services/word_api.dart';
import 'package:eta/ui/controller/home_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(HomeController(wordApi: WordApi()), permanent: true);
  }

}