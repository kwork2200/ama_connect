import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../../core/theme/app_string.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxString searchQuery = ''.obs;
  RxBool isSearching = false.obs;
  final selectedTabIndex = 0.obs;
  RxSet<String> selectedCategories = <String>{}.obs;
  RxBool showBannerAd = true.obs;

  RxBool isBannerAdLoaded = false.obs;

  RxBool isInterstitialAdLoaded = false.obs;

  final PageController bannerController = PageController();
  final RxInt currentBannerPage = 0.obs;
  final RxBool showAllLocations = false.obs;
  Timer? bannerTimer;

  late final ScrollController orgRow1Controller;
  late final ScrollController orgRow2Controller;

  @override
  void onInit() {
    super.onInit();
    _initializeScrollControllers();
    _startAutoScroll();
    _startBannerAutoScroll();
  }

  void _initializeScrollControllers() {
    orgRow1Controller = ScrollController();
    orgRow2Controller = ScrollController();
  }

  void _startAutoScroll() {
    Future.delayed(Duration(seconds: 2), () {
      _autoScrollRow(orgRow1Controller, scrollLeft: true);
    });

    Future.delayed( Duration(seconds: 3), () {
      _autoScrollRow(orgRow2Controller, scrollLeft: false);
    });
  }

  void _autoScrollRow(ScrollController controller, {bool scrollLeft = true}) {
    if (!controller.hasClients) return;

    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (!controller.hasClients) {

        timer.cancel();
        return;
      }

      final maxScroll = controller.position.maxScrollExtent;
      final currentScroll = controller.offset;

      if (scrollLeft) {
        if (currentScroll >= maxScroll) {
          controller.jumpTo(0);
        } else {
          controller.animateTo(
            currentScroll + 2.0,
            duration: const Duration(milliseconds: 30),
            curve: Curves.linear,
          );
        }
      } else {
        if (currentScroll <= 0) {
          controller.jumpTo(maxScroll);
        } else {
          controller.animateTo(
            currentScroll - 2.0,
            duration: const Duration(milliseconds: 30),
            curve: Curves.linear,
          );
        }
      }
    });
  }

  void _startBannerAutoScroll() {
    bannerTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (bannerController.hasClients) {
        final nextPage = (currentBannerPage.value + 1) % 3;
        bannerController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void onClose() {
    bannerTimer?.cancel();
    bannerController.dispose();
    orgRow1Controller.dispose();
    orgRow2Controller.dispose();
    super.onClose();
  }



}