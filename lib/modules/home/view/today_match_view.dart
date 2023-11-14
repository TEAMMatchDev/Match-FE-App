// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:match/modules/home/controller/home_controller.dart';
// import 'package:match/util/components/global_app_bar.dart';
// import '../../../model/today_project/today_project.dart';
// import '../../donate/widget/donate_widget.dart';
//
// ///<h2>오늘의 후원 화면</h2>
// ///[HomeController]에서 [TodayProject]를 받아와서 화면에 뿌려준다.</br></br>
// ///[HomeController]에서 [HomeSceen]이 그려질때 해당 데이터를 가져오기때문에
// /// 같은 Controller및 Binding 사용
// class TodayMatchScreen extends GetView<HomeController> {
//   const TodayMatchScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonAppBar.basic("오늘의 후원"),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
//         child: Obx(
//           () => ListView.separated(
//             separatorBuilder: (context, index) => SizedBox(height: 14.h),
//             itemCount: controller.projectList.length,
//             itemBuilder: (context, index) {
//               final project = controller.projectList[index];
//               return ProjectWidget(project: project);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
