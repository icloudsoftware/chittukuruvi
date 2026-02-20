import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'new_group_screen.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
        elevation: 0,
        backgroundColor: Colors.blue,
        title: const Text("Groups", style: TextStyle(color: Colors.white)),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewGroupScreen()),
                );
              },
              icon: Icon(Icons.add, color: Colors.green),
            ),
          ),
          SizedBox(width: 12.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search groups by name or village",
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            Expanded(
              child: ListView(
                children: [
                  _groupCard(),
                  SizedBox(height: 14.h),
                  _groupCard(name: "Gayatri Women Group", code: "GRP002"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _groupCard({
    String name = "Lakshmi Self Help Group",
    String code = "GRP001",
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(color: Colors.black12.withOpacity(0.06), blurRadius: 12),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 26.r,
                backgroundColor: const Color(0xFFE6FAF7),
                child: Icon(Icons.groups, color: Colors.green, size: 28.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      code,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8FFF8),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: const Text(
                  "Active",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),


          Text(
            "Women empowerment group focused on small business loans",
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),

          SizedBox(height: 14.h),


          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F6FB),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoItem(Icons.groups, "12", "Members"),
                _infoItem(
                  Icons.account_balance_wallet,
                  "₹1,20,000",
                  "Total Loans",
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),


          Row(
            children: [
              _tag(Icons.calendar_today, "Weekly"),
              SizedBox(width: 12.w),
              _tag(Icons.location_on, "Ramapuram"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoItem(IconData icon, String value, String label) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: Colors.blueGrey),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _tag(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: Colors.blue),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
        ),
      ],
    );
  }
}
