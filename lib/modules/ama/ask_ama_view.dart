import 'package:ama_connect/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../theme/theme_controller.dart';
import 'ask_ama_controller.dart';

class AskAmaView extends GetView<AskAmaController> {
  const AskAmaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final isDark =
            themeController.themeMode == ThemeMode.dark ||
                (themeController.themeMode == ThemeMode.system &&
                    MediaQuery.of(context).platformBrightness == Brightness.dark);

        return Scaffold(
          backgroundColor: isDark ? const Color(0xFF0F0F0F) : Colors.white,
          appBar: _buildAppBar(isDark),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(isDark),
                SizedBox(height: 30.h),
                _buildQuestionField(isDark),
                SizedBox(height: 20.h),
                _buildSubmitButton(isDark),
              ],
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(bool isDark) {
    return AppBar(
      backgroundColor: isDark ? const Color(0xFF1A1A1A) : const Color(0xFFFFD700),
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: isDark ? Colors.white : Colors.black,
            size: 20.sp,
          ),
        ),
      ),
      leadingWidth: 36.w,
      titleSpacing: 4.w,
      title: Text(
        'Ask a Question',
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Center(
          child: Text(
            'If you have any inquires, get in\n               touch with Us ',
            style: TextStyle(
              color: isDark ? Colors.grey[400] : Colors.grey[600],
              fontSize: 14.sp,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionField(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Question ',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 190.h,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1d1c18) : const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: TextField(
            controller: controller.questionController,
            maxLines: 3,
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 14.sp,
            ),
            decoration: InputDecoration(
              hintText: 'Type your legal question here...',
              hintStyle: TextStyle(
                color: isDark ? Colors.grey[500] : Colors.grey[400],
                fontSize: 14.sp,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16.w),
            ),
          ),
        ),
      ],
    );
  }



  Widget _buildSubmitButton(bool isDark) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: 50.h,
        child: ElevatedButton(
          onPressed: controller.isSubmitting.value ? null : controller.submitQuestion,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFd29f2a),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
            elevation: 0,
          ),
          child: controller.isSubmitting.value
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'Submitting...',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              : Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.backgroundDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
