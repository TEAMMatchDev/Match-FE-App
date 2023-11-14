import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/mypage/view/policy_view.dart';
import 'package:match/modules/mypage/view/service_center_view.dart';
import 'package:match/modules/mypage/view/setting_view.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../provider/routes/routes.dart';
import '../../../provider/service/auth_service.dart';
import '../../../util/components/global_widget.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../widget/mypage_widget.dart';
import 'mypage_edit_view.dart';

///<h2> 마이페이지 화면 </h2>
///탭에서 내 정보를 클릭했을때 나오는 화면<br/>
///* 별도의 init하거나 logic이 필요하지 않아 controller를 사용하지 않고 StatelessWidget으로 구현
///* 회원정보는 AuthService에서 관리
class MypageScreen extends StatelessWidget {
  const MypageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///*1. 상단 내정보
                  ///AuthService 이용
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "내 정보",
                          style: AppTextStyles.T1Bold16,
                        ),
                        alarmButton()
                      ]),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      "${AuthService.to.myProfile.value.name}님",
                      style: AppTextStyles.T1Bold18,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const MypageEditScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey6),
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                        child: Text("회원 정보 수정",
                            style: AppTextStyles.L1Medium10.copyWith(
                              color: AppColors.grey6,
                            )),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 9.h,
                  ),
                  SocialTypeEmailWidget(),
                  SizedBox(
                    height: 23.h,
                  ),
                ],
              ),
            ),
            GreySizedBox(),

            ///*2. 메뉴
            Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 8.h),
                child: Column(
                  children: [
                    MypageListTile(
                        icon: "list",
                        title: "기부내역 / 해지하기",
                        onTap: (() async {
                          await Get.toNamed(Routes.total_pay);
                        })),
                    MypageListTile(
                        icon: "donation",
                        title: "내가 찜한 기부처",
                        onTap: (() async {
                          await Get.toNamed(Routes.like_project);
                        })),
                    MypageListTile(
                        icon: "notice",
                        title: "공지사항",
                        onTap: (() async {
                          await Get.toNamed(Routes.notice);
                        })),
                    MypageListTile(
                      icon: "setting",
                      title: "환경설정",
                      onTap: () async {
                        await Get.toNamed(Routes.setting);
                      },
                    ),
                    MypageListTile(
                      icon: "policy",
                      title: "운영정책 및 약관",
                      onTap: () async {
                        Get.to(() => const PolicyScreen());
                      },
                    ),
                    MypageListTile(
                      icon: "client",
                      title: "고객센터",
                      isLast: true,
                      onTap: () async {
                        Get.to(() => const ServiceCenterScreen());
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
