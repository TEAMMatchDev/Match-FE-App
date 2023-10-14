import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_widget.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';
import '../controller/mypage_controller.dart';

class NoticeScreen extends GetView<MypageController> {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar.basic("공지사항"),
        body: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "총 공지사항",
                    style: AppTextStyles.L1Medium14.copyWith(
                        color: AppColors.grey8),
                  ),
                  TextSpan(
                    text: " 22",
                    style: AppTextStyles.L1Medium14.copyWith(
                        color: AppColors.primary500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.separated(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CommonListItem(
                      category: "공지사항 소분류", title: "알림 제목", date: "2023.04.13");
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
