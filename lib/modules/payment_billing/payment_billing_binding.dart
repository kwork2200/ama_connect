import 'package:get/get.dart';
import 'payment_billing_controller.dart';

class PaymentBillingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentBillingController>(() => PaymentBillingController());
  }
}
