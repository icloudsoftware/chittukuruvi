import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../widgets/Common_card.dart';

class IncentivesScreen extends StatefulWidget {
  const IncentivesScreen({super.key});

  @override
  State<IncentivesScreen> createState() => _IncentivesScreenState();
}

class _IncentivesScreenState extends State<IncentivesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> incentives = [
    {"date": "23/01/2026", "amount": 7.40, "status": "Pending"},
    {"date": "22/01/2026", "amount": 12.00, "status": "Approved"},
    {"date": "20/01/2026", "amount": 20.00, "status": "Paid"},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F8FC),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          "Incentives",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 12.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: false,
              dividerColor: Colors.transparent,

              indicator: BubbleTabIndicator(
                indicatorHeight: 36.h,
                indicatorColor: Colors.blue,
                indicatorRadius: 20.r,
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 6.h,
                ),
              ),

              labelColor: Colors.white,
              unselectedLabelColor: Colors.black87,

              labelStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),

              tabs: const [
                Tab(child: Center(child: Text("All"))),
                Tab(child: Center(child: Text("Pending"))),
                Tab(child: Center(child: Text("Approve"))),
                Tab(child: Center(child: Text("Paid"))),
              ],
            ),


          ),

          SizedBox(height: 12.h),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildList(incentives),
                _buildList(_filter("Pending")),
                _buildList(_filter("Approved")),
                _buildList(_filter("Paid")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _filter(String status) =>
      incentives.where((e) => e["status"] == status).toList();

  Widget _buildList(List<Map<String, dynamic>> list) {
    if (list.isEmpty) {
      return const Center(child: Text("No incentives"));
    }

    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: list.length,
      itemBuilder: (_, i) {
        final item = list[i];

        return IncentiveCard(
          date: item["date"],
          amount: item["amount"],
          status: item["status"],
          collectionPercent: 2,
          collectionAmount: 370.00,
        );
      },
    );
  }
}

/// TAB ITEM (same as Loans)
Widget _tabItem(String text, double width) {
  return SizedBox(
    height: 30.h,
    width: width,
    child: Center(
      child: Text(text, maxLines: 1, style: TextStyle(fontSize: 12.sp)),
    ),
  );
}
