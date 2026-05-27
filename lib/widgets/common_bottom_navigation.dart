import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final bool isDark;
  final Function(int)? onTabChanged;

  const CommonBottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.isDark,
    this.onTabChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Main pill bar
            Container(
              height: 62.h,
              decoration: BoxDecoration(
                color:const Color(0xFF3a342c).withOpacity(0.9),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: const Color(0xFF9a7a30), width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(
                    icon: Icons.home_outlined,
                    activeIcon: Icons.home_rounded,
                    label: 'Home',
                    index: 0,
                  ),
                  _buildNavItem(
                    icon: Icons.format_list_bulleted_outlined,
                    activeIcon: Icons.format_list_bulleted,
                    label: 'Services',
                    index: 1,
                  ),
                  _buildNavItem(
                    icon: Icons.chat_bubble_outline_rounded,
                    activeIcon: Icons.chat_bubble_rounded,
                    label: 'AMA',
                    index: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final isSelected = index == selectedIndex;
    final itemColor = isSelected
        ? const Color(0xFFac9041)
        : Colors.grey[500]!;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onTabChanged?.call(index);
          if (index == 0) {
            Get.offAllNamed('/home');
          } else if (index == 1) {
            Get.toNamed('/services');
          } else if (index == 2) {
            Get.toNamed('/ama');
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              key: ValueKey(isSelected),
              color: itemColor,
              size:  22.sp,
            ),
            SizedBox(height: 3.h),
            Text(label,style:TextStyle(color: isSelected
                ? const Color(0xFFac9041)
                : Colors.grey[500]!,fontSize: 10),),
          ],
        ),
      ),
    );
  }
}