import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_agent/theme/app_colors.dart';

class NewGroupScreen extends StatefulWidget {
  const NewGroupScreen({super.key});

  @override
  State<NewGroupScreen> createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  String selectedFrequency = "Weekly";

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("New Group"),
        centerTitle: true,
        leading: const BackButton(),
      ),


      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 90.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 32.r,
                    backgroundColor: const Color(0xFFE3F2FD),
                    child: Icon(Icons.groups, size: 32.sp, color: Colors.blue),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Create New Group",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Set up a new self-help group for\ncommunity lending",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            Text(
              "Basic Information",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 12.h),
            _inputField("Group Name *", "Enter group name"),
            SizedBox(height: 12.h),
            _inputField("Village *", "Enter village name"),
            SizedBox(height: 12.h),
            _inputField(
              "Description (Optional)",
              "Brief description of the group",
              maxLines: 3,
            ),

            SizedBox(height: 20.h),

            Text(
              "Collection Settings",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 12.h),
            Text("Collection Frequency *", style: TextStyle(fontSize: 14.sp)),

            SizedBox(height: 10.h),
            Row(
              children: ["Daily", "Weekly", "Monthly"].map((item) {
                final isSelected = selectedFrequency == item;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedFrequency = item),
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Center(
                        child: Text(
                          item,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 16.h),

            Container(
              height: 60.h,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info, color: Colors.blue),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      "You can add members and assign loans after creating the group",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      /// PINNED BUTTON
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.w),
        child: SizedBox(
          height: 35.h,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.check,color: Colors.white,),
            label: const Text("Create Group",style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _inputField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14.sp)),
        SizedBox(height: 6.h),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding:
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }
}
