import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';


class InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoChip({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffF6F8FC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 6),
          Text(text,style: TextStyle(fontSize: 12.sp),),
        ],
      ),
    );
  }
}


class IncentiveCard extends StatelessWidget {
  final String date;
  final double amount;
  final String status;
  final double collectionPercent;
  final double collectionAmount;

  const IncentiveCard({
    super.key,
    required this.date,
    required this.amount,
    required this.status,
    required this.collectionPercent,
    required this.collectionAmount,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color bg;

    switch (status) {
      case "Pending":
        color = Colors.red;
        bg = Colors.red.withOpacity(0.1);
        break;
      case "Approved":
        color = Colors.orange;
        bg = Colors.orange.withOpacity(0.1);
        break;
      case "Paid":
        color = Colors.green;
        bg = Colors.green.withOpacity(0.1);
        break;
      default:
        color = Colors.grey;
        bg = Colors.grey.withOpacity(0.1);
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                  SizedBox(width: 6.w),
                  Text(
                    date,
                    style: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              _statusChip(status, color, bg),
            ],
          ),

          SizedBox(height: 16.h),

          /// TOTAL INCENTIVE
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Column(
              children: [
                Text(
                  "Total Incentive",
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                SizedBox(height: 6.h),
                Text(
                  "₹${amount.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 18.h),

          /// BREAKDOWN
          Text(
            "Breakdown",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 12.h),

          _breakdownRow(
            "Collection (${collectionPercent.toStringAsFixed(0)}%)",
            "₹${amount.toStringAsFixed(2)}",
            Colors.black,
          ),

          SizedBox(height: 8.h),

          _breakdownRow(
            "Collection Amount",
            "₹${collectionAmount.toStringAsFixed(2)}",
            Colors.grey,
          ),

          SizedBox(height: 16.h),

          /// WAITING ADMIN APPROVAL
          if (status == "Pending")
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline,
                      size: 18, color: Colors.orange),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      "Awaiting admin approval",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
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

  /// STATUS CHIP
  Widget _statusChip(String text, Color color, Color bg) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// BREAKDOWN ROW
  Widget _breakdownRow(String title, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 13.sp, color: Colors.grey),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}

