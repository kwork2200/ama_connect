import 'package:ama_connect/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'create_account_controller.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brown,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Center(
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.r),
                  ),
                  child: Image.asset(
                    "assets/images/logo-removebg-preview.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Legal assistance is just a step away.',
                style: TextStyle(color: Colors.grey[100], fontSize: 15.sp),
              ),
              SizedBox(height: 20.h),
              Text(
                'Enter your Full Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: controller.nameController,
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16.sp,
                  ),
                  filled: true,
                  fillColor: AppColors.darkBrown,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: AppColors.white,
                      width: 2.w,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                onChanged: controller.onNameChanged,
              ),
              Obx(
                () => controller.nameError.value.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          controller.nameError.value,
                          style: TextStyle(color: Colors.red, fontSize: 12.sp),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              
              SizedBox(height: 20.h),
              Text(
                'Enter your Email ID',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
                decoration: InputDecoration(
                  hintText: 'Email ID',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16.sp,
                  ),
                  filled: true,
                  fillColor: AppColors.darkBrown,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: AppColors.white,
                      width: 2.w,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                onChanged: controller.onEmailChanged,
              ),
              Obx(
                () => controller.emailError.value.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          controller.emailError.value,
                          style: TextStyle(color: Colors.red, fontSize: 12.sp),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              
              SizedBox(height: 20.h),
              Text(
                'Enter your Phone number',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
                decoration: InputDecoration(
                  hintText: 'Phone number',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16.sp,
                  ),
                  filled: true,
                  fillColor: AppColors.darkBrown,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: AppColors.white,
                      width: 2.w,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  )
                ),
                onChanged: controller.onPhoneChanged,
              ),
              Obx(
                () => controller.phoneError.value.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          controller.phoneError.value,
                          style: TextStyle(color: Colors.red, fontSize: 12.sp),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              SizedBox(height: 20.h),
              Text(
                'Select your State',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedState.value.isEmpty
                      ? null
                      : controller.selectedState.value,
                  decoration: InputDecoration(
                    hintText: 'Select your State',
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16.sp,
                    ),
                    filled: true,
                    fillColor: AppColors.darkBrown,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: AppColors.white,
                        width: 2.w,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide:  BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  dropdownColor: AppColors.darkBrown,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.grey[400]),
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  items: controller.states.map((String state) {
                    return DropdownMenuItem<String>(
                      value: state,
                      child: Text(state),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.onStateChanged(newValue);
                    }
                  },
                ),
              ),
              Obx(
                () => controller.stateError.value.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          controller.stateError.value,
                          style: TextStyle(color: Colors.red, fontSize: 12.sp),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tell us about your legal concern',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '(Optional)',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: controller.legalConcernController,
                maxLines: 3,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
                decoration: InputDecoration(
                  hintText: 'Tell us about your legal concern',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16.sp,
                  ),
                  filled: true,
                  fillColor: AppColors.darkBrown,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: AppColors.white,
                      width: 2.w,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'How did you hear about this?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedReferral.value.isEmpty
                      ? null
                      : controller.selectedReferral.value,
                  decoration: InputDecoration(
                    hintText: 'How did you hear about this?',
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16.sp,
                    ),
                    filled: true,
                    fillColor: AppColors.darkBrown,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: AppColors.white,
                        width: 2.w,
                      ),
                    ),
                  ),
                  dropdownColor: AppColors.darkBrown,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.grey[400]),
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  items: controller.referralOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.onReferralChanged(newValue);
                    }
                  },
                ),
              ),

              SizedBox(height: 30.h),
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.onCreateAccount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellow,
                      foregroundColor: AppColors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      disabledBackgroundColor: Colors.grey[600],
                    ),
                    child: controller.isLoading.value
                        ? SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.w,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.black,
                              ),
                            ),
                          )
                        : Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              Center(
                child: GestureDetector(
                  onTap: controller.onLogin,
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 14.sp,
                      ),
                      children: [
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                            color: AppColors.yellow,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h),
              Center(
                child: SizedBox(
                  height: 50.h,
                  child: OutlinedButton(
                    onPressed: controller.onContinueAsGuest,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.guestButton,
                      side: BorderSide(color: AppColors.guestButton),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: Text(
                      'Continue as Guest',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
