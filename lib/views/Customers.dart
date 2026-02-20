import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:group_agent/controllers/ui_controller.dart';
import 'package:group_agent/models/ui_model.dart';
import '../../theme/app_colors.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContectController());

    final List<ContectModel> customers = [
      ContectModel(
        name: "Lakshmi Devi",
        customerId: "CUST001",
        phone: "8765432100",
        group: "Lakshmi Self Help Group",
        location: "Erode",
        status: "Verified",
      ),
      ContectModel(
        name: "Savitri Bai",
        customerId: "CUST002",
        phone: "8765432101",
        group: "Lakshmi Self Help Group",
        location: "Sitapur",
        status: "Verified",
      ),
      ContectModel(
        name: "Anita Kumari",
        customerId: "CUST003",
        phone: "8765432102",
        group: "Mahila Very Long Group Name Example",
        location: "Kurnool Andhra Pradesh",
        status: "Pending",
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F3C88),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Customers",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),

      body: Column(
        children: [
          /// SEARCH BAR
          Padding(
            padding: EdgeInsets.all(16.w),
            child: TextField(
              onChanged: controller.updateSearch,
              style: TextStyle(fontSize: 12.sp),
              decoration: InputDecoration(
                hintText: "Search by name, mobile, or ID",
                hintStyle: TextStyle(fontSize: 12.sp),
                prefixIcon: const Icon(Icons.search, size: 20),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          /// FILTER TABS (SMALL SIZE)
          Obx(
                () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  _filter("All", 0, controller),
                  _filter("Active", 1, controller),
                  _filter("Inactive", 2, controller),
                ],
              ),
            ),
          ),

          SizedBox(height: 8.h),

          /// LIST
          Expanded(
            child: Obx(() {
              final query = controller.searchQuery.value;
              final filter = controller.selectedFilter.value;

              final filteredList = customers.where((c) {
                final matchesSearch = query.isEmpty ||
                    c.name.toLowerCase().contains(query) ||
                    c.phone.contains(query) ||
                    c.customerId.toLowerCase().contains(query);

                final matchesStatus = filter == 0 ||
                    (filter == 1 && c.status == "Verified") ||
                    (filter == 2 && c.status != "Verified");

                return matchesSearch && matchesStatus;
              }).toList();

              if (filteredList.isEmpty) {
                return Center(
                  child: Text(
                    "No customers found",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: filteredList.length,
                itemBuilder: (_, index) {
                  return CustomerCard(customer: filteredList[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  /// FILTER CHIP (SMALL)
  Widget _filter(String text, int index, ContectController c) {
    final bool selected = c.selectedFilter.value == index;

    return GestureDetector(
      onTap: () => c.changeFilter(index),
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        padding:
        EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: selected
                ? AppColors.primary
                : Colors.grey.shade300,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11.sp,
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/// ================= CUSTOMER CARD =================

class CustomerCard extends StatelessWidget {
  final ContectModel customer;
  const CustomerCard({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final bool verified = customer.status == "Verified";

    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          /// TOP
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor:
                AppColors.primary.withOpacity(0.15),
                child: Text(
                  customer.name[0],
                  style: TextStyle(
                    fontSize: 15.sp, // max
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            customer.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        _statusChip(verified),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      customer.customerId,
                      style:
                      TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        const Icon(Icons.call,
                            size: 14, color: Colors.grey),
                        SizedBox(width: 6.w),
                        Text(
                          customer.phone,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          Divider(height: 16.h),

          /// BOTTOM
          Row(
            children: [
              _infoChip(Icons.group, customer.group),
              SizedBox(width: 10.w),
              _infoChip(Icons.location_on, customer.location),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusChip(bool verified) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: verified
            ? Colors.green.withOpacity(0.15)
            : Colors.orange.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        verified ? "Verified" : "Pending",
        style: TextStyle(
          fontSize: 10.sp,
          color: verified ? Colors.green : Colors.orange,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _infoChip(IconData icon, String text) {
    return Expanded(
      child: Container(
        padding:
        EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: AppColors.primary),
            SizedBox(width: 6.w),
            Expanded(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
