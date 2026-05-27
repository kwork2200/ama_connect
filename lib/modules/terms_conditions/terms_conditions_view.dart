import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/theme/app_theme.dart';

class TermsConditionsView extends StatelessWidget {
  const TermsConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor:  isDark ? Colors.black : Color(0xFFd49f3f),
        elevation: 0,
        leading: IconButton(
            icon:  Icon(Icons.arrow_back, color:  isDark ? Colors.white : Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Terms & Conditions',
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
                'Terms and Conditions',
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
              _buildSection(isDark,
                'Introduction',
                'Welcome to Ama Legal Solutions ("we," "our," or "us").\n\nBy downloading, accessing, or using the Ama Legal Solutions mobile application ("App"), you agree to be bound by these Terms and Conditions ("Terms"). Please read them carefully before using the app or our services.\n\nIf you do not agree with these Terms, please refrain from using the Ama Legal Solutions app.',
              ),
              _buildSection(isDark,
                '1. About Ama Legal Solutions',
                'Ama Legal Solutions is a trusted Indian law firm and digital legal advisory platform. Through the app, users can:\n\n• Explore our legal services\n• Ask legal questions or submit issues for review\n• Receive guidance or responses from verified advocates or authorized admins\n\nThe app aims to provide secure, efficient, and transparent legal assistance.',
              ),
              _buildSection(isDark,
                '2. Acceptance of Terms',
                'By creating an account, logging in, or using our services, you agree that you:\n\n• Are at least 18 years of age (or have legal parental consent if above 13 but below 18).\n• Have read, understood, and accepted these Terms and our Privacy Policy.\n• Provide accurate and complete information during registration and communication.\n\nYour continued use of the app signifies your consent to these Terms and any future updates.',
              ),
              _buildSection(isDark,
                '3. Legal Disclaimer',
                'Ama Legal Solutions provides legal consultation and guidance through verified advocates and legal professionals. However:\n\n• The responses, opinions, or guidance provided via the app do not constitute a formal attorney-client relationship.\n• The information shared is for general legal assistance and guidance.\n• Users are encouraged to consult directly with qualified legal professionals for specific cases or litigation matters.\n• Ama Legal Solutions shall not be liable for any direct or indirect consequences arising from reliance on advice shared through the app.',
              ),
              _buildSection(isDark,
                '4. User Responsibilities',
                'You agree to use the Ama Legal Solutions app lawfully and responsibly. You must not:\n\n• Provide false, misleading, or inaccurate information.\n• Impersonate another person or entity.\n• Use the platform to post, share, or transmit illegal, defamatory, or offensive content.\n• Attempt to hack, disrupt, or misuse the app or its security systems.\n\nViolation of these rules may result in account suspension or permanent termination without prior notice.',
              ),
              _buildSection(isDark,
                '5. Advocate and Admin Interaction',
                'All advocates listed on Ama Legal Solutions are verified and approved professionals.\n\n• User data shared with advocates or admins is handled in accordance with our Privacy Policy.\n• Any communication between users and advocates is intended for informational and advisory purposes only.\n• Advocates are independent professionals, and Ama Legal Solutions is not responsible for their opinions or advice.',
              ),
              _buildSection(isDark,
                '6. OTP and Account Verification',
                'To enhance security, users are required to verify their identity using an OTP (One-Time Password) sent via WhatsApp using a secure third-party API. Your phone number is used solely for authentication purposes and is not shared or sold to any other party.',
              ),
              _buildSection(isDark,
                '7. Intellectual Property Rights',
                'All content within the Ama Legal Solutions app — including but not limited to text, images, graphics, the app logo, and videos — is owned or licensed by Ama Legal Solutions.\n\n• You may not reproduce, distribute, or modify any content from the app without prior written permission.\n• The introductory video explaining Ama Legal Solutions is offline, safe, and informational only, and may not be copied or republished elsewhere.',
              ),
              _buildSection(isDark,
                '8. No Advertising Policy',
                'Ama Legal Solutions does not host third-party advertisements or marketing promotions within the app.\n\nAll in-app content is professional, ad-free, and designed solely for user convenience.',
              ),
              _buildSection(isDark,
                '9. Data Protection and Privacy',
                'Your privacy and data security are our top priorities. We collect and process personal information such as your name, email, phone number, state, and profile picture only to provide our services. All data is encrypted and transmitted securely over HTTPS and stored on secured servers.\n\nFor detailed information, please review our https://sites.google.com/view/ama-legal-solutions/home (included separately in the app and store listing).',
              ),
              _buildSection(isDark,
                '10. Push Notifications',
                'We may send you notifications through Firebase Cloud Messaging (FCM) regarding:\n\n• Updates from advocates or admins\n• Important account-related alerts\n• App improvements or service changes\n\nYou may disable notifications anytime via your device settings.',
              ),
              _buildSection(isDark,
                '11. Account Termination and Data Deletion',
                'You may request deletion of your account and all related data at any time by contacting us:\n\nPhone: +91 8700343611\nEmail: notify@amalegalsolutions.com\nAddress: 2493AP, Block G, Sushant Lok 2, Sector 57, Gurugram, Haryana 122001\n\nOnce verified, your account and data will be permanently deleted within 48 hours. We reserve the right to suspend or terminate your account in case of policy violation or misuse of the app.',
              ),
              _buildSection(isDark,
                '12. Limitation of Liability',
                'While we strive to provide reliable and secure services, Ama Legal Solutions is not responsible for:\n\n• Any inaccuracies in legal responses provided by advocates.\n• Any damages resulting from reliance on the information provided through the app.\n• Any interruption, loss of data, or system errors beyond our reasonable control.',
              ),
              _buildSection(isDark,
                '13. Governing Law and Jurisdiction',
                'These Terms shall be governed and interpreted in accordance with the laws of India, specifically the Information Technology Act, 2000, and the Digital Personal Data Protection Act (DPDP), 2023. Any disputes shall fall under the exclusive jurisdiction of the courts of Gurugram, Haryana, India.',
              ),
              _buildSection(isDark,
                '14. Updates to These Terms',
                'We may modify or update these Terms periodically to reflect changes in our operations, legal requirements, or service offerings. The updated version will be available within the app, and continued use of the app indicates your acceptance of such changes.',
              ),
              _buildSection(isDark,
                '15. Contact Information',
                'For questions, feedback, or concerns about these Terms, please contact us at:\n\nPhone: +91 8700343611\nEmail: notify@amalegalsolutions.com\nAddress: 2493AP, Block G, Sushant Lok 2, Sector 57, Gurugram, Haryana 122001\n\nBy using the Ama Legal Solutions app, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions and our Privacy Policy.',
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
