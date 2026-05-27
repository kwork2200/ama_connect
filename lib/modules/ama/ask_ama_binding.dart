import 'package:get/get.dart';
import 'ask_ama_controller.dart';

class AskAmaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AskAmaController());
  }
}
