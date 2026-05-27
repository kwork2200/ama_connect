import 'dart:ui';

import 'package:ama_connect/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../account/account_contoller.dart';
import '../theme/theme_controller.dart';
import 'services_controller.dart';
import '../../widgets/common_bottom_navigation.dart';
import '../../routes/app_routes.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final isDark =
            themeController.themeMode == ThemeMode.dark ||
                (themeController.themeMode == ThemeMode.system &&
                    MediaQuery.of(context).platformBrightness == Brightness.dark);

        return Scaffold(
          backgroundColor: isDark ? const Color(0xFF171717) : Colors.white,
          extendBody: true,
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
                            : const [0.0, 0.42, 1.0],
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStatusBar(isDark, themeController),
                      _buildServicesGrid(isDark),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CommonBottomNavigation(
                    selectedIndex: 1,
                    isDark: isDark,
                    onTabChanged: (index) {
                      switch (index) {
                        case 0:
                          Get.offAllNamed(Routes.HOME);
                          break;
                        case 1:
                          // Already on Services
                          break;
                        case 2:
                          Get.offAllNamed(Routes.AMA);
                          break;
                        case 3:
                          Get.offAllNamed(Routes.PORTFOLIO);
                          break;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  Widget _buildStatusBar(bool isDark, ThemeController themeController) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF141414) : Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(top: 12.h, left: 15.w, right: 5.w, bottom: 12.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.offAllNamed(Routes.HOME),
            child: Icon(Icons.arrow_back_ios_new),
          ),
          SizedBox(width: 12.w),
          Text("Service", style: TextStyle(
            color:isDark ? Colors.white :  Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),)
        ],
      ),
    );
  }
  Widget _buildServicesGrid(bool isDark) {
    final services = [
      {
        'title': 'Banking & Finance',
        'description':
        'Expert legal solutions for financial disputes, fraud cases, and bank...',
        'icon': Icons.account_balance,
      },
      {
        'title': 'Loan Settlement',
        'description':
        'Get professional help to settle your loans legally - whether it\'s a credit...',
        'icon': Icons.money,
      },
      {
        'title': 'Intellectual Property Rights',
        'description': 'Protect your ideas and brand legally. Our team',
        'icon': Icons.copyright,
      },
      {
        'title': 'Entertainment Law',
        'description':
        'Comprehensive legal support for film, music, and media profession...',
        'icon': Icons.movie,
      },
      {
        'title': 'Real Estate',
        'description':
        'End-to-end legal assistance for property disputes, RERA compli...',
        'icon': Icons.home,
      },
      {
        'title': 'Criminal Law',
        'description':
        'From FIR to trial, we provide full legal representation in crim...',
        'icon': Icons.gavel,
      },
      {
        'title': 'Corporate Law',
        'description':
            'Comprehensive legal guidance for corporate governance, mergers, acquisitions, and compliance...',
        'icon': Icons.business,
      },
      {
        'title': 'Arbitration Law',
        'description':
            'Expert arbitration services for resolving commercial disputes efficiently and cost-effectively...',
        'icon': Icons.balance,
      },
      {
        'title': 'IT & Cyber Law',
        'description':
            'Legal protection for digital assets, data privacy, cybersecurity compliance, and tech regulations...',
        'icon': Icons.computer,
      },
      {
        'title': 'Civil Law',
        'description':
            'Expert representation in civil matters including property disputes, contracts, and family law...',
        'icon': Icons.gavel,
      },
      {
        'title': 'Drafting',
        'description':
            'Professional legal drafting services for contracts, agreements, deeds, and legal documents...',
        'icon': Icons.edit_document,
      },

    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              "assets/images/pageview_two.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            width:  10.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: Colors.white
                  ,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(height: 10.h),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14.w,
              mainAxisSpacing: 14.h,
              childAspectRatio: 0.95,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              return _buildServiceCard(
                isDark,
                services[index]['title'] as String,
                services[index]['description'] as String,
                services[index]['icon'] as IconData,
              );
            },
          ),
        ],
      ),
    );
  }
  Widget _buildServiceCard(
    bool isDark,
    String title,
    String description,
    IconData icon,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1e1a11) : const Color(0xFF2d2319),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF9a7a30), width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color:  Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 6.h),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10.sp,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => _showServiceDetailDialog(isDark, title, description),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View More',
                          style: TextStyle(
                            color:  Color(0xFFc1973a),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFFc1973a) ,
                          size: 10.sp,
                        ),
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

  void _showServiceDetailDialog(bool isDark, String title, String description) {
    final fullDescription = _getFullDescription(title);
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: isDark ? const Color(0xFF1e1a11) : const Color(0xFFC8A96E),
        // border: Border.all(color: const Color(0xFF9a7a30), width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF9a7a30), width: 2),
            borderRadius: BorderRadius.circular(20.r),

          ),
          padding: EdgeInsets.all(10.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                fullDescription,
                maxLines: 4,
                style: TextStyle(
                  color: isDark ? Colors.grey[300] : Colors.black87,
                  fontSize: 12.sp,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                height: 30.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    _showRaiseQueryDialog(isDark,title);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? const Color(0xFFd29f2a) : Colors.black,
                    foregroundColor: isDark ? Colors.black : Colors.white,
                    // padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                  child: Text(
                    'Raise a Query',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.backgroundLight,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showRaiseQueryDialog(bool isDark, String serviceTitle) {
    final TextEditingController queryController = TextEditingController();

    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF2d2319) : const Color(0xFFC8A96E),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          // border: Border.all(color: const Color(0xFF9a7a30), width: 2),
        ),
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 20.h,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Raise a Query for $serviceTitle',
              maxLines: 2,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: isDark ? Colors.white : Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: isDark ? Colors.black.withOpacity(0.3) : Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFF392b1e), width: 1),
              ),
              child: TextField(
                controller: queryController,
                maxLines: 4,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 14.sp,
                ),
                decoration: InputDecoration(
                  hintText: 'Type your query here...',
                  hintStyle: TextStyle(
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                    fontSize: 14.sp,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        // Add submit query functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark ? const Color(0xFFd29f2a) : Colors.black,
                        foregroundColor: isDark ? Colors.black : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: SizedBox(
                    height: 40.h,
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: isDark ? Colors.white : Colors.black,
                        side: BorderSide(color: const Color(0xFF9a7a30), width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
  String _getFullDescription(String title) {
    switch (title) {
      case 'Banking & Finance':
        return 'Expert legal solutions for financial disputes, fraud cases, and banking regulations. Our team specializes in matters related to negotiable instruments, banking contracts, loan agreements, and financial compliance. We provide comprehensive legal support for both individuals and corporate clients in all banking and finance related matters.';
      case 'Loan Settlement':
        return 'Get professional help to settle your loans legally - whether it\'s a credit card, personal loan, or business loan. Our experts negotiate with lenders to reduce your debt burden through legal settlement procedures. We ensure your rights are protected while helping you achieve financial freedom through structured settlement plans.';
      case 'Intellectual Property Rights':
        return 'Protect your ideas and brand legally. Our team specializes in trademark registration, copyright protection, patent filing, and trade secret protection. We provide comprehensive IP portfolio management and enforcement services to safeguard your creative works and innovations from infringement.';
      case 'Entertainment Law':
        return 'Comprehensive legal support for film, music, and media professionals. We handle contracts, licensing agreements, copyright issues, and royalty disputes. Our expertise covers talent agreements, production contracts, distribution deals, and digital media rights to protect your creative interests.';
      case 'Real Estate':
        return 'End-to-end legal assistance for property disputes, RERA compliance, and real estate transactions. We handle property registrations, title verification, builder agreements, and consumer complaints. Our team ensures smooth property transactions while protecting your legal interests.';
      case 'Criminal Law':
        return 'From FIR to trial, we provide full legal representation in criminal matters. Our experienced criminal lawyers handle bail applications, defense strategies, and appeals. We ensure your constitutional rights are protected throughout the legal process with dedicated advocacy.';
      case 'Corporate Law':
        return 'Comprehensive legal guidance for corporate governance, mergers, acquisitions, and compliance. We assist with company formation, board meetings, shareholder agreements, and regulatory compliance. Our team ensures your business operates within legal frameworks while maximizing growth opportunities.';
      case 'Arbitration Law':
        return 'Expert arbitration services for resolving commercial disputes efficiently and cost-effectively. We represent clients in domestic and international arbitration proceedings, drafting arbitration agreements and enforcing arbitral awards. Our approach focuses on achieving favorable outcomes through alternative dispute resolution.';
      case 'IT & Cyber Law':
        return 'Legal protection for digital assets, data privacy, cybersecurity compliance, and tech regulations. We handle data breach incidents, cybercrime cases, and technology contracts. Our team ensures your digital operations comply with evolving cyber laws and protect your online business interests.';
      case 'Civil Law':
        return 'Expert representation in civil matters including property disputes, contracts, and family law. We handle civil suits, injunctions, and declaratory decrees. Our approach combines thorough legal research with strategic litigation to protect your civil rights and interests.';
      case 'Drafting':
        return 'Professional legal drafting services for contracts, agreements, deeds, and legal documents. Our experts ensure precision and legal validity in all documentation. We draft customized legal instruments tailored to your specific needs while ensuring compliance with applicable laws.';
      default:
        return "";
    }
  }
}
