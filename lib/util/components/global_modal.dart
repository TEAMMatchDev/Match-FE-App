import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import 'package:match/util/method/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final Future<void> Function() onGrant;
  const CommonDialog(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onGrant});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        title: Center(child: Text(title, style: AppTextStyles.T1Bold16)),
        content: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(subtitle,
                  style: AppTextStyles.S1SemiBold13.copyWith(
                      color: AppColors.grey6)),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: CommonButton(
                    verticalPadding: 10,
                    onTap: () async {
                      Get.back();
                    },
                    text: "취소",
                    textColor: AppColors.black,
                  )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                      child: CommonButton(
                    verticalPadding: 10,
                    onTap: onGrant,
                    text: "설정하기",
                    textColor: AppColors.black,
                  ))
                ],
              )
            ],
          ),
        ));
  }

  factory CommonDialog.galleryPermission({required BuildContext context}) {
    return CommonDialog(
      title: "갤러리 권한 설정",
      subtitle: "갤러리 권한을 설정해야\n이미지를 업로드할 수 있습니다.",
      onGrant: () async {
        await openAppSettings();
      },
    );
  }
}
