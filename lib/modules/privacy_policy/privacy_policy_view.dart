import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/theme/app_theme.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor:  isDark ? Colors.black : Color(0xFFd49f3f),
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color: isDark ? Colors.white : Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Privacy Policy',
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
              Center(
                child: Text(
                  'Ama Legal Solutions',
                  style: TextStyle(
                    color:   isDark ? Colors.white : Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color:  isDark ? Colors.grey[600]:  Color(0xFFa39ca2)  ,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Effective Date: November 1, 2025\nLast Updated: November 1, 2025',
                  style: TextStyle(
                    color: isDark ? Colors.grey[400]: Colors.black,
                    fontSize: 12.sp,
                    height: 1.4,
                  ),
                ),
              ),
              _buildSection(
                isDark,
                'Introduction',
                'Ama Legal Solutions ("we," "our," or "us") respects your privacy and is committed to protecting your personal information. This Privacy Policy explains how we collect, use, store, and protect your data when you use our mobile application "Ama Legal Solutions".\n\nBy using the Ama Legal Solutions app, you acknowledge that you have read, understood, and agree to the terms of this Privacy Policy.',
              ),
              _buildSection(
                isDark,
                '1. About Ama Legal Solutions',
                'Ama Legal Solutions is a trusted Indian law firm and legal advisory platform designed to connect clients with verified advocates. Our mission is to provide strategic, result-driven, and personalized legal services that safeguard clients\' rights and promote their success.\n\nThrough the Ama Legal Solutions mobile app, users can:\n\n• Explore legal services offered by our firm\n• Ask questions or share legal issues for guidance\n• Receive answers and assistance from registered and verified advocates or authorized admins\n\nThe app includes one introductory video, which safely explains what Ama Legal Solutions is and the services it provides. This video is offline, non-educational, and does not collect any user data or tracking information.',
              ),
              _buildSection(
                isDark,
                '2. Information We Collect',
                'We may collect and process the following personal information from users:\n\n• Full Name\n• Email Address\n• Phone Number\n• State\n• Profile Picture\n\nThis data helps us verify your identity, connect you with the right advocate, and provide personalized legal support.',
              ),
              _buildSection(
                isDark,
                '3. Purpose of Collecting Data',
                'We collect and use your personal information for the following purposes:\n\n• Account creation and identity verification\n• Sending one-time passwords (OTP) via WhatsApp for secure login verification\n• Facilitating communication between users and verified advocates/admins\n• Providing customer support and resolving user queries\n• Sending updates and notifications through Firebase Cloud Messaging (FCM)\n• Fulfilling legal and regulatory obligations',
              ),
              _buildSection(
                isDark,
                '4. OTP and Third-Party WhatsApp Integration',
                'For authentication, our app sends a One-Time Password (OTP) to your registered phone number using a third-party WhatsApp API service. Your phone number is only used for login verification and is not shared or sold to any external parties.',
              ),
              _buildSection( isDark,
                '5. Video Content',
                'The Ama Legal Solutions app contains a single introductory video that provides an overview of our firm, its values, and available services. The video is stored offline within the app and does not stream from external servers. It does not collect or track any user data or behavior. The video is safe, informational, and included only to help users understand the purpose of Ama Legal Solutions. There are no educational, promotional, or third-party advertisements in this video.',
              ),
              _buildSection( isDark,
                '6. Data Protection and Security',
                'We take strong measures to ensure your data security. All communication between your device and our servers is encrypted using HTTPS protocols.\n\nYour personal data is stored on secure servers with restricted access to authorized personnel only. We apply technical, administrative, and physical safeguards to prevent unauthorized access, misuse, or disclosure.\n\nWe comply with the Digital Personal Data Protection Act (DPDP Act), 2023 (India) and other relevant international data protection standards.',
              ),
              _buildSection( isDark,
                '7. Push Notifications',
                'We may use Firebase Cloud Messaging (FCM) to send important notifications about:\n\n• Account activity\n• Advocate responses or updates\n• App improvements or support messages\n\nYou can disable notifications at any time from your device settings.',
              ),
              _buildSection( isDark,
                '8. No Advertising Policy',
                'The Ama Legal Solutions app does not display third-party advertisements. We do not track, analyze, or monetize your activity through ads or marketing tools.',
              ),
              _buildSection( isDark,
                '9. Children\'s Privacy',
                'Ama Legal Solutions does not knowingly collect or solicit personal information from children under the age of 13. Our app and services are intended for use by adults and individuals above the age of 13 only.\n\nIf we discover that a child under 13 has provided us with personal information, we will promptly delete such data from our systems. If you are a parent or guardian and believe that your child has provided personal information to us, please contact us at notify@amalegalsolutions.com, and we will take appropriate action to remove that information.\n\nWe strongly advise parents and guardians to monitor their children\'s app usage to ensure a safe and appropriate online experience. Ama Legal Solutions fully complies with all applicable data protection and children\'s privacy laws.',
              ),
              _buildSection( isDark,
                '10. User Consent',
                'By using the Ama Legal Solutions app, you voluntarily consent to the collection, processing, and use of your information in accordance with this Privacy Policy and our Terms & Conditions.',
              ),
              _buildSection( isDark,
                '11. Data Retention',
                'We retain personal data only as long as necessary for service delivery, compliance, or support. If you request deletion, your data will be permanently removed within 48 hours of verification.',
              ),
              _buildSection( isDark,
                '12. User Rights',
                'As a user of Ama Legal Solutions, you are entitled to certain rights regarding your personal information, in accordance with applicable laws such as the GDPR, CCPA, and India\'s DPDP Act, 2023.\n\nYou have the right to:\n\n• Access Your Data: Request access to the personal data we hold about you.\n• Request Deletion: Ask for your account and personal data to be deleted permanently.\n• Request Data Portability: Request a copy of your personal data in a commonly used, machine-readable format.\n\nTo exercise any of these rights or to make inquiries about your data, please contact us at notify@amalegalsolutions.com. We will review and respond to your request in accordance with applicable data protection laws.',
              ),
              _buildSection( isDark,
                '13. Data Sharing and Disclosure',
                'We do not sell, rent, or trade your personal data. Your information may only be shared with:\n\n• Verified advocates or admins to address your legal queries\n• Authorized internal staff for service support\n• Legal authorities when required by applicable law\n• Third-party WhatsApp OTP provider for login authentication only\n\nAll such parties are obligated to maintain strict confidentiality and data protection standards.',
              ),
              _buildSection( isDark,
                '14. Account and Data Deletion Policy',
                'If you wish to delete your account and all personal data, please contact us at:\n\nPhone: +91 8700343611\nEmail: notify@amalegalsolutions.com\nAddress: 2493AP, Block G, Sushant Lok 2, Sector 57, Gurugram, Haryana 122001\n\nOnce your request is verified, your data will be permanently deleted within 48 hours.',
              ),
              _buildSection( isDark,
                '15. Changes to This Policy',
                'We may update this Privacy Policy periodically to reflect operational or legal changes. The latest version will always be available within the app. Please review this policy regularly for updates.',
              ),
              _buildSection( isDark,
                '16. Contact Us',
                'If you have questions, concerns, or complaints about this Privacy Policy or data handling, please reach us at:\n\nPhone: +91 8700343611\nEmail: notify@amalegalsolutions.com\nAddress: 2493AP, Block G, Sushant Lok 2, Sector 57, Gurugram, Haryana 122001\n\nBy using the Ama Legal Solutions app, you acknowledge that you have read, understood, and agree to the terms of this Privacy Policy.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(isDark,String title, String content,) {
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
