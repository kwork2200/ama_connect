import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AskAmaController extends GetxController {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  
  final RxString selectedCategory = ''.obs;
  final RxBool isSubmitting = false.obs;
  
  final categories = [
    'Banking & Finance',
    'Criminal Law',
    'Corporate Law',
    'Family Law',
    'Property Law',
    'Intellectual Property',
    'Labor Law',
    'Consumer Protection',
    'Other',
  ];
  
  void selectCategory(String category) {
    selectedCategory.value = category;
    categoryController.text = category;
  }
  
  Future<void> submitQuestion() async {
    if (questionController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter your question');
      return;
    }
    
    if (selectedCategory.value.isEmpty) {
      Get.snackbar('Error', 'Please select a category');
      return;
    }
    
    isSubmitting.value = true;
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    isSubmitting.value = false;
    
    // Clear form
    questionController.clear();
    categoryController.clear();
    descriptionController.clear();
    selectedCategory.value = '';
    
    Get.snackbar('Success', 'Your question has been submitted successfully!');
    Get.back();
  }
  
  @override
  void onClose() {
    questionController.dispose();
    categoryController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
