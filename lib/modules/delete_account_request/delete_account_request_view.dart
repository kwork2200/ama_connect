import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import 'delete_account_request_controller.dart';

class DeleteAccountRequestView extends StatelessWidget {
  const DeleteAccountRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ?Colors.black :Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor:  isDark ? Colors.black : Color(0xFFd49f3f),
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color: isDark ? Colors.white : Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Delete Account Request',
          style: TextStyle(
            color: isDark ? Colors.white:Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<DeleteAccountRequestController>(
        init: DeleteAccountRequestController(),
        builder: (controller) => Padding(
          padding: EdgeInsets.all(20.w),
          child: Center(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: isDark ?const Color(0xFF2A2A2A): Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please provide a reason for deleting your account:',
                    style: TextStyle(
                      color:   isDark ? Colors.white : Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextField(
                    controller: controller.reasonController,
                    maxLines: 4,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Write your reason here...',
                      hintStyle: TextStyle(
                        color:  Colors.grey[500],
                        fontSize: 14.sp,
                      ),
                      filled: true,
                      fillColor: isDark ? Colors.grey[800]?.withOpacity(0.5):Colors.grey[800]?.withOpacity(0.05),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(12.w),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: controller.isSubmitting.value 
                          ? null 
                          : controller.submitDeleteRequest,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark ? AppColors.yellow:Color(0XFFd29f2a).withOpacity(0.9),
                        foregroundColor: Colors.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: controller.isSubmitting.value
                          ? SizedBox(
                              height: 20.h,
                              width: 20.h,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                              ),
                            )
                          : Text(
                              'Submit Request',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
