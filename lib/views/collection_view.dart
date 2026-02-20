import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_agent/views/record_collection.dart';

import '../theme/app_colors.dart';
import '../theme/app_text.dart';

class CollectionsView extends StatelessWidget {
  const CollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyData = [
      {
        "name": "Lakshmi Devi",
        "loanId": "LOAN001",
        "status": AppTexts.completed,
        "due": "₹220",
        "collected": "₹220",
        "mode": "Cash",
        "date": "23/1/2026",
      },
      {
        "name": "Anita Kumari",
        "loanId": "LOAN003",
        "status": AppTexts.completed,
        "due": "₹150",
        "collected": "₹150",
        "mode": "Cash",
        "date": "23/1/2026",
      },
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.background,

        /// 🔵 APP BAR
        appBar: AppBar(
          backgroundColor: const Color(0xFF1F3C88),
          elevation: 0,
          title: Text(
            AppTexts.collections,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),

        floatingActionButton: Padding(
          padding:  EdgeInsets.only(bottom: 75.h),
          child: FloatingActionButton(
            backgroundColor: Color(0xFF1F3C88),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RecordCollectionView()),
              );
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),

        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🗂 TAB BAR (smaller height)
              TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                indicator: BubbleTabIndicator(
                  indicatorHeight: 30.h,
                  indicatorColor: AppColors.primary,
                  indicatorRadius: 16.r,
                ),
                tabs: const [
                  Tab(text: AppTexts.all),
                  Tab(text: AppTexts.today),
                  Tab(text: AppTexts.thisWeek),
                ],
              ),

              SizedBox(height: 12.h),

              /// 📊 SUMMARY
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _stat(AppTexts.totalCollected, "₹370"),
                    Container(height: 24.h, width: 1, color: Colors.grey[300]),
                    _stat(AppTexts.customers, "2"),
                  ],
                ),
              ),

              /// 📋 LIST
              Expanded(
                child: TabBarView(
                  children: List.generate(
                    3,
                    (_) => ListView.builder(
                      padding: EdgeInsets.all(16.w),
                      itemCount: dummyData.length,
                      itemBuilder: (_, index) =>
                          _collectionCard(dummyData[index]),
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

  /// 📊 SUMMARY ITEM
  Widget _stat(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
        ),
        SizedBox(height: 6.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
      ],
    );
  }

  /// 🧾 COLLECTION CARD
  Widget _collectionCard(Map<String, String> item) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(color: Colors.black12.withOpacity(0.05), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["name"]!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Loan: ${item["loanId"]}",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.green.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  item["status"]!,
                  style: TextStyle(fontSize: 12.sp, color: AppColors.green),
                ),
              ),
            ],
          ),

          Divider(height: 22.h),

          _row("Due Amount", item["due"]!),
          _row("Collected", item["collected"]!, valueColor: AppColors.green),
          _row("Payment Mode", item["mode"]!),
          _row("Date", item["date"]!),
        ],
      ),
    );
  }

  /// 📌 ROW ITEM
  Widget _row(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
