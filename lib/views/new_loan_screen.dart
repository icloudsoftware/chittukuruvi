// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class NewLoanScreen extends StatefulWidget {
//   const NewLoanScreen({super.key});
//
//   @override
//   State<NewLoanScreen> createState() => _NewLoanScreenState();
// }
//
// class _NewLoanScreenState extends State<NewLoanScreen> {
//   String selectedLoanType = "Individual";
//   String collection = "Daily";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F9FC),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: const BackButton(color: Colors.black),
//         title: Text(
//           "New Loan",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20.sp,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.all(15.w),
//         child: SizedBox(
//           height: 40.h,
//           child: ElevatedButton.icon(
//             onPressed: () {},
//             icon: const Icon(Icons.check_circle,color: Colors.white,),
//             label: Text(
//               "Create Loan",
//               style: TextStyle(fontSize: 15.sp,color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF2F6FED),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(14.r),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _sectionTitle("Loan Type"),
//             Row(
//               children: [
//                 _toggleButton(
//                   "Individual",
//                   selectedLoanType == "Individual",
//                   onTap: () {
//                     setState(() {
//                       selectedLoanType = "Individual";
//                     });
//                   },
//                 ),
//                 SizedBox(width: 12.w),
//                 _toggleButton(
//                   "Group",
//                   selectedLoanType == "Group",
//                   onTap: () {
//                     setState(() {
//                       selectedLoanType = "Group";
//                     });
//                   },
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 24.h),
//
//             _sectionTitle("Select Customer"),
//             _customerCard("Lakshmi Devi", "CUST001"),
//             SizedBox(height: 12.h),
//             _customerCard("Savitri Bai", "CUST002"),
//
//             SizedBox(height: 24.h),
//
//             /// Loan Details
//             _sectionTitle("Loan Details"),
//             _inputField("Loan Amount *", "Enter amount"),
//             _inputField("Interest Rate (%)", "0%", value: true),
//             _inputField("Tenure (Weeks)", "52", value: true),
//
//             SizedBox(height: 16.h),
//
//             /// Collection Frequency
//             _sectionTitle("Collection Frequency"),
//             Row(
//               children: [
//               _toggleButton(
//               "Daily",
//               selectedLoanType == "Daily",
//               onTap: () {
//                 setState(() {
//                   selectedLoanType = "Daily";
//                 });
//               },
//             ),
//                 SizedBox(width: 12.w),
//                 _toggleButton(
//                   "Weekly",
//                   selectedLoanType == "Weekly",
//                   onTap: () {
//                     setState(() {
//                       selectedLoanType = "Weekly";
//                     });
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 80.h),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // ---------- Widgets ----------
//   Widget _sectionTitle(String text) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 12.h),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 18.sp,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }
//
//   Widget _toggleButton(
//       String text,
//       bool active, {
//         required VoidCallback onTap,
//       }) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           height: 48.h,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: active ? const Color(0xFF2F6FED) : Colors.white,
//             borderRadius: BorderRadius.circular(14.r),
//             border: Border.all(color: const Color(0xFFDCE3F0)),
//           ),
//           child: Text(
//             text,
//             style: TextStyle(
//               fontSize: 16.sp,
//               color: active ? Colors.white : Colors.black,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget _customerCard(String name, String code) {
//     return Container(
//       width: 900.w,
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14.r),
//         border: Border.all(color: const Color(0xFFDCE3F0)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             name,
//             style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 4.h),
//           Text(
//             code,
//             style: TextStyle(fontSize: 14.sp, color: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _inputField(String label, String hint, {bool value = false}) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 16.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label, style: TextStyle(fontSize: 14.sp)),
//           SizedBox(height: 8.h),
//           TextField(
//             controller: value ? TextEditingController(text: hint) : null,
//             decoration: InputDecoration(
//               hintText: hint,
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 16.w,
//                 vertical: 14.h,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(14.r),
//                 borderSide: const BorderSide(color: Color(0xFFDCE3F0)),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(14.r),
//                 borderSide: const BorderSide(color: Color(0xFFDCE3F0)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
