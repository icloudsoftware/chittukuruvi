import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/ui_controller.dart';
import 'dashboard_view.dart';
import 'collection_view.dart';
import 'Customers.dart';
import 'loan_screen.dart';
import 'profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final BottomNavController controller =
  Get.find<BottomNavController>();

  late final NotchBottomBarController notchController;

  final pages = const [
    DashboardView(),
    CollectionsView(),
    CustomersView(),
    LoansScreen(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    notchController = NotchBottomBarController(index: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // 🔥 keep both in sync
      if (notchController.index != controller.currentIndex.value) {
        notchController.index = controller.currentIndex.value;
      }

      return Scaffold(
        extendBody: true,

        body: IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),

        bottomNavigationBar: AnimatedNotchBottomBar(
          notchBottomBarController: notchController,

          bottomBarHeight: 52,
          kIconSize: 20,
          kBottomRadius: 32,

          color: Colors.white,
          notchColor: Color(0xFF1F3C88),
          showLabel: false,

          bottomBarItems: const [
            BottomBarItem(
              inActiveItem:
              Icon(Icons.home_outlined, color: Colors.black),
              activeItem:
              Icon(Icons.home, color: Colors.white),
              itemLabel: 'Home',
            ),
            BottomBarItem(
              inActiveItem:
              Icon(Icons.receipt_long_outlined, color: Colors.black),
              activeItem:
              Icon(Icons.receipt_long, color: Colors.white),
              itemLabel: 'Collections',
            ),
            BottomBarItem(
              inActiveItem:
              Icon(Icons.person_outline, color: Colors.black),
              activeItem:
              Icon(Icons.person, color: Colors.white),
              itemLabel: 'Customers',
            ),
            BottomBarItem(
              inActiveItem:
              Icon(Icons.account_balance_outlined, color: Colors.black),
              activeItem:
              Icon(Icons.account_balance, color: Colors.white),
              itemLabel: 'Loans',
            ),
            BottomBarItem(
              inActiveItem:
              Icon(Icons.more_horiz, color: Colors.black),
              activeItem:
              Icon(Icons.more_horiz, color: Colors.white),
              itemLabel: 'More',
            ),
          ],

          onTap: controller.changeIndex, // ✅ ONLY THIS
        ),
      );
    });
  }
}
