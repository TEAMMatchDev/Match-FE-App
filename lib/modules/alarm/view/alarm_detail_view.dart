import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../util/components/global_app_bar.dart';
import '../../../util/components/global_widget.dart';
import '../controller/alarm_detail_controller.dart';

class AlarmDetailScreen extends GetView<AlarmDetailController> {
  const AlarmDetailScreen({
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
              category: "알림 소분류",
              title: "알림 제목",
              date: "2023.04.13",
              onTap: () async {
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 23.h),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Text("텍스트")
          ]),
        ));
  }
}
