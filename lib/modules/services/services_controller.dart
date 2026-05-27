import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesController extends GetxController {
  final RxInt currentBannerPage = 0.obs;
  final PageController bannerController = PageController();

  @override
  void onInit() {
    super.onInit();
    _startAutoScroll();
  }

  @override
  void onClose() {
    bannerController.dispose();
    super.onClose();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (bannerController.hasClients) {
        if (currentBannerPage.value < 2) {
          currentBannerPage.value++;
          bannerController.animateToPage(
            currentBannerPage.value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          currentBannerPage.value = 0;
          bannerController.jumpToPage(0);
        }
        _startAutoScroll();
      }
    });
  }
}
