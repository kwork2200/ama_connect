import 'package:ama_connect/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../theme/theme_controller.dart';
import 'ama_controller.dart';
import '../../widgets/common_bottom_navigation.dart';
import '../../routes/app_routes.dart';

class AmaView extends GetView<AmaController> {
  const AmaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final isDark =
            themeController.themeMode == ThemeMode.dark ||
                (themeController.themeMode == ThemeMode.system &&
                    MediaQuery.of(context).platformBrightness ==
                        Brightness.dark);

        return DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor:
            isDark ? const Color(0xFF0F0F0F) : Colors.white,
            extendBody: true,
            // appBar:
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
                    children: [
                      _buildAppBar(isDark),
                      _buildTabBar(isDark),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _buildAllTab(isDark),
                            _buildUnansweredTab(isDark),
                            _buildMyQuestionsTab(isDark),
                            _buildAnswerTab(isDark),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: CommonBottomNavigation(
                      selectedIndex: 2,
                      isDark: isDark,
                      onTabChanged: (index) {
                        switch (index) {
                          case 0:
                            Get.offAllNamed(Routes.HOME);
                            break;
                          case 1:
                            Get.offAllNamed(Routes.SERVICES);
                            break;
                          case 2:
                            // Already on AMA
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
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(bool isDark) {
    return AppBar(
      backgroundColor:
      isDark ? const Color(0xFF1A1A1A) :  Color(0xFFf4ce53),
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Get.offAllNamed(Routes.HOME),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: isDark ? Colors.white : Colors.black,
          size: 20.sp,
        ),
      ),
      leadingWidth: 36.w,
      titleSpacing: 4.w,
      title: Text(
        'AMA',
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w, top: 10.h, bottom: 10.h),
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.ASK_AMA),
            child: Container(
              padding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
              decoration: BoxDecoration(
                color:   isDark ? const Color(0xFFd39e2f) :   Colors.black,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                'Ask AMA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar(bool isDark) {
    return Container(
      decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1A1A1A) : Color(0xFFf4ce53),
          borderRadius: BorderRadius.only(  bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),)
      ),
      child: TabBar(
        isScrollable: true,
        indicatorColor: isDark ? const Color(0xFFFFD700) :Colors.black,
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.label,dividerColor: Colors.transparent,
        labelColor:  isDark ? const Color(0xFFFFD700) :Colors.black ,
        unselectedLabelColor:
        isDark ? Colors.grey[500] : Colors.black.withOpacity(0.5),
        labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        unselectedLabelStyle:
        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        tabAlignment: TabAlignment.start,
        tabs: const [
          Tab(text: 'All'),
          Tab(text: 'Unanswered'),
          Tab(text: 'My Questions'),
          Tab(text: 'Answer'),
        ],
      ),
    );
  }

  Widget _buildAllTab(bool isDark) {
    final expertRemarks = _getExpertRemarks();
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          _buildBannerCarousel(isDark),
          SizedBox(height: 20.h),
          _buildNormalQuestionsList(isDark),
          SizedBox(height: 20.h),
          ...expertRemarks.map((remark) => Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ExpertRemarkCard(isDark: isDark, remark: remark),
          )),
        ],
      ),
    );
  }

  Widget _buildUnansweredTab(bool isDark) {
    final expertRemarks = _getExpertRemarks().take(2).toList();
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          _buildNormalQuestionsList(isDark),
          SizedBox(height: 20.h),
          ...expertRemarks.map((remark) => Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ExpertRemarkCard(isDark: isDark, remark: remark),
          )),
        ],
      ),
    );
  }

  Widget _buildMyQuestionsTab(bool isDark) {
    return Center(
      child: Text(
        'No My Questions yet',
        style: TextStyle(
          color: isDark ? Colors.grey[500] : Colors.grey[600],
          fontSize: 14.sp,
        ),
      ),
    );
  }

  Widget _buildAnswerTab(bool isDark) {
    final expertRemarks = _getExpertRemarks();
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          ...expertRemarks.map((remark) => Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ExpertRemarkCard(isDark: isDark, remark: remark),
          )),
        ],
      ),
    );
  }

  Widget _buildBannerCarousel(bool isDark) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
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
            width: 10.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getExpertRemarks() {
    return [
      {
        'initials': 'AK',
        'author': 'asit Kumar Roy',
        'question':
        'every times I repaid my dues beefore due dstr to branch app loan. never use emi option. paid always full due before due date. but recently i missed two emi of rs. 1,503 each. despite my email request that due to genuine financial hardship i am missed my rmi and repay soon they message me thst a legal notice will generate and file a court case. what to do now. i will abke to pay after 25 days',
        'expertRemark':
        'It can be done, please share more details\nRegards\nTeam AMA',
        'expertName': 'Anuj Anand Malik',
        'time': '4 days ago',
        'commentList': [
          {
            'author': 'Krishna',
            'text': 'new',
            'time': '4 minutes ago',
            'avatar': null,
          },
        ],
      },
      {
        'initials': 'PG',
        'author': 'Priya Gupta',
        'question':
        'Can I file for divorce without hiring a lawyer in India? What is the process and what are the legal requirements?',
        'expertRemark':
        'Yes, you can file for divorce without a lawyer through mutual consent. Both parties must file a joint petition under Section 13B of the Hindu Marriage Act. The process includes: 1) Filing the petition with 6-month separation period, 2) First motion after 6 months, 3) Second motion, 4) Court decree. However, for contested divorces, legal representation is strongly recommended.',
        'expertName': 'Neha Sharma',
        'time': '12 hours ago',
        'commentList': [],
      },
      {
        'initials': 'VS',
        'author': 'Vikram Singh',
        'question':
        'What are the labor laws for employees in private companies? What are my rights regarding working hours and leave?',
        'expertRemark':
        'Under Indian labor laws, private sector employees are covered by: 1) Working Hours: Maximum 9 hours/day and 48 hours/week under Shops Act, 2) Overtime: Double wages for overtime work, 3) Leave: 12 days casual leave, 12 days sick leave, and earned leave as per company policy, 4) PF & ESI: Mandatory for establishments with 20+ employees, 5) Gratuity: After 5 years of continuous service.',
        'expertName': 'Rajiv Mehta',
        'time': '1 day ago',
        'commentList': [],
      },
    ];
  }

  Widget _buildNormalQuestionsList(bool isDark) {
    final questions = [
      {
        'initials': 'MN',
        'author': 'MD Nur Alam',
        'question':
        'How can I protect my intellectual property rights for my startup?',
        'replies': 3,
        'time': '2 hours ago',
        'avatarColor': const Color(0xFF1A6B3C),
      },
      {
        'initials': 'RK',
        'author': 'Raj Kumar',
        'question':
        'What are the legal requirements for starting a business in India?',
        'replies': 5,
        'time': '5 hours ago',
        'avatarColor': const Color(0xFF6B1A1A),
      },
      {
        'initials': 'SJ',
        'author': 'Sanjay Jain',
        'question':
        'What is the process for property registration in Delhi?',
        'replies': 2,
        'time': '8 hours ago',
        'avatarColor': const Color(0xFF2E7D32),
      },
      {
        'initials': 'PG',
        'author': 'Priya Gupta',
        'question':
        'Can I file for divorce without hiring a lawyer in India?',
        'replies': 7,
        'time': '12 hours ago',
        'avatarColor': const Color(0xFFE91E63),
      },
      {
        'initials': 'VS',
        'author': 'Vikram Singh',
        'question':
        'What are the labor laws for employees in private companies?',
        'replies': 4,
        'time': '1 day ago',
        'avatarColor': const Color(0xFF9C27B0),
      },
      {
        'initials': 'AP',
        'author': 'Amit Patel',
        'question':
        'How to handle a consumer complaint against a service provider?',
        'replies': 6,
        'time': '2 days ago',
        'avatarColor': const Color(0xFF3F51B5),
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children:
        questions.map((q) => _buildQuestionCard(isDark, q)).toList(),
      ),
    );
  }

  Widget _buildQuestionCard(bool isDark, Map<String, dynamic> q) {
    return QuestionCard(isDark: isDark, question: q);
  }
}

class QuestionCard extends StatefulWidget {
  final bool isDark;
  final Map<String, dynamic> question;

  const QuestionCard({
    Key? key,
    required this.isDark,
    required this.question,
  }) : super(key: key);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool _showComments = false;
  final TextEditingController _commentController = TextEditingController();
  final List<Map<String, dynamic>> _localComments = [];

  @override
  void initState() {
    super.initState();
    final existing = List<Map<String, dynamic>>.from(
      widget.question['commentList'] ?? []
    );
    _localComments.addAll(existing);
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _submitComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _localComments.add({
        'author': 'You',
        'text': text,
        'time': 'Just now',
        'avatar': null,
      });
      _commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDark;
    final q = widget.question;

    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF1b170e)
            : const Color(0xFFd9bc7a),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark
              ? const Color(0xFF2A2A2A)
              : const Color(0xFFE0E0E0),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38.w,
                height: 38.h,
                decoration: BoxDecoration(
                  color:isDark
                      ? const Color(0xFF1b170e)
                      : const Color(0xFFd9bc7a)   ,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color(0xFFac9041), width: 1.5),
                ),
                child: Center(
                  child: Text(
                    q['initials'] as String,
                    style: TextStyle(
                      color: isDark
                          ?   Colors.white :Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                q['author'] as String,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            q['question'] as String,
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black87,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              GestureDetector(
                onTap: () =>
                    setState(() => _showComments = !_showComments),
                child: Row(
                  children: [
                    Icon(Icons.chat_bubble_outline_rounded,
                        size: 16.sp,
                        color: _showComments
                            ? const Color(0xFFFFD700)
                            : (isDark
                            ? Colors.grey[500]
                            : Colors.grey[600])),
                    SizedBox(width: 4.w),
                    Text(
                      '${_localComments.length}',
                      style: TextStyle(
                        color: _showComments
                            ? const Color(0xFFFFD700)
                            : (isDark
                            ? Colors.grey[500]
                            : Colors.grey[600]),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                q['time'] as String,
                style: TextStyle(
                  color: isDark ? Colors.grey[500] : Colors.grey[600],
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h,),
          if (_showComments)
            Container(
              decoration: BoxDecoration(
                color:  const Color(0xFFE8E8E8),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                    color: const Color(0xFFac9041), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.w, vertical: 12.h),
                    child: Row(
                      children: [
                        Text(
                          '${_localComments.length} Comment${_localComments.length == 1 ? '' : 's'}',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () =>
                              setState(() => _showComments = false),
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black54,
                            size: 22.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (_localComments.isEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 4.h),
                      child: Text(
                        'No comments yet. Be the first to comment!',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12.sp,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: _localComments.length,
                      separatorBuilder: (_, __) => Divider(
                        height: 1,
                        color: Colors.grey[300],
                        indent: 16.w,
                        endIndent: 16.w,
                      ),
                      itemBuilder: (context, index) {
                        return _buildCommentItem(_localComments[index]);
                      },
                    ),

                  SizedBox(height: 10.h),

                  Padding(
                    padding: EdgeInsets.only(
                        left: 12.w, right: 12.w, bottom: 14.h),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _commentController,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Write a comment...',
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 13.sp,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 12.h),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _submitComment,
                            child: Container(
                              margin: EdgeInsets.only(right: 6.w),
                              width: 36.w,
                              height: 36.h,
                              decoration: const BoxDecoration(
                                color: Color(0xFF3A3A3A),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.send_rounded,
                                color: Colors.white,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(Map<String, dynamic> comment) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
              border: Border.all(
                  color: const Color(0xFFac9041), width: 1),
            ),
            child: comment['avatar'] != null
                ? ClipOval(
              child: Image.asset(
                comment['avatar'] as String,
                fit: BoxFit.cover,
              ),
            )
                : Icon(Icons.person,
                color: Colors.grey[600], size: 20.sp),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment['author'] as String,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      comment['time'] as String,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  comment['text'] as String,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExpertRemarkCard extends StatefulWidget {
  final bool isDark;
  final Map<String, dynamic> remark;

  const ExpertRemarkCard({
    Key? key,
    required this.isDark,
    required this.remark,
  }) : super(key: key);

  @override
  State<ExpertRemarkCard> createState() => _ExpertRemarkCardState();
}

class _ExpertRemarkCardState extends State<ExpertRemarkCard> {
  bool _showComments = false;
  final TextEditingController _commentController = TextEditingController();
  final List<Map<String, dynamic>> _localComments = [];

  @override
  void initState() {
    super.initState();
    final existing = List<Map<String, dynamic>>.from(
      widget.remark['commentList'] ?? []
    );
    _localComments.addAll(existing);
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _submitComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _localComments.add({
        'author': 'You',
        'text': text,
        'time': 'Just now',
        'avatar': null,
      });
      _commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDark;
    final remark = widget.remark;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF1b170e)
            : const Color(0xFFd9bc7a),
            // : AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark
              ? const Color(0xFF2A2A2A)
              : const Color(0xFFE0E0E0),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Author row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFac9041),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          remark['initials'] as String,
                          style: TextStyle(
                            color: isDark
                                ? Colors.white
                                :Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      remark['author'] as String,
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                // Question text
                Text(
                  remark['question'] as String,
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black87,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 16.h),

                // Expert remark box
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFFE8E8E8)
                        : const Color(0xFFE8E8E8),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                        color: const Color(0xFFac9041), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Expert Remark label + green dot
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFFfadfb2),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Text(
                              'Expert Remark',
                              style: TextStyle(
                                color: isDark
                                    ? AppColors.backgroundDark
                                    : Colors.black,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 10.h,
                            width: 10.w,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),

                      // Remark text
                      Text(
                        remark['expertRemark'] as String,
                        style: TextStyle(
                          color: isDark
                              ? Colors.black87
                              : Colors.black87,
                          fontSize: 12.sp,
                          height: 1.4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),

                      // Expert logo + name
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/logo-removebg-preview.png",
                            width: 60.h,
                            height: 20.h,
                            color: const Color(0xFFac9041),
                          ),
                          Text(
                            '  ${remark['expertName'] as String}',
                            style: TextStyle(
                              color: isDark
                                  ? Colors.black87
                                  : Colors.black,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),

                // Footer: comment icon (tap to expand) + timestamp
                Row(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          setState(() => _showComments = !_showComments),
                      child: Row(
                        children: [
                          Icon(
                            Icons.chat_bubble_outline_rounded,
                            size: 16.sp,
                            color: _showComments
                                ? const Color(0xFFFFD700)
                                : (isDark
                                ? Colors.grey[500]
                                : Colors.black),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '${_localComments.length}',
                            style: TextStyle(
                              color: _showComments
                                  ? const Color(0xFFFFD700)
                                  : (isDark
                                  ? Colors.grey[500]
                                  : Colors.black),
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      remark['time'] as String,
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          if (_showComments)
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E8E8),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                      color: const Color(0xFFac9041), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      child: Row(
                        children: [
                          Text(
                            '${_localComments.length} Comment${_localComments.length == 1 ? '' : 's'}',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Divider(
                              color: Colors.grey[400],
                              thickness: 1,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: () =>
                                setState(() => _showComments = false),
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.black54,
                              size: 22.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (_localComments.isEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 4.h),
                        child: Text(
                          'No comments yet. Be the first to comment!',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12.sp,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: _localComments.length,
                        separatorBuilder: (_, __) => Divider(
                          height: 1,
                          color: Colors.grey[300],
                          indent: 16.w,
                          endIndent: 16.w,
                        ),
                        itemBuilder: (context, index) {
                          return _buildCommentItem(_localComments[index]);
                        },
                      ),

                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 12.w, right: 12.w, bottom: 14.h),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _commentController,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Write a comment...',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 13.sp,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 12.h),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: _submitComment,
                              child: Container(
                                margin: EdgeInsets.only(right: 6.w),
                                width: 36.w,
                                height: 36.h,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF3A3A3A),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.send_rounded,
                                  color: Colors.white,
                                  size: 16.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(Map<String, dynamic> comment) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar circle
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
              border: Border.all(
                  color: const Color(0xFFac9041), width: 1),
            ),
            child: comment['avatar'] != null
                ? ClipOval(
              child: Image.asset(
                comment['avatar'] as String,
                fit: BoxFit.cover,
              ),
            )
                : Icon(Icons.person,
                color: Colors.grey[600], size: 20.sp),
          ),
          SizedBox(width: 10.w),

          // Name + time + text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment['author'] as String,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      comment['time'] as String,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  comment['text'] as String,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}