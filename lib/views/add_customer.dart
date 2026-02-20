import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

class AddCustomerView extends StatefulWidget {
  const AddCustomerView({super.key});

  @override
  State<AddCustomerView> createState() => _AddCustomerViewState();
}

class _AddCustomerViewState extends State<AddCustomerView> {
  int selectedGroup = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Add Customer",
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ---------------- PERSONAL INFO ----------------
            _sectionTitle("Personal Information"),

            _input("Full Name *", "Enter full name"),
            _input("Mobile Number *", "10-digit mobile number",
                keyboard: TextInputType.phone),
            _input("Aadhaar Number *", "XXXX-XXXX-XXXX",
                keyboard: TextInputType.number),
            _input("Voter ID (Optional)", "Voter ID number"),

            SizedBox(height: 24.h),

            /// ---------------- ADDRESS ----------------
            _sectionTitle("Address"),

            _input("Village *", "Enter village"),
            _input("Taluk *", "Enter taluk"),
            _input("District *", "Enter district"),
            _input(
              "Full Address (Optional)",
              "House number, street, landmarks",
              maxLines: 3,
            ),

            SizedBox(height: 24.h),

            /// ---------------- GROUP ASSIGNMENT ----------------
            _sectionTitle("Group Assignment (Optional)"),

            _groupCard(
              index: 0,
              name: "Lakshmi Self Help Group",
              code: "GRP001",
              members: "12 members",
              frequency: "Weekly",
            ),
            _groupCard(
              index: 1,
              name: "Gayatri Women Group",
              code: "GRP002",
              members: "15 members",
              frequency: "Daily",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.w),
        child: SizedBox(
          height: 35.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size(double.infinity, 50.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_add, color: Colors.white),
                SizedBox(width: 10.w),
                Text(
                  "Add Customer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ---------------- SECTION TITLE ----------------
  Widget _sectionTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// ---------------- INPUT ----------------
  Widget _input(
      String label,
      String hint, {
        int maxLines = 1,
        TextInputType keyboard = TextInputType.text,
      }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6.h),
          TextField(
            maxLines: maxLines,
            keyboardType: keyboard,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ---------------- GROUP CARD ----------------
  Widget _groupCard({
    required int index,
    required String name,
    required String code,
    required String members,
    required String frequency,
  }) {
    final selected = selectedGroup == index;
    return GestureDetector(
      onTap: () => setState(() => selectedGroup = index),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: selected ? Colors.blue : Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  code,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.group, size: 18.sp, color: Colors.grey),
                SizedBox(width: 6.w),
                Text(members, style: TextStyle(color: Colors.grey)),
                SizedBox(width: 16.w),
                Icon(Icons.access_time,
                    size: 18.sp, color: Colors.grey),
                SizedBox(width: 6.w),
                Text(frequency, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
