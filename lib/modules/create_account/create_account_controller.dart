import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController legalConcernController = TextEditingController();
  
  final RxString selectedState = ''.obs;
  final RxString selectedReferral = ''.obs;
  final RxBool isLoading = false.obs;
  
  final RxString nameError = ''.obs;
  final RxString emailError = ''.obs;
  final RxString phoneError = ''.obs;
  final RxString stateError = ''.obs;

  final List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];

  final List<String> referralOptions = [
    'Social Media',
    'Friend/Family',
    'Search Engine',
    'Advertisement',
    'Lawyer Recommendation',
    'Other',
  ];

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    legalConcernController.dispose();
    super.onClose();
  }

  bool validateForm() {
    bool isValid = true;
    
    // Validate name
    final name = nameController.text.trim();
    if (name.isEmpty) {
      nameError.value = 'Full name is required';
      isValid = false;
    } else {
      nameError.value = '';
    }
    
    // Validate email
    final email = emailController.text.trim();
    if (email.isEmpty) {
      emailError.value = 'Email ID is required';
      isValid = false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Please enter a valid email ID';
      isValid = false;
    } else {
      emailError.value = '';
    }
    
    // Validate phone
    final phone = phoneController.text.trim();
    if (phone.isEmpty) {
      phoneError.value = 'Phone number is required';
      isValid = false;
    } else if (phone.length < 10) {
      phoneError.value = 'Please enter a valid phone number';
      isValid = false;
    } else {
      phoneError.value = '';
    }
    
    // Validate state
    if (selectedState.value.isEmpty) {
      stateError.value = 'Please select your state';
      isValid = false;
    } else {
      stateError.value = '';
    }
    
    return isValid;
  }

  void onCreateAccount() {
    if (validateForm()) {
      isLoading.value = true;
      
      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
        Get.snackbar('Success', 'Account created successfully!');
        Get.offNamed('/home');
      });
    }
  }

  void onLogin() {
    Get.back();
    // Get.offNamed('/login');
  }

  void onContinueAsGuest() {
    Get.offNamed('/home');
  }
  

  void onNameChanged(String value) {
    nameError.value = '';
  }

  void onEmailChanged(String value) {
    emailError.value = '';
  }

  void onPhoneChanged(String value) {
    phoneError.value = '';
  }

  void onStateChanged(String value) {
    selectedState.value = value;
    stateError.value = '';
  }

  void onReferralChanged(String value) {
    selectedReferral.value = value;
  }
}
