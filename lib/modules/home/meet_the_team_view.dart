import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../theme/theme_controller.dart';
import '../../core/theme/app_colors.dart';

class MeetTheTeamView extends StatelessWidget {
  const MeetTheTeamView({Key? key}) : super(key: key);

  final List<TeamMember> teamMembers = const [
    TeamMember(
      name: 'Anuj Anand Malik',
      designation: 'Founder & Advocate',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Sarah Johnson',
      designation: 'Senior Legal Advisor',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Michael Chen',
      designation: 'Corporate Lawyer',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Emily Davis',
      designation: 'Legal Consultant',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Robert Wilson',
      designation: 'Tax Specialist',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Lisa Anderson',
      designation: 'Paralegal',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'David Miller',
      designation: 'Civil Lawyer',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Sophia Brown',
      designation: 'Legal Researcher',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'James Taylor',
      designation: 'Criminal Lawyer',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Olivia Martin',
      designation: 'Family Law Expert',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'William Garcia',
      designation: 'Property Lawyer',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Emma Rodriguez',
      designation: 'Corporate Consultant',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Benjamin Lee',
      designation: 'Immigration Lawyer',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Charlotte Harris',
      designation: 'Legal Advisor',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Daniel Clark',
      designation: 'Cyber Law Expert',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Mia Lewis',
      designation: 'Documentation Specialist',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Ethan Walker',
      designation: 'High Court Advocate',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Amelia Hall',
      designation: 'Legal Consultant',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Matthew Allen',
      designation: 'Consumer Rights Lawyer',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Harper Young',
      designation: 'Tax Consultant',
      imagePath: 'assets/images/image4.png',
    ),
    TeamMember(
      name: 'Alexander King',
      designation: 'Senior Advocate',
      imagePath: 'assets/images/image4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final isDark =
            themeController.themeMode == ThemeMode.dark ||
                (themeController.themeMode == ThemeMode.system &&
                    MediaQuery.of(context).platformBrightness == Brightness.dark);

        return Scaffold(
          backgroundColor: isDark ? Color(0xFF171717) : Colors.white,
          appBar: AppBar(
            backgroundColor: isDark ? Color(0xFF171717) : Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: isDark ? Colors.white : Colors.black,
                size: 20.sp,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            title: Text(
              'Meet the Team',
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 00.w,
                  mainAxisSpacing: 5.h,
                  childAspectRatio: 0.98,
                ),
                itemCount: teamMembers.length,
                itemBuilder: (context, index) {
                  final member = teamMembers[index];
                  return _buildTeamMemberCard(member, isDark);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTeamMemberCard(TeamMember member, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 100.h,
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              member.imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: isDark ? Color(0xFF3A3A3A) : Colors.grey[300],
                  child: Icon(
                    Icons.person,
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                    size: 40.sp,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          member.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          member.designation,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isDark ? Colors.grey[400] : Colors.black54,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class TeamMember {
  final String name;
  final String designation;
  final String imagePath;

  const TeamMember({
    required this.name,
    required this.designation,
    required this.imagePath,
  });
}
