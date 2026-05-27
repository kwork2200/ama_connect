import 'package:get/get.dart';
import 'delete_account_policy_controller.dart';

class DeleteAccountPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleteAccountPolicyController>(() => DeleteAccountPolicyController());
  }
}
