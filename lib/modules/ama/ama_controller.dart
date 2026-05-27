import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmaController extends GetxController {
  final RxInt selectedTabIndex = 0.obs;
  
  void onTabChanged(int index) {
    selectedTabIndex.value = index;
  }
}
