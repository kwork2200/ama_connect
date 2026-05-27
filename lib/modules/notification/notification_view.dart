import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';
import 'notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBrown2,
      appBar: AppBar(
        backgroundColor: AppColors.darkBrown2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        children: [
          _buildNotificationSection('Today', [
            _buildNotificationItem(
              'Greetings! Legal Reminder',
              'Consumer complaints can be filed online. Use technology to defend your rights!',
              '07/05/2026', '10:00 AM',
            ),
          ]),
          SizedBox(height: 20.h),
          _buildNotificationSection('Yesterday', [
            _buildNotificationItem(
              'Hello! Did You Know?',
              'E-commerce returns are your right. Familiarize yourself with return policies to shop smart.',
              '06/05/2026', '10:00 AM',
            ),
          ]),
          SizedBox(height: 20.h),
          _buildNotificationSection('Last 7 days', [
            _buildNotificationItem(
              'Ask a Legal Expert!',
              'Curious about your legal rights? Use our AMA section to get expert answers for free!',
              '05/05/2026', '07:00 PM',
            ),
            SizedBox(height: 10.h),
            _buildNotificationItem(
              'Good Day! Legal Knowledge',
              'Stay informed about your legal rights and responsibilities. Knowledge is power!',
              '05/05/2026', '10:00 AM',
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildNotificationSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12.h),
        ...children,
      ],
    );
  }

  Widget _buildNotificationItem(String title, String description, String date, String time) {
    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: AppColors.darkBrown2,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                'AMA',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                            color: AppColors.textSecondaryDark,
                            fontSize: 11.sp,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            color: AppColors.textSecondaryDark,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: TextStyle(
                    color: AppColors.textSecondaryDark,
                    fontSize: 13.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
