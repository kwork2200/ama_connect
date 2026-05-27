import 'dart:io';
import 'dart:ui';

import 'package:ama_connect/modules/account/account_contoller.dart';
import 'package:ama_connect/modules/account/account_drawer.dart';
import 'package:ama_connect/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../theme/theme_controller.dart';
import 'home_controller.dart';
import '../../widgets/common_bottom_navigation.dart';
import '../../core/theme/app_colors.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final isDark =
            themeController.themeMode == ThemeMode.dark ||
            (themeController.themeMode == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

        return Scaffold(
          key: _scaffoldKey,

          backgroundColor: isDark ? Color(0xFF171717) : Colors.white,
          extendBody: true,
          // optional (for transparency)
          drawer: AccountDrawer(
            isDark: isDark,
            onClose: () => _scaffoldKey.currentState?.closeDrawer(),
          ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildStatusBar(isDark, themeController),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),
                            _buildBannerCard(isDark),
                            SizedBox(height: 20.h),
                            _buildActionCards(isDark),
                            SizedBox(height: 20.h),
                            _buildStatisticsSection(isDark),
                            SizedBox(height: 20.h),
                            _buildTrustedOrganizations(isDark),
                            SizedBox(height: 20.h),
                            _buildFounderSection(isDark),
                            SizedBox(height: 20.h),
                            _buildTeamSection(isDark),
                            SizedBox(height: 20.h),
                            _buildTestimonialsSection(isDark),
                            SizedBox(height: 20.h),
                            _buildLocationsGridSection(isDark),
                            SizedBox(height: 100.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CommonBottomNavigation(
                    selectedIndex: controller.selectedTabIndex.value,
                    isDark: isDark,
                    onTabChanged: (index) =>
                        controller.selectedTabIndex.value = index,
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
    final accountController = Get.put(AccountController());

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF141414) : Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(top: 5.h, left: 15.w, right: 5.w, bottom: 8.h),
      child: Row(
        children: [
          /// todo :
          GestureDetector(
            onTap: () => _scaffoldKey.currentState?.openDrawer(),
            child: Obx(
              () => CircleAvatar(
                radius: 18.r,
                backgroundColor: AppColors.white,
                backgroundImage: accountController.profileImage.value.isNotEmpty
                    ? FileImage(File(accountController.profileImage.value))
                          as ImageProvider
                    : null,
                child: accountController.profileImage.value.isEmpty
                    ? Icon(Icons.person, color: AppColors.black, size: 26.sp)
                    : null,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          RichText(
            text: TextSpan(
              text: 'Hi, ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'kwork',
                  style: TextStyle(
                    color: isDark ? const Color(0xFFFFD700) : Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              themeController.setTheme(isDark ? 'Light' : 'Dark');
            },
            child: Icon(
              isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
              color: Colors.white,
              size: 22.sp,
            ),
          ),
          SizedBox(width: 14.w),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.NOTIFICATION);
            },
            child: Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: 22.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerCard(bool isDark) {
    final bannerImages = [
      'assets/images/pageview_one.png',
      'assets/images/pageview_two.png',
      'assets/images/pageview_three.png',
    ];

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Column(
              children: [
                SizedBox(
                  height: 150.h,
                  child: PageView.builder(
                    controller: controller.bannerController,
                    onPageChanged: (index) {
                      controller.currentBannerPage.value = index;
                    },
                    itemCount: bannerImages.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        bannerImages[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              bannerImages.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: controller.currentBannerPage.value == index ? 24.w : 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: controller.currentBannerPage.value == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }

  Widget _buildActionCards(bool isDark) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: _buildActionCard(
              isDark,
              Icons.phone_callback_outlined,
              'Request Assistance',
              'Need help? We\'re here to assist you',
              () {
                Get.toNamed('/ask_ama');
              },
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: _buildActionCard(
              isDark,
              Icons.help_outline,
              'Ask Your Question\n',
              'Legal answers within 45 minutes',
              () {
                Get.toNamed('/ama');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(
    bool isDark,
    IconData icon,
    String title,
    String subtitle,
    void Function()? onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1e1a11) : const Color(0xFFC8A96E),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: isDark
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(isDark ? 0.12 : 0.3),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: isDark ? const Color(0xFFFFD700) : Colors.black87,
                size: 24.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: TextStyle(
                color: isDark ? Colors.grey : Colors.black87,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsSection(bool isDark) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1e1a11) : const Color(0xFFC8A96E),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF423726), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(isDark, '10k+', 'Case\nHandled'),
          Container(width: 1, height: 40.h, color: Colors.black26),
          _buildStatItem(isDark, '40+', 'Year\nExperience'),
          Container(width: 1, height: 40.h, color: Colors.black26),
          _buildStatItem(isDark, '5k+', 'Client\nServed'),
        ],
      ),
    );
  }

  Widget _buildStatItem(bool isDark, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: isDark ? const Color(0xFFFFD700) : Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isDark ? Colors.grey : Colors.black87,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildTrustedOrganizations(bool isDark) {
    final row1 = ['BCB', 'DNM', 'JIVO ENERGY', 'Hero Fincorp'];
    final row2 = ['LD Counsels', '9Consultants', 'billscut', 'Globato'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Trusted by Leading Organizations',
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 14.h),
        _buildOrgRow(isDark, row1, controller.orgRow1Controller),
        SizedBox(height: 10.h),
        _buildOrgRow(isDark, row2, controller.orgRow2Controller),
      ],
    );
  }

  Widget _buildOrgRow(
    bool isDark,
    List<String> names,
    ScrollController scrollController,
  ) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: names.length,
        itemBuilder: (_, i) {
          final isBillscut = names[i] == 'billscut';
          return Container(
            width: 95.w,
            margin: EdgeInsets.only(right: 12.w),
            decoration: BoxDecoration(
              color: isBillscut
                  ? Colors.black
                  : (!isDark ? const Color(0xFF2A2A2A) : Colors.white),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: isDark
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
            ),
            child: _buildOrgImage(names[i], isBillscut, isDark),
          );
        },
      ),
    );
  }

  Widget _buildOrgImage(String orgName, bool isBillscut, bool isDark) {
    final Map<String, String> orgImages = {
      'BCB': 'assets/brand/brand_1.jpeg',
      'DNM': 'assets/brand/brand_2.jpeg',
      'JIVO ENERGY': 'assets/brand/brand_3.jpeg',
      'Hero Fincorp': 'assets/brand/brand_4.jpeg',
      'LD Counsels': 'assets/brand/brand_5.jpeg',
      '9Consultants': 'assets/brand/brand_6.jpeg',
      'billscut': 'assets/brand/brand_7.jpeg',
      'Globato': 'assets/brand/brand_8.jpeg',
    };

    final imagePath = orgImages[orgName] ?? 'assets/images/default_org.png';

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      width: 75.w,
      height: 50.h,
    );
  }

  Widget _buildFounderSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Our Founder',
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 14.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Founder photo placeholder with gradient
              Container(
                width: 110.w,
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/image4.png'),
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anuj Anand Malik',
                      style: TextStyle(
                        color: const Color(0xFFFFD700),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Founder',
                      style: TextStyle(
                        color: isDark ? Colors.grey : Colors.black54,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Anuj Anand Malik, advocate and founder of AMA Legal Solutions, leads with a mission to simplify and modernize legal services. His focus on client-centric solutions and financial law continues the legacy of innovation and integrity.',
                      style: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.black87,
                        fontSize: 11.sp,
                        height: 1.55,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 6.w),
              Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF3A3A3A)
                      : const Color(0xFFF0E8C8),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: const Color(0xFFFFD700),
                  size: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTeamSection(bool isDark) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1e1a11) : const Color(0xFFC8A96E),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 1),
                ),
              ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meet the Team\nBehind Your Legal',
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.MEET_THE_TEAM);
                  },
                  child: Text(
                    'View Team',
                    style: TextStyle(
                      color: isDark ? const Color(0xFFFFD700) : Colors.black87,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          SizedBox(
            width: 80.w,
            height: 120.h,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: -2.w,
                  child: _buildTeamAvatar(
                    gradient: [
                      const Color(0xFFFFD700),
                      const Color(0xFF5C3A10),
                    ],
                  ),
                ),
                Positioned(
                  top: 50.h,
                  left: 10,
                  child: _buildTeamAvatar(
                    gradient: [
                      const Color(0xFFFFD700),
                      const Color(0xFF8BC34A),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamAvatar({required List<Color> gradient}) {
    return Container(
      width: 70.w,
      height: 70.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset('assets/images/image4.png', fit: BoxFit.fill),
      ),
    );
  }

  Widget _buildTestimonialsSection(bool isDark) {
    final reviews = [
      {
        'name': 'Pratichi Pradhan',
        'text':
            'Phenomenal services! Turnaround time was half day to get the papers in order, extend a reasonable price.',
      },
      {
        'name': 'Sk Nazir',
        'text':
            'Outstanding consultation! Ama Legal Solutions prioritizes client satisfaction and delivers quick, effective results.',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'What Our Clients Say',
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 14.h),
        ...reviews.map(
          (r) => Container(
            margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 12.h),
            padding: EdgeInsets.all(18.w),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1e1a11) : const Color(0xFFC8A96E),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: isDark
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  r['text']!,
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black87,
                    fontSize: 14.sp,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    _buildGoogleIcon(),
                    SizedBox(width: 10.w),
                    Text(
                      r['name']!,
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: isDark
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ],
            ),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final playStoreUrl =
                    'https://play.google.com/store/apps/details?id=com.ama.ama_legal_solutions';

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
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark
                    ? const Color(0xFF1e1a11)
                    : const Color(0xFFC8A96E),
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'View More Reviews',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Google coloured "G" icon
  Widget _buildGoogleIcon() {
    return Container(
      width: 34.w,
      height: 34.h,
      decoration: const BoxDecoration(
        // color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset("assets/images/img.png"),
        ),
      ),
    );
  }

  Widget _buildLocationsGridSection(bool isDark) {
    final locations = [
      'Andhra Pradesh',
      'Arunachal Pradesh',
      'Assam',
      'Bihar',
      'Chhattisgarh',
      'Goa',
      'Gujarat',
      'Haryana',
      'Himachal Pradesh',
      'Jharkhand',
      'Karnataka',
      'Kerala',
      'Madhya Pradesh',
      'Maharashtra',
      'Manipur',
      'Meghalaya',
      'Mizoram',
      'Nagaland',
      'Odisha',
      'Punjab',
      'Rajasthan',
      'Sikkim',
      'Tamil Nadu',
      'Telangana',
      'Tripura',
      'Uttar Pradesh',
      'Uttarakhand',
      'West Bengal',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Align(
            alignment: AlignmentGeometry.topStart,
            child: Text(
              'Our Locations',
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 14.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Obx(
            () => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 5.h,
                mainAxisExtent: 35.h,
              ),
              itemCount: controller.showAllLocations.value
                  ? locations.length
                  : 10,
              itemBuilder: (_, i) {
                return Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white : Color(0xFF2d2319),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      locations[i],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isDark ? Colors.black : Colors.white,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 14.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: isDark
                    ? []
                    : [
                        BoxShadow(
                          color:  Color(0xfff7f2f9).withOpacity(0.3),
                          blurRadius: 0,
                          offset: const Offset(0, 1),
                        ),
                      ],
              ),
              width: 100.w,
              child: ElevatedButton(
                onPressed: () {
                  controller.showAllLocations.value =
                      !controller.showAllLocations.value;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF3EEF8),
                  foregroundColor: const Color(0xFF6C4AB6),
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  controller.showAllLocations.value ? 'View Less' : 'View More',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
