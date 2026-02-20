import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:group_agent/views/bottomNavigation.dart';
import 'controllers/ui_controller.dart';

void main() {
  Get.put(BottomNavController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: BottomNavigation(),
        );
      },
    );
  }
}