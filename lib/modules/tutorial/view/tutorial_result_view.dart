import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/model/tutorial_flame/tutorial_flame.dart';

import '../../../provider/routes/routes.dart';
import '../../../util/components/global_button.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

///* 튜토리얼 이후에 나타나는 화면
class TutorialResultScreen extends StatelessWidget {
  final TutorialFlame tutorialFlame;

  const TutorialResultScreen({super.key, required this.tutorialFlame});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          children: [
            Expanded(
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: 190.w,
                      height: 45.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("${imgDir}ic_speech_down_187.png"),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 6.h,
                            child: SizedBox(
                              width: 160.w,
                              height: 20.h,
                              child: Text(
                                tutorialFlame.randomMessage,
                                style: AppTextStyles.L1Medium13,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 51.h,
                  ),
                  Image.network(
                    tutorialFlame.image,
                    width: 102.w,
                    height: 114.h,
                  ),
                  SizedBox(
                    height: 47.h,
                  ),
                  SizedBox(
                    width: 250.w,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "`${tutorialFlame.inherenceName}`",
                              style: AppTextStyles.T1Bold20.copyWith(
                                color: AppColors.primaryRed,
                              )),
                          TextSpan(
                              text: "아기 불꽃이 생성",
                              style: AppTextStyles.T1Bold14)
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("*매 기부금 마다 고유이름이 부여됩니다.",
                      style: AppTextStyles.L1Medium12.copyWith(
                          color: AppColors.grey6)),
                ],
              )),
            ),
            CommonButton.edit(
              isActive: true,
              text: "기부처에 전달하기",
              verticalPadding: 14,
              onTap: () async {
                await Get.offAllNamed(Routes.main);
              },
            ),
            SizedBox(
              height: 24.h,
            )
          ],
        ),
      ),
    );
  }
}
