import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../util/components/global_widget.dart';
import '../../../util/const/global_variable.dart';
import '../../home/widget/home_widget.dart';
import '../controller/project_controller.dart';

class ProjectScreen extends GetView<ProjectController> {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: SvgPicture.asset(
                iconDir + "ic_arrow_left_24.svg",
              ),
            )),
        actions: [LikeIcon(isLike: controller.isLike)],
      ),
      body: Text("fdsf"),
    );
  }
}
