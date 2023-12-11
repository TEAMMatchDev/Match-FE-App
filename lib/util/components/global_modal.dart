import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/payment/view/payment_expire_view.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import 'package:match/util/method/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../provider/api/payment_api.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Future<void> Function() onGrant;
  final String grantText;

  const CommonDialog(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onGrant,
      this.grantText = "설정하기"});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
          child: Text(title, style: AppTextStyles.T1Bold16),
        ),
        content: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              subtitle != null
                  ? Text(subtitle!,
                      style: AppTextStyles.S1SemiBold13.copyWith(
                          color: AppColors.grey6))
                  : SizedBox.shrink(),
              Divider(
                thickness: 1,
                color: AppColors.divider1,
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        Get.back();
                      },
                      child: Text(
                        "취소",
                        style: AppTextStyles.T1Bold14,
                      ),
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: VerticalDivider(
                      thickness: 1,
                      color: AppColors.divider1,
                    ),
                  ),
                  Expanded(
                      child: Center(
                    child: GestureDetector(
                      onTap: onGrant,
                      child: Text(
                        grantText,
                        style: AppTextStyles.T1Bold14,
                      ),
                    ),
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

  factory CommonDialog.payDelete(
      {required BuildContext context, required int regularId}) {
    return CommonDialog(
      title: "정기기부를 해지하시겠어요?",
      subtitle: null,
      grantText: "해지하기",
      onGrant: () async {
        var result = await PaymentApi.deleteDonate(regularId: regularId);
        if(result){
          await Get.to(() => const PaymentExpireScreen());
        }
      },
    );
  }

  factory CommonDialog.delete(
      {required BuildContext context,
      required Future<void> Function() onGrant}) {
    return CommonDialog(
      title: "댓글을 삭제하시겠어요?",
      subtitle: null,
      grantText: "삭제하기",
      onGrant: onGrant,
    );
  }

  factory CommonDialog.report(
      {required String text,
      required BuildContext context,
      required Future<void> Function() onGrant}) {
    return CommonDialog(
      title: "정말 댓글을 $text하시겠어요?",
      subtitle: null,
      grantText: text,
      onGrant: onGrant,
    );
  }
}
