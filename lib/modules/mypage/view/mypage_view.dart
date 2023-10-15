import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/mypage/view/notice_view.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/routes/routes.dart';
import '../../../util/components/global_widget.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../controller/mypage_controller.dart';

class MypageScreen extends GetView<MypageController> {
  const MypageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 10.h),
            child: Column(
              children: [
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
                    "박레이님",
                    style: AppTextStyles.T1Bold18,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey6),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: Text("회원 정보 수정",
                        style: AppTextStyles.L1Medium10.copyWith(
                          color: AppColors.grey6,
                        )),
                  )
                ]),
                SizedBox(
                  height: 9.h,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(iconDir + "login/ic_kakao_19.svg"),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("abcdefg@abcdefg",
                          style: AppTextStyles.S1SemiBold14.copyWith(
                            color: AppColors.grey6,
                          ))
                    ]),
                SizedBox(
                  height: 23.h,
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.searchBackground,
            height: 10.h,
          ),
          Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 8.h),
              child: Column(
                children: [
                  MypageListTile(
                      icon: "donation",
                      title: "기부내역 / 해지하기",
                      onTap: (() async {
                        await Get.toNamed(Routes.total_pay);
                      })),
                  MypageListTile(
                      icon: "notice",
                      title: "공지사항",
                      onTap: (() async {
                        await Get.to(() => const NoticeScreen());
                      })),
                  MypageListTile(icon: "setting", title: "환경설정"),
                  MypageListTile(icon: "policy", title: "운영정책 및 약관"),
                  MypageListTile(icon: "client", title: "고객센터"),
                ],
              ))
        ],
      ),
    );
  }
}

class MypageListTile extends StatelessWidget {
  final Future<void> Function()? onTap;
  final String title;
  final String icon;
  final bool isLast;
  const MypageListTile({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: isLast
                ? null
                : Border(
                    bottom: BorderSide(color: AppColors.divider1, width: 1.h))),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              iconDir + "mypage/" + "ic_${icon}_18.svg",
              width: 18.w,
            ),
            SizedBox(
              width: 14.w,
            ),
            Text(title, style: AppTextStyles.T1Bold14),
          ],
        ),
      ),
    );
  }
}
