import 'package:ama_connect/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'payment_billing_controller.dart';

class PaymentBillingView extends GetView<PaymentBillingController> {
  const PaymentBillingView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
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
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(isDark),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            color:   isDark ? AppColors.darkBrown :Color(0xFFd49f3f).withOpacity(0.5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 20.h),
                              Container(
                                padding: EdgeInsets.all(3.w),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Image.network(
                                  'https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=${controller.upiId}',
                                  width: 150.w,
                                  height: 150.w,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return SizedBox(
                                      width: 200.w,
                                      height: 200.w,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryBlue,
                                        ),
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return SizedBox(
                                      width: 200.w,
                                      height: 200.w,
                                      child: Center(
                                        child: Icon(
                                          Icons.qr_code_2,
                                          size: 100.w,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Account Details:-',
                                  style: GoogleFonts.outfit(
                                    color: isDark
                                        ? AppColors.white
                                        : AppColors.textPrimaryLight,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDetailRow(
                                    'Bank Name:',
                                    controller.bankName,
                                    isDark,
                                  ),
                                  SizedBox(height: 6.h),
                                  _buildDetailRow(
                                    'A/C Name:',
                                    controller.accountName,
                                    isDark,
                                  ),
                                  SizedBox(height: 6.h),
                                  _buildDetailRow(
                                    'A/C No.:',
                                    controller.accountNumber,
                                    isDark,
                                  ),
                                  SizedBox(height: 6.h),
                                  _buildDetailRow(
                                    'IFSC Code:',
                                    controller.ifscCode,
                                    isDark,
                                  ),
                                  SizedBox(height: 6.h),
                                  _buildDetailRow('UPI ID:', controller.upiId, isDark),
                                ],
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          'For payment-related queries, contact us at',
                          style: GoogleFonts.outfit(
                            color: isDark
                                ? AppColors.white
                                : AppColors.textPrimaryLight,
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          controller.contactEmail,
                          style: GoogleFonts.outfit(
                            color: Color(0xFFd49f3f),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.yellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
          'Payment & Billing',
          style: GoogleFonts.outfit(
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );
  }
  Widget _buildDetailRow(String label, String value, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100.w,
          child: Text(
            label,
            style: GoogleFonts.outfit(
              color: isDark ? AppColors.white : AppColors.textPrimaryLight,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.outfit(
              color: isDark ? AppColors.white : AppColors.textPrimaryLight,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
