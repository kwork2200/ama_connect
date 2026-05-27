import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountRequestController extends GetxController {
  final TextEditingController reasonController = TextEditingController();
  final RxBool isSubmitting = false.obs;

  void submitDeleteRequest() async {
    String reason = reasonController.text.trim();
    
    if (reason.isEmpty) {
      Get.snackbar(
        'Error',
        'Please provide a reason for deleting your account',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    isSubmitting.value = true;

    try {
      await Future.delayed(const Duration(seconds: 2));
      
      Get.snackbar(
        'Request Submitted',
        'Your account deletion request has been submitted successfully. We will process it within 48 hours.',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
      );
      
       reasonController.clear();
      
      Get.back();
      
    } catch (error) {
      Get.snackbar(
        'Error',
        'Failed to submit request. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isSubmitting.value = false;
    }
  }

  @override
  void onClose() {
    reasonController.dispose();
    super.onClose();
  }
}
