import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/model/donator/donator.dart';
import 'package:match/model/enum/login_type.dart';
import 'package:match/modules/payment/binding/payment_binding.dart';
import 'package:match/modules/payment/view/payment_donation_info_view.dart';
import 'package:match/modules/signIn/controller/login_controller.dart';
import 'package:match/provider/api/order_api.dart';
import 'package:match/provider/service/auth_service.dart';
import 'package:match/util/components/gloabl_text_field.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/components/global_date_picker.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/payment_controller.dart';
import '../widget/payment_widget.dart';

class PaymentDonatorScreen extends GetView<PaymentController> {
  PaymentDonatorScreen({Key? key}) : super(key: key);
  final loginController = Get.find<LoginController>();

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
    //print(">> 로그인 플랫폼 정보: ${loginController.loginPlatform.value}");

    return Obx(() {
      var donatorProfile = AuthService.to.donatorProfile.value;

        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // 주축 크기를 최소로 설정
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

                          Obx(() {
                            var donatorProfile = AuthService.to.donatorProfile.value;

                            return Padding(
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
                                    style: AppTextStyles.T1Bold15.copyWith(color: AppColors.grey9),
                                  ),
                                  SizedBox(height: 20.h),
                                  Divider(height: 1, color: AppColors.grey1, thickness: 1),
                                  SizedBox(height: 20.h),
                                  Text('기부자 정보', style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)),
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
                                        height: 46.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.grey11,
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: //donatorProfile.name != '테스트'
                                          // ?
                                          Padding(
                                                  padding: EdgeInsets.only(left: 10.w),
                                                  child: Text(
                                                    '${donatorProfile.name}',
                                                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey7),
                                                  ),
                                                ),
                                              // : CommonInputField.userName(
                                              //     textController : controller.userNameTextController.value,
                                              //     onChange: (value) async {
                                              //       //print(">>> 입력한 이름: $value");
                                              //       controller.userName.value = value;
                                              //     }
                                              // ),
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
                                        height: 46.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.grey11, // 배경색 설정
                                          borderRadius: BorderRadius.circular(5.0), // 모서리를 둥글게 설정
                                        ),
                                        child: //donatorProfile.name != '테스트'
                                            // ?
                                          Padding(
                                          padding: EdgeInsets.only(left: 10.w), // 왼쪽 패딩 추가
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              '${donatorProfile.birthDay}',
                                              style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey7),
                                            ),
                                          ),
                                        )
                                            // : Padding(
                                            //     padding: EdgeInsets.only(left: 10.w), // 왼쪽 패딩 추가
                                            //     child: Align(
                                            //       alignment: Alignment.centerLeft,
                                            //       child: CallSelectBirthBottomSheet(
                                            //         onBirthSelected: (birth) {
                                            //           //print('>>> 선택한 생년월일: $birth');
                                            //           controller.birthState.value = birth.toString();
                                            //           controller.userBirth.value = birth.toString(); //.replaceAll("-", "");
                                            //         },
                                            //       ),
                                            //   ),
                                            // ),
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
                                        height: 46.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.grey11, // 배경색 설정
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: //donatorProfile.name != '테스트'
                                            // ?
                                        Padding(
                                                padding: EdgeInsets.only(left: 10.w), // 왼쪽 패딩 추가
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    '${formatPhoneNumber(donatorProfile.phoneNumber)}',
                                                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey7),
                                                  ),
                                                ),
                                              ),
                                            // : Padding(
                                            //     padding: EdgeInsets.only(left: 10.w), // 왼쪽 패딩 추가
                                            //     child: Align(
                                            //       alignment: Alignment.centerLeft,
                                            //       child: CommonInputField.userPhone(
                                            //         textController: controller.userPhoneTextController.value,
                                            //         onChange: (value) async {
                                            //           //print(">>> 입력한 전화번호: $value");
                                            //           controller.userPhone.value = value;
                                            //         },
                                            //       ),
                                            //     ),
                                            //   ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 40.h),
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
                            );
                          }),
                        ],
                      )
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 6.w, bottom: 20.h),
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
                        padding: EdgeInsets.only(left: 6.w, right: 20.w, bottom: 20.h),
                        child: CommonButton.login(
                          text: "확인",
                          onTap: () async {
                            if (loginController.loginPlatform.value == 'apple' && controller.userName.value != null && controller.userPhone.value != ''){
                              var result = await OrderApi.postProfile(
                                  name: controller.userName.value,
                                  birthDate: controller.userBirth.value,
                                  phone: controller.userPhone.value);
                              if(result) {
                                Get.to(() => PaymentDonationScreen(),
                                    binding: PaymentBinding());
                              }
                              else {
                                Fluttertoast.showToast(msg: '사용자님의 정보를 올바르게 입력해주세요.');
                              }
                            }
                            else {
                              Get.to(() => PaymentDonationScreen(),
                                  binding: PaymentBinding());
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ])
        );
      }
    );
  }
}
