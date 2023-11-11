import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/modules/payment/binding/payment_binding.dart';
import 'package:match/modules/payment/view/payment_donation_info_view.dart';
import 'package:match/provider/service/auth_service.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/payment_controller.dart';
import '../widget/payment_widget.dart';

class PaymentDonatorScreen extends GetView<PaymentController> {
  PaymentDonatorScreen({Key? key}) : super(key: key) {
    Get.find<PaymentController>();
  }

  String formatPhoneNumber(String rawNumber) {
    if (rawNumber.length != 11) return rawNumber;

    String part1 = rawNumber.substring(0, 3);
    String part2 = rawNumber.substring(3, 7);
    String part3 = rawNumber.substring(7, 11);

    return '$part1-$part2-$part3';
  }


  @override
  Widget build(BuildContext context){

    print(">>> DonatorScreen 기부자 프로필 조회: ${AuthService.to.donatorProfile.value}");

    return Obx(() {
      // 여기서 AuthService.to.donatorProfile의 값이 변경될 때마다 UI가 업데이트됩니다.
      var donatorProfile = AuthService.to.donatorProfile.value;

      return Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h)
                  .copyWith(bottom: 0.h),
              child: Column(
                  children: [
                    //*1.제목 header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          imgDir + "logo/iv_home_logo.png",
                          width: 75.w,
                        ),
                      ],
                    ),
                  ]
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Text(
                      '기부금 결제하기',
                      style: AppTextStyles.T1Bold18,
                    ),
                    SizedBox(height: 23.h),
                    SvgPicture.asset(
                      iconDir + "payment/ic_rating_stick_1.svg",
                      width: 330.w,
                    ),
                    SizedBox(height: 30.h),
                    Text(
                        '1. 기부자 정보를 확인해주세요.',
                        style: AppTextStyles.T1Bold15.copyWith(
                            color: AppColors.grey9)
                    ),
                    SizedBox(height: 20.h),
                    Divider( // 수평선 추가
                      height: 1, // 선의 높이
                      color: AppColors.grey1, // 선의 색상
                      thickness: 1, // 선의 두께
                    ),
                    SizedBox(height: 20.h),
                    Text(
                        '기부자 정보',
                        style: AppTextStyles.T1Bold14.copyWith(
                            color: AppColors.grey9)
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Text(
                            '이름',
                            style: AppTextStyles.T1Bold13.copyWith(
                                color: AppColors.grey8)
                        ),
                        SizedBox(width: 37.w),
                        Container(
                          width: 258.w,
                          decoration: BoxDecoration(
                            color: AppColors.grey11, // 배경색 설정
                            borderRadius: BorderRadius.circular(
                                5.0), // 모서리를 둥글게 설정
                          ),
                          padding: EdgeInsets.all(20.0), // 내부 패딩 설정
                          child: Text(
                            '${donatorProfile.name}',
                            style: AppTextStyles.T1Bold14.copyWith(
                                color: AppColors.grey7),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Text(
                            '생년월일',
                            style: AppTextStyles.T1Bold13.copyWith(
                                color: AppColors.grey8)
                        ),
                        SizedBox(width: 15.w),
                        Container(
                          width: 259.w,
                          decoration: BoxDecoration(
                            color: AppColors.grey11, // 배경색 설정
                            borderRadius: BorderRadius.circular(
                                5.0), // 모서리를 둥글게 설정
                          ),
                          padding: EdgeInsets.all(20.0), // 내부 패딩 설정
                          child: Text(
                            '${donatorProfile.birthDay}',
                            style: AppTextStyles.T1Bold14.copyWith(
                                color: AppColors.grey7),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Text(
                            '전화번호',
                            style: AppTextStyles.T1Bold13.copyWith(
                                color: AppColors.grey8)
                        ),
                        SizedBox(width: 15.w),
                        Container(
                          width: 259.w,
                          decoration: BoxDecoration(
                            color: AppColors.grey11, // 배경색 설정
                            borderRadius: BorderRadius.circular(
                                5.0), // 모서리를 둥글게 설정
                          ),
                          padding: EdgeInsets.all(20.0), // 내부 패딩 설정
                          child: Text(
                            '${formatPhoneNumber(donatorProfile.phoneNumber)}',
                            style: AppTextStyles.T1Bold14.copyWith(
                                color: AppColors.grey7),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: 360.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: AppColors.grey1,
                          width: 1.0,
                        ),
                      ),
                      padding: EdgeInsets.only(
                          left: 10.w, top: 11.w, bottom: 11.w), // 내부 패딩 설정
                      child: Text(
                        '* 기부금 영수증은 아직 준비 중이에요.\n  빠르게 업데이트할게요! 조금만 기다려주세요.\n* 기부자 정보를 수정은 마이페이지에서 할 수 있어요.',
                        style: AppTextStyles.T1Bold12.copyWith(
                            color: AppColors.grey4),
                      ),
                    )

                  ],
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 6),
                    child: CommonButton.back(
                      text: "이전 돌아가기",
                      onTap: () async {
                        Get.back();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.w, right: 20),
                    child: CommonButton.login(
                      text: "확인",
                      onTap: () async {
                        Get.to(() => PaymentDonationScreen(),
                            binding: PaymentBinding());
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      );
    }
    );
  }
}
