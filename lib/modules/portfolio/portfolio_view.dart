import 'package:ama_connect/modules/portfolio/portfolio_contoller.dart';
import 'package:ama_connect/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioView extends GetView<PortfolioController> {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: isDark
                            ? const [
                          Color(0xFF141414),
                          Color(0xFF141414),
                          // Color(0xFF171717),
                        ]
                            : const [
                          Color(0xFFFFD700),
                          Color(0xFFFFF8E1),
                          Color(0xFFFFFFFF),
                        ],
                        stops: isDark
                            ? const [0.0, 1.0]
                            : const [0.0, 0.42, 0.50],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    _buildHeader(isDark),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          Text(
                            'Personal Information',
                            style: GoogleFonts.outfit(
                              color: AppColors.primaryBlue,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          _buildInfoField(
                            'Name',
                            controller.name.value,
                            isDark,
                            controller.isEditing.value,
                            (value) => controller.name.value = value,
                          ),
                          SizedBox(height: 16.h),
                          _buildInfoField(
                            'Email',
                            controller.email.value,
                            isDark,
                            controller.isEditing.value,
                            (value) => controller.email.value = value,
                          ),
                          SizedBox(height: 16.h),
                          _buildInfoField(
                            'Phone',
                            controller.phone.value,
                            isDark,
                            controller.isEditing.value,
                            (value) => controller.phone.value = value,
                          ),
                          SizedBox(height: 16.h),
                          _buildInfoField(
                            'State',
                            controller.state.value,
                            isDark,
                            controller.isEditing.value,
                            (value) => controller.state.value = value,
                          ),
                          SizedBox(height: 30.h),
                          Obx(() => controller.isEditing.value
                                ? Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () => controller.toggleEdit(),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF303030),
                                      foregroundColor: AppColors.white,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                        vertical: 12.h,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    child: Text(
                                      'Cancel',
                                      style: GoogleFonts.outfit(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () => controller.saveChanges(),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.blueButtonColor,
                                      foregroundColor: AppColors.white,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                        vertical: 12.h
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    child: Text(
                                      'Update',
                                      style: GoogleFonts.outfit(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                                : SizedBox(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
    });
  }
  Widget _buildHeader(isDark) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
            size: 20.sp,
          ),
          onPressed: () => Get.back(),
        ),
        SizedBox(width: 20.w),
        Text(
          'Portfolio',
          style: GoogleFonts.outfit(
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Obx(() => IconButton(
          icon: Icon(
            controller.isEditing.value ? Icons.close : Icons.edit,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
            size: 25.sp,
          ),
          onPressed: () => controller.toggleEdit(),
        )),
      ],
    );
  }
  Widget _buildInfoField(
    String label,
    String value,
    bool isDark,
    bool isEditing,
    Function(String) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            color: isDark ? AppColors.white : AppColors.textPrimaryLight,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color:  isDark ? AppColors.primaryGreen:Color(0xFFd49f3f).withOpacity(0.5),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: isEditing
              ? TextField(
                  onChanged: onChanged,
                  style: GoogleFonts.outfit(
                    color: isDark
                        ? AppColors.white
                        : AppColors.textPrimaryLight,
                    fontSize: 16.sp,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  controller: TextEditingController(text: value),
                )
              : Text(
                  value,
                  style: GoogleFonts.outfit(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                    fontSize: 16.sp,
                  ),
                ),
        ),
      ],
    );
  }
}
