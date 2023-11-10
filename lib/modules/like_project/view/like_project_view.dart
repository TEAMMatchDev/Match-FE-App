import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/like_project/controller/like_project_controller.dart';

import '../../../util/components/global_app_bar.dart';
import '../../donate/widget/donate_widget.dart';

class LikeProjectScreen extends GetView<LikeProjectController> {
  const LikeProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("내가 찜한 기부처"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        child: Obx(
          () => ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 14.h),
            itemCount: controller.projectList.length,
            itemBuilder: (context, index) {
              final project = controller.projectList[index];
              return ProjectWidget(project: project);
            },
          ),
        ),
      ),
    );
  }
}
