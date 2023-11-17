import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/routes/routes.dart';
import '../../../util/components/global_button.dart';
import '../../../util/const/style/global_color.dart';

class SurveyCompleteScreen extends StatelessWidget {
  const SurveyCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "리뷰 작성 완료!",
                  style: AppTextStyles.T1Bold24,
                ),
                SizedBox(height: 24.h),
                Text(
                  "리뷰는 MATCH에게 성장의 발판이 돼요.",
                  style: AppTextStyles.T1Bold15.copyWith(
                    color: AppColors.grey7
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 29.w, vertical: 20.h),
            child: CommonButton.edit(
              text: "확인",
              isActive: true,
              onTap: () async {
                Get.offAllNamed(Routes.main);
              },
            ),
          )
        ],
      ),
    );
  }
}
