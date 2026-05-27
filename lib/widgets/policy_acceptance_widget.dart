import 'package:ama_connect/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PolicyAcceptanceWidget extends StatelessWidget {
  final bool privacyPolicyAccepted;
  final bool termsAccepted;
  final Function(bool?) togglePrivacyPolicy;
  final Function(bool?) toggleTerms;
  final VoidCallback onContinue;
  final VoidCallback openPrivacyPolicy;
  final VoidCallback openTermsAndConditions;
  final bool isDark;

  const PolicyAcceptanceWidget({
    super.key,
    required this.privacyPolicyAccepted,
    required this.termsAccepted,
    required this.togglePrivacyPolicy,
    required this.toggleTerms,
    required this.onContinue,
    required this.openPrivacyPolicy,
    required this.openTermsAndConditions,
    required this.isDark,
  });

  bool get canContinue => privacyPolicyAccepted && termsAccepted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Before continuing, please accept our policies',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Checkbox(
                value: privacyPolicyAccepted,
                onChanged: togglePrivacyPolicy,
                activeColor: AppColors.primaryBlue,
                checkColor: AppColors.white,
              ),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: 'I accept ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: openPrivacyPolicy,
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryBlue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: termsAccepted,
                onChanged: toggleTerms,
                activeColor: AppColors.primaryBlue,
                checkColor: AppColors.white,
              ),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: 'I accept ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: openTermsAndConditions,
                          child: Text(
                            'Terms and Conditions',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryBlue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: canContinue ? onContinue : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: canContinue
                    ? AppColors.primaryBlue
                    : AppColors.greyButton,
                foregroundColor: AppColors.black,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
