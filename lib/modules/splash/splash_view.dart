import 'package:ama_connect/core/theme/app_colors.dart';
import 'package:ama_connect/widgets/policy_acceptance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../theme/theme_controller.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final isDark = themeController.themeMode == ThemeMode.dark ||
        (themeController.themeMode == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 80.h),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 90.h),
                      TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 800),
                        tween: Tween(begin: 0.0, end: 1.0),
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 200.w,
                                  height: 200.h,
                                  // decoration: BoxDecoration(
                                  //   gradient: const LinearGradient(
                                  //     colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                                  //     begin: Alignment.topLeft,
                                  //     end: Alignment.bottomRight,
                                  //   ),
                                  //   borderRadius: BorderRadius.circular(12.r),
                                  // ),
                                  child: Image.asset("assets/images/logo.jpg"

                                  ),
                                  // child: Center(
                                  //   child: Text(
                                  //     'AMA',
                                  //     style: TextStyle(
                                  //       color: Colors.black,
                                  //       fontSize: 18.sp,
                                  //       fontWeight: FontWeight.bold,
                                  //     ),
                                  //   ),
                                  // ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Spacer(),
                      TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 1200),
                        tween: Tween(begin: 0.0, end: 1.0),
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Get ',
                                    style: TextStyle(
                                      color:   isDark ? AppColors.backgroundLight   :AppColors.backgroundDark,
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Legally Insured',
                                    style: TextStyle(
                                      color: const Color(0xFFFFD700),
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
            Obx(() => controller.showPolicyBottomSheet.value
                ? Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: PolicyAcceptanceWidget(
                privacyPolicyAccepted: controller.privacyPolicyAccepted.value,
                termsAccepted: controller.termsAccepted.value,
                togglePrivacyPolicy: controller.togglePrivacyPolicy,
                toggleTerms: controller.toggleTerms,
                onContinue: controller.onContinue,
                openPrivacyPolicy: controller.openPrivacyPolicy,
                openTermsAndConditions: controller.openTermsAndConditions,
                isDark: isDark,
              ),
            )
                : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
