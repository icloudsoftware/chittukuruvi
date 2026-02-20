import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterTab extends StatelessWidget {
  final String title;
  const FilterTab({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(title),
    );
  }
}
