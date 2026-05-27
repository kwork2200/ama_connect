import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/theme/app_theme.dart';

class DeleteAccountPolicyView extends StatelessWidget {
  const DeleteAccountPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor:  isDark ? Colors.black : Color(0xFFd49f3f),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: isDark ? Colors.white : Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Delete Account Policy',
          style: TextStyle(
            color: isDark ? Colors.white:Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color:  isDark ? Colors.black : Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ama Legal Solutions',
                style: TextStyle(
                  color:   isDark ? Colors.white : Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Delete Account Policy',
                style: TextStyle(
                  color:  isDark ? Colors.grey[600]:  Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Effective Date: November 1, 2025\nLast Updated: November 1, 2025',
                style: TextStyle(
                  color: isDark ? Colors.grey[400]: Colors.black,
                  fontSize: 12.sp,
                  height: 1.4,
                ),
              ),
              _buildSection( isDark,
                'Introduction',
                'At Ama Legal Solutions, we respect your right to privacy and control over your personal data. If you wish to delete your account and associated information, you can request account deletion at any time by following the instructions below.',
              ),
              _buildSection( isDark,
                '1. How to Request Account Deletion',
                'To delete your account, please contact us using one of the following methods:\n\nEmail: notify@amalegalsolutions.com\n\nPhone: +91 8700343611\n\nAddress: 2493AP, Block G, Sushant Lok 2, Sector 57, Gurugram, Haryana 122001\n\nPlease include the following details in your request:\n\n• Your registered full name\n• Your registered email address or phone number\n• A short message stating that you wish to delete your Ama Legal Solutions account\n\nOnce we receive your request, our team will verify your identity for security purposes before proceeding.',
              ),
              _buildSection( isDark,
                '2. Data Deletion Process',
                'After verification:\n\n• Your account and all associated personal data (name, email, phone number, profile picture, and state information) will be permanently deleted from our servers.\n• Any linked communication or chat data with advocates/admins will also be removed from our database.\n• Data deletion will be completed within 48 hours of confirmation.\n• You will receive an email or message notification once your account and data have been successfully deleted.',
              ),
              _buildSection( isDark,
                '3. Data Retention Exceptions',
                'In certain cases, we may be required to retain minimal information for a limited period to:\n\n• Comply with legal, regulatory, or tax obligations.\n• Resolve disputes or prevent misuse of the platform.\n\nAfter the retention period expires, this information will also be permanently deleted.',
              ),
              _buildSection( isDark,
                '4. Re-registration After Deletion',
                'Once your account is deleted, it cannot be restored. If you wish to use Ama Legal Solutions again, you will need to create a new account and complete the OTP verification process.',
              ),
              _buildSection( isDark,
                '5. Contact for Assistance',
                'If you have any questions or need help during the deletion process, please reach out to our support team at:\n\nEmail: notify@amalegalsolutions.com\nPhone: +91 8700343611\n\nBy submitting a deletion request, you acknowledge that your account and associated data will be permanently erased in accordance with this Delete Account Policy.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(isDark,String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          title,
          style: TextStyle(
            color:   isDark ? Colors.white : Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          content,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 13.sp,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
