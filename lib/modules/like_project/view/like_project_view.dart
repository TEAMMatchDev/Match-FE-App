import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/like_project/controller/like_project_controller.dart';

import '../../../provider/api/util/global_api_field.dart';
import '../../../util/components/global_app_bar.dart';
import '../../donate/widget/donate_widget.dart';

class LikeProjectScreen extends GetView<LikeProjectController> {
  const LikeProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("오늘의 후원"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        child: Obx(
          () => ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 14.h),
            itemCount: controller.projectList.length,
            itemBuilder: (context, index) {
              //pagination 처리
              if (index % (PAGINATION_SIZE - 1) == 0 && index != 0) {
                Future.wait({
                  controller.getMoreProject(
                      index: index ~/ (PAGINATION_SIZE - 1))
                });
              }
              final project = controller.projectList[index];
              return ProjectWidget(project: project);
            },
          ),
        ),
      ),
    );
  }
}
