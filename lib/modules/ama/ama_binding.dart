import 'package:get/get.dart';
import 'ama_controller.dart';

class AmaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AmaController());
  }
}
