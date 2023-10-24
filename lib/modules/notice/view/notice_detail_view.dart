import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../util/components/global_app_bar.dart';
import '../../../util/components/global_widget.dart';
import '../../../util/const/style/global_text_styles.dart';
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
            ...controller.noticeDetail.value.noticeContents.map((content) {
              return content.contentsType == "IMG"
                  ? Image.network(
                      content.contents,
                      width: double.infinity,
                    )
                  : Text(
                      content.contents,
                      style: AppTextStyles.S1SemiBold14,
                    );
            }).toList(),
          ]),
        ));
  }
}
