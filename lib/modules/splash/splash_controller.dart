import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  RxDouble progress = 1.0.obs; // Start at 1%
  RxBool privacyPolicyAccepted = false.obs;
  RxBool termsAccepted = false.obs;
  RxBool showPolicyBottomSheet = false.obs;

  bool get canContinue => privacyPolicyAccepted.value && termsAccepted.value;

  @override
  void onInit() {
    super.onInit();

    print('🚀 SplashController: Starting splash screen');

    _startProgressAnimation();
  }

  void _startProgressAnimation() async {
    print('� Starting progress animation from 1% to 100%');

    for (int i = 1; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 30));
      progress.value = i.toDouble();

      if (i == 100) {
        print('✅ Progress complete! Navigating to onboarding...');
        _navigateToOnboarding();
      }
    }
  }

  void _navigateToOnboarding() async {
    _showAppOpenAdAndNavigate();
  }

  void _showAppOpenAdAndNavigate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
    showPolicyBottomSheet.value = true;
    } else {
      Get.offNamed('/home');
    }
  }

  void togglePrivacyPolicy(bool? value) {
    privacyPolicyAccepted.value = value ?? false;
  }

  void toggleTerms(bool? value) {
    termsAccepted.value = value ?? false;
  }

  void onContinue() {
    if (canContinue) {
      _markFirstTimeComplete();
      showPolicyBottomSheet.value = false;
      Get.offNamed('/login');
    }
  }

  void _markFirstTimeComplete() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
  }

  void openPrivacyPolicy() {
    Get.toNamed('/privacy_policy');
  }

  void openTermsAndConditions() {
    Get.toNamed('/terms_conditions');
  }

}
