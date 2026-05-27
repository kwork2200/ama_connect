import 'package:get/get.dart';
import 'delete_account_request_controller.dart';

class DeleteAccountRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleteAccountRequestController>(() => DeleteAccountRequestController());
  }
}
