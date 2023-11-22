import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/util/const/global_variable.dart';

import '../../../model/popup/popup_info.dart';
import '../../../provider/routes/routes.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

Widget ReviewModal({required PopupInfo popupInfo}) {
  return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      title: Text("'${popupInfo.title}'\n정기 후원이 집행 완료되었습니다🎉",
          textAlign: TextAlign.center, style: AppTextStyles.T1Bold16),
      titlePadding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w)
          .copyWith(bottom: 0.h),
      content: IntrinsicHeight(
          child: Column(children: [
        Text(
          "MATCH와 함께 한 후원 마음에 드셨나요?",
          style: AppTextStyles.S1SemiBold14.copyWith(color: AppColors.grey7),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 27.h,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.black,
          ),
          child: thumbsTextButton(
              icon: "up",
              text: "좋아요",
              onTap: () async {
                Get.toNamed(Routes.review,
                    arguments: {"executionId": popupInfo.executionId});
              }),
        ),
        SizedBox(
          height: 14.h,
        ),
        thumbsTextButton(
          icon: "down",
          text: "아니요",
          color: AppColors.grey5,
        )
      ])));
}

Widget thumbsTextButton(
    {required String icon,
    required String text,
    Color color = Colors.white,
    Future<void> Function()? onTap}) {
  return GestureDetector(
    onTap: () {
      if (onTap != null) {
        onTap();
      } else {
        Get.back();
      }
    },
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "${iconDir}survey/ic_thumb_${icon}_16.svg",
            color: color,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            text,
            style: AppTextStyles.S1SemiBold15.copyWith(color: color),
          )
        ],
      ),
    ),
  );
}

class RateWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Rx<int> rate;

  const RateWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.S1SemiBold14,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            subtitle,
            style: AppTextStyles.L1Medium12.copyWith(
              color: AppColors.grey7,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5,
                (index) => Container(
                      margin: EdgeInsets.only(right: 5.w),
                      child: GestureDetector(
                        onTap: () {
                          rate.value = index;
                        },
                        child: SvgPicture.asset(
                          "${iconDir}survey/ic_rate_${index}_30.svg",
                          color: rate.value == index
                              ? AppColors.grey5
                              : AppColors.grey1,
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
