import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/provider/api/util/pagination_function.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_widget.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../provider/routes/routes.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_logger.dart';
import '../../../util/const/style/global_text_styles.dart';
import '../controller/notice_controller.dart';

class NoticeScreen extends GetView<NoticeController> {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar.basic("공지사항"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Obx(
            ()=>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "총 공지사항",
                          style: AppTextStyles.T1Bold14.copyWith(
                              color: AppColors.grey8),
                        ),
                        TextSpan(
                          text: " ${controller.totalNotice.value}",
                          style: AppTextStyles.T1Bold14.copyWith(
                              color: AppColors.primary500),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.noticeList.length,
                  itemBuilder: (context, index) {
                   getMoreData(index: index, totalCnt: controller.noticeList.length, getMore: controller.getMoreNotice);
                    final notice = controller.noticeList[index];
                    return CommonListItem(
                      category: notice.noticeType,
                      title: notice.title,
                      date: notice.noticeDate,
                      onTap: () async {
                        Get.toNamed(Routes.notice_detail,
                            arguments: {"id": notice.noticeId});
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: const Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
