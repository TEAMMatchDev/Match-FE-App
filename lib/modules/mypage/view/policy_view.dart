import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/mypage/view/policy_detail_view.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/style/global_color.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("운영정책 및 약관"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 34.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Get.to(const PolicyDetailView(
                    webUrl: "/terms/service",
                    title: "서비스 이용약관",
                  ));
                },
                child: Text("이용약관", style: AppTextStyles.T1Bold15)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Divider(
                thickness: 1.h,
                height: 1.h,
                color: AppColors.divider1,
              ),
            ),
            GestureDetector(
                onTap: () {
                  Get.to(const PolicyDetailView(
                    webUrl: "/terms/policy",
                    title: "개인정보 처리 방침",
                  ));
                },
                child: Text("개인정보 처리 방침", style: AppTextStyles.T1Bold15)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Divider(
                thickness: 1.h,
                height: 1.h,
                color: AppColors.divider1,
              ),
            ),
            // GestureDetector(
            //     onTap: () {
            //       Get.to(const PolicyDetailView(
            //         webUrl: "/terms/marketing ",
            //         title: "마케팅 정보 수집 및 수신 동의",
            //       ));
            //     },
            //     child:
            //         Text("마케팅 정보 수집 및 수신 동의", style: AppTextStyles.T1Bold15)),
          ],
        ),
      ),
    );
  }
}
