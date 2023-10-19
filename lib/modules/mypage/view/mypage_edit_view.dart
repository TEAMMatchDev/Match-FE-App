import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/mypage/view/mypage_view.dart';
import 'package:match/util/components/global_app_bar.dart';

import '../../../provider/routes/routes.dart';
import '../../../provider/service/auth_service.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';
import '../widget/mypage_widget.dart';

class MypageEditScreen extends StatelessWidget {
  const MypageEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("회원정보 수정"),
      body: Column(children: [
        //*1. 닉네임 이메일
        Padding(
          padding: EdgeInsets.symmetric(vertical: 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${AuthService.to.myProfile.value.name}님",
                    style: AppTextStyles.T1Bold20,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.nickname);
                      },
                      child: SvgPicture.asset("${iconDir}ic_edit_16.svg"))
                ],
              ),
              SocialTypeEmailWidget(),
            ],
          ),
        ),
        Container(
          color: AppColors.searchBackground,
          height: 10.h,
        ),
        //*2. 이름, 휴대폰 번호
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "개인 정보",
                style: AppTextStyles.T1Bold15,
              ),
              SizedBox(
                height: 20.h,
              ),
              PrivacyInfo(
                  title: "이름", value: AuthService.to.myProfile.value.name),
              SizedBox(
                height: 20.h,
              ),
              PrivacyInfo(
                title: "휴대폰번호",
                value: AuthService.to.myProfile.value.phone,
                icon: "phone_edit",
                onTap: () async{},
              ),
            ],
          ),
        ),
        Divider(
          height: 1.h,
          thickness: 1.h,
          color: AppColors.divider1,
        ),
        MypageListTile(title: "결제 수단 관리"),
        MypageListTile(title: "로그아웃"),
        MypageListTile(title: "탈퇴하기"),
      ]),
    );
  }
}

Widget PrivacyInfo(
    {required String title,
    required String value,
    String? icon,
    Future<void> Function()? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        width: 86.w,
        child: Text(
          title,
          style: AppTextStyles.L1Medium14.copyWith(
            color: AppColors.grey6,
          ),
        ),
      ),
      icon != null
          ? SizedBox(
              width: 40.w,
              child: GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset("${iconDir}ic_${icon}_16.svg")))
          : SizedBox(width: 40.w),
      Text(
        value,
        style: AppTextStyles.T1Bold14,
        textAlign: TextAlign.start,
      ),
    ],
  );
}
