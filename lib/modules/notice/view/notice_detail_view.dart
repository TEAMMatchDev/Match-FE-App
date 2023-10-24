import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../util/components/global_app_bar.dart';
import '../../../util/components/global_widget.dart';
import '../controller/notice_detail_controller.dart';

class NoticeDetailScreen extends GetView<NoticeDetailController> {
  const NoticeDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar.basic("알림"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CommonListItem(
              category: controller.noticeDetail.value.noticeInfo.noticeType,
              title: controller.noticeDetail.value.noticeInfo.title,
              date: controller.noticeDetail.value.noticeInfo.noticeDate,
              onTap: () async {
                // Get.toNamed(Routes.notice_detail);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 23.h),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
            //TODO: controller.noticeDetail.value.noticeType에 따라 이미지, 텍스트
            Text("텍스트")
          ]),
        ));
  }
}
