import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  final TextEditingController nameCtrl =
  TextEditingController(text: "Agent Name");
  final TextEditingController mobileCtrl =
  TextEditingController(text: "9876543210");
  final TextEditingController emailCtrl =
  TextEditingController(text: "agent@mail.com");
  final TextEditingController areaCtrl =
  TextEditingController(text: "Chennai");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FB),

      /// APP BAR WITH GRADIENT
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xFF1F3C88),
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [Color(0xFF43CEA2), Color(0xFF185A9D)],
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //     ),
        //   ),
        // ),
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isEditing ? Icons.check_circle : Icons.edit_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() => isEditing = !isEditing);
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [

            /// PROFILE CARD
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [

                  /// AVATAR
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color(0xFF43CEA2), Color(0xFF185A9D)],
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 42.r,
                          backgroundColor: Colors.white,
                          child: Text(
                            "A",
                            style: TextStyle(
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF185A9D),
                            ),
                          ),
                        ),
                      ),

                      /// STATUS DOT
                      Positioned(
                        bottom: 6,
                        right: 6,
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),


                  SizedBox(height: 20.h),

                  _field(Icons.person_outline, Colors.blue,
                      "Name", nameCtrl),

                  _field(Icons.phone_outlined, Colors.green,
                      "Mobile Number", mobileCtrl,
                      keyboard: TextInputType.phone),

                  _field(Icons.email_outlined, Colors.deepPurple,
                      "Email", emailCtrl,
                      keyboard: TextInputType.emailAddress),

                  _field(Icons.location_on_outlined, Colors.orange,
                      "Area", areaCtrl),
                ],
              ),
            ),

            SizedBox(height: 15.h),

            /// LOGOUT CARD
            InkWell(
              borderRadius: BorderRadius.circular(14.r),
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF5F6D), Color(0xFFFF9068)],
                  ),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.logout_outlined, color: Colors.white),
                    SizedBox(width: 10.w),
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  /// COLOURED INPUT FIELD
  Widget _field(
      IconData icon,
      Color iconColor,
      String label,
      TextEditingController controller, {
        TextInputType keyboard = TextInputType.text,
      }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 6.h),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: isEditing
                    ? iconColor
                    : const Color(0xFFE3E7EE),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(icon, size: 18, color: iconColor),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: isEditing
                      ? TextFormField(
                    controller: controller,
                    keyboardType: keyboard,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                    ),
                  )
                      : Text(
                    controller.text,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black87,
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
}
