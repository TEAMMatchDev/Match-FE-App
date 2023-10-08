import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../home/widget/home_widget.dart';

class ProjectComment extends StatelessWidget {
  final String profileUrl;
  final String profile;
  final String comment;
  final String timeStamp;
  final bool isEdit;
  const ProjectComment(
      {super.key,
      required this.profileUrl,
      required this.profile,
      required this.comment,
      required this.timeStamp,
      this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileItem(profileUrl: profileUrl, isBorder: false),
          SizedBox(width: 11.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile,
                  style: AppTextStyles.T1Bold13,
                ),
                SizedBox(height: 6.h),
                Text(
                  comment,
                  style: AppTextStyles.S1SemiBold12.copyWith(
                      color: AppColors.grey7),
                ),
                SizedBox(height: 6.h),
                SizedBox(
                  width: 251.w,
                  child: Text(
                    timeStamp,
                    style: AppTextStyles.L1Medium10.copyWith(
                        color: AppColors.grey4),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          isEdit
              ? GestureDetector(
                  onTap: () {
                    Get.bottomSheet(AlertBottomSheet());
                  },
                  child: SvgPicture.asset(iconDir + "ic_more_18.svg"))
              : SizedBox.shrink()
        ],
      ),
    );
  }
}

class AlertBottomSheet extends StatelessWidget {
  const AlertBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 27.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Column(
          children: [
            _bottomSheetItem(
                icon: "ic_alert_18.svg",
                text: "신고하기",
                onTap: () async {
                  //TODO: 신고하기 api 호출
                }),
            _bottomSheetItem(
                icon: "ic_block_18.svg",
                text: "차단하기",
                onTap: () async {
                  //TODO: 삭제하기 api 호출
                }),
            CommonButton.payment(
                text: "취소",
                verticalPadding: 13,
                onTap: () async {
                  Get.back();
                })
          ],
        ),
      ),
    );
  }

  Widget _bottomSheetItem(
      {required String icon,
      required String text,
      required Future<void> Function() onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
      child: Row(
        children: [
          SvgPicture.asset(iconDir + icon),
          SizedBox(
            width: 12.w,
          ),
          Text(text, style: AppTextStyles.T1Bold15),
        ],
      ),
    );
  }
}
