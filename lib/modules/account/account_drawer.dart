import 'dart:io';
import 'package:ama_connect/modules/account/account_contoller.dart';
import 'package:ama_connect/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

/// todo : N
class AccountDrawer extends StatelessWidget {
  final bool isDark;
  final VoidCallback onClose;

  const AccountDrawer({super.key, required this.isDark, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      ),
      child: SafeArea(
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
                _buildHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildUserProfile(),
                        SizedBox(height: 24.h),
                        _buildNavigationItems(),
                        SizedBox(height: 16.h),
                        _buildAppPolicies(),
                        SizedBox(height: 20.h),
                        _buildFeedback(),
                        SizedBox(height: 18.h),
                        _buildContactUs(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Divider(
                            color: AppColors.yellow, thickness: 1
                          ),
                        ),
                        SizedBox(height: 14.h),
                        _buildLogoutButton(),
                        SizedBox(height: 30.h),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildLogoutButton() {
    return GestureDetector(
      onTap: () {
        _showLogoutDialog();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Icon(Icons.logout,color: Color(0xFFd49f3f)),
            SizedBox(width: 5.w),
            Text(
              'Logout',
              style: GoogleFonts.outfit(
                color:Color(0xFFd49f3f),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    Get.dialog(
      AlertDialog(
        title: Center(
          child: Text(
            'Confirm Logout',
            style: GoogleFonts.outfit(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: Text(
          'Are you sure you want to log out?',
          style: GoogleFonts.outfit(
            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            fontSize: 16.sp,
          ),
        ),
        backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Cancel',
              style: GoogleFonts.outfit(
                color: AppColors.white,
                fontSize: 16.sp,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: TextButton(
              onPressed: () async {
                Get.back();
                await _performLogout();
              },
              child: Text(
                'Logout',
                style: GoogleFonts.outfit(
                  color: AppColors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: true,
    );
  }

  Future<void> _performLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    final accountController = Get.find<AccountController>();
    accountController.profileImage.value = '';
    
    Get.offAllNamed(Routes.LOGIN);
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: onClose,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 20.w),
          Text(
            'Account',
            style: GoogleFonts.outfit(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    final accountController = Get.put(AccountController());
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Center(
            child: SizedBox(
              width: 80.w,
              height: 80.h,
              child: Stack(
                children: [
                  Obx(() => CircleAvatar(
                    radius: 40.r,
                    backgroundColor: AppColors.darkGrey,
                    backgroundImage: accountController.profileImage.value.isNotEmpty
                        ? FileImage(File(accountController.profileImage.value)) as ImageProvider
                        : null,
                    child: accountController.profileImage.value.isEmpty
                        ? Icon(
                            Icons.person,
                            color: AppColors.white,
                            size: 40.sp,
                          )
                        : null,
                  )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        accountController.pickImageFromGallery();
                      },
                      child: Container(
                        width: 28.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColors.white,
                          size: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Krishna',
            style: GoogleFonts.outfit(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'kwork2200@gmail.com',
            style: GoogleFonts.outfit(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDrawerItem(
          icon: Icons.work_outline,
          title: 'Portfolio',
          onTap: () {
            Get.toNamed(Routes.PORTFOLIO);
          },
        ),
        _buildDrawerItem(
          icon: Icons.payment_outlined,
          title: 'Payment & Billing',
          onTap: () {
            Get.toNamed(Routes.PAYMENT_BILLING);
          },
        ),
      ],
    );
  }

  Widget _buildAppPolicies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 00.h),
          child: Text(
            'App Policies',
            style: GoogleFonts.outfit(
              color: isDark ? AppColors.white : AppColors.textSecondaryLight,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        _buildDrawerItem(
          icon: Icons.shield_outlined,
          title: 'Privacy Policy',
          iconColor:  Color(0xFFd49f3f),
          onTap: () {
            Get.toNamed(Routes.PRIVACY_POLICY);
          },
        ),
        _buildDrawerItem(
          icon: Icons.description_outlined,
          title: 'Terms and Conditions',
          iconColor:   Color(0xFFd49f3f)  ,
          onTap: () {
            Get.toNamed(Routes.TERMS_CONDITIONS);
          },
        ),
        _buildDrawerItem(
          icon: Icons.delete_outline,
          title: 'Delete Account Policy',
          iconColor:  Color(0xFFd49f3f),
          onTap: () {
            Get.toNamed(Routes.DELETE_ACCOUNT_POLICY);
          },
        ),
        _buildDrawerItem(
          icon: Icons.attach_money,
          title: 'Delete Account',
          iconColor:  Color(0xFFd49f3f),
          onTap: () {
            Get.toNamed(Routes.DELETE_ACCOUNT_REQUEST);
          },
        ),
      ],
    );
  }

  Widget _buildFeedback() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Feedback',
            style: GoogleFonts.outfit(
              color: isDark ? AppColors.white : AppColors.textSecondaryLight,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        _buildDrawerItem(
          icon: Icons.star,
          title: 'Rate ',
          highlightedText: 'AMA Legal Solutions',
          iconColor: AppColors.black,
          onTap: () async {
            final playStoreUrl = 'https://play.google.com/store/apps/details?id=com.ama.ama_legal_solutions';
            try {
              if (await canLaunchUrl(Uri.parse(playStoreUrl))) {
                await launchUrl(
                  Uri.parse(playStoreUrl),
                  mode: LaunchMode.platformDefault,
                );
              }
            } catch (e) {
              debugPrint('Error launching Play Store: $e');
            }
          },
        ),
      ],
    );
  }

  Widget _buildContactUs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Contact us',
            style: GoogleFonts.outfit(
              color: isDark ? AppColors.white : AppColors.textSecondaryLight,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: isDark
                    ? AppColors.white
                    : AppColors.textSecondaryLight,
                size: 20.sp,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final address = '2493AP, Block G, Sushant Lok 2, Sector 57, Gurugram, Haryana, 122001';
                    final encodedAddress = Uri.encodeComponent(address);
                    
                    try {
                      final geoUri = 'geo:0,0?q=$encodedAddress';
                      if (await canLaunchUrl(Uri.parse(geoUri))) {
                        await launchUrl(
                          Uri.parse(geoUri),
                          mode: LaunchMode.platformDefault,
                        );
                        return;
                      }
                      
                      final googleMapsScheme = 'comgooglemaps://?q=$encodedAddress';
                      if (await canLaunchUrl(Uri.parse(googleMapsScheme))) {
                        await launchUrl(
                          Uri.parse(googleMapsScheme),
                          mode: LaunchMode.platformDefault,
                        );
                        return;
                      }
                      
                      final webUrl = 'https://www.google.com/maps/search/?api=1&query=$encodedAddress';
                      if (await canLaunchUrl(Uri.parse(webUrl))) {
                        await launchUrl(
                          Uri.parse(webUrl),
                          mode: LaunchMode.platformDefault,
                        );
                      }
                    } catch (e) {
                      debugPrint('Error launching maps: $e');
                    }
                  },
                  child: Text(
                    '2493AP, Block G, Sushant Lok 2, Sector 57, Gurugram, Haryana, 122001',
                    style: GoogleFonts.outfit(
                      color: isDark
                          ? AppColors.white
                          : AppColors.textPrimaryLight.withOpacity(0.7),
                      fontSize: 13.sp,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        _buildDrawerItem(
          icon: Icons.phone,
          title: '+91-8700343611',
          iconColor: AppColors.white,
          onTap: () async {
            final phoneNumber = '+918700343611';
            final phoneUri = 'tel:$phoneNumber';
            
            try {
              if (await canLaunchUrl(Uri.parse(phoneUri))) {
                await launchUrl(
                  Uri.parse(phoneUri),
                  mode: LaunchMode.platformDefault,
                );
              }
            } catch (e) {
              debugPrint('Error launching phone dialer: $e');
            }
          },
        ),
        SizedBox(height: 5.h),
        _buildDrawerItem(
          icon: Icons.mail,
          title: 'notify@amalegalsolutions.com',
          iconColor: AppColors.white,
          onTap: () async {
            final email = 'notify@amalegalsolutions.com';
            final subject = 'AMA Legal Solutions Inquiry';
            final encodedSubject = Uri.encodeComponent(subject);
            final emailUri = 'mailto:$email?subject=$encodedSubject';
            
            try {
              if (await canLaunchUrl(Uri.parse(emailUri))) {
                await launchUrl(
                  Uri.parse(emailUri),
                  mode: LaunchMode.platformDefault,
                );
              }
            } catch (e) {
              debugPrint('Error launching email: $e');
            }
          },
        ),
        SizedBox(height: 5.h),
      ],
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    String? highlightedText,
    Color? iconColor,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          // color: isDark ? AppColors.surfaceDark : Colors.grey[100],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color:
                  iconColor ??
                  (isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight),
              size: 22.sp,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.outfit(
                    color: textColor ?? (isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight),
                    fontSize: 15.sp,
                  ),
                  children: [
                    TextSpan(text: title),
                    if (highlightedText != null)
                      TextSpan(
                        text: highlightedText,
                        style: GoogleFonts.outfit(
                          color: Color(0xFFd49f3f),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
