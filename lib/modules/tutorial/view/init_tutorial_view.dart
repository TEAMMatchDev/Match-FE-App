import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/util/components/global_button.dart';

import '../../../provider/routes/routes.dart';
import '../../../provider/service/auth_service.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

class InitTutorialScreen extends StatelessWidget {
  const InitTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "M",
                    style: AppTextStyles.L1Medium14.copyWith(
                        color: AppColors.primaryRed, fontSize: 20.sp),
                  ),
                  TextSpan(
                    text:
                        "ATCH 서비스 체험을 위해\n${AuthService.to.myProfile.value.name}님께 기부금 1원을 드렸어요.",
                    style: AppTextStyles.L1Medium14.copyWith(fontSize: 20.sp),
                  ),
                ])),
              ),
            ),
            CommonButton.edit(
              text: "기부 체험 시작하기",
              verticalPadding: 14,
              onTap: () async {
                await Get.toNamed(Routes.tutorial);
              },
            )
          ],
        ),
      ),
    );
  }
}
