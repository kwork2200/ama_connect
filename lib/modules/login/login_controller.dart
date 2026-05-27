import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxString phoneNumberError = ''.obs;

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  bool validatePhoneNumber() {
    final phone = phoneController.text.trim();
    
    if (phone.isEmpty) {
      phoneNumberError.value = 'Phone number is required';
      return false;
    }
    
    if (phone.length < 10) {
      phoneNumberError.value = 'Please enter a valid phone number';
      return false;
    }
    
    phoneNumberError.value = '';
    return true;
  }

  void onContinue() {
    // if (validatePhoneNumber()) {
      isLoading.value = true;
      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
        Get.snackbar('Success', 'OTP sent to your phone number');
        Get.toNamed('/otpVerification');

      });
    // }
  }

  void onCreateAccount() {
    Get.toNamed('/createAccount');
  }

  void onContinueAsGuest() {
    Get.offNamed('/home');
    Get.snackbar('Info', 'Continuing as guest');
  }
}
