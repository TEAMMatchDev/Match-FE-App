import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/payment/widget/select_pay_method_widget.dart';
import 'package:match/util/components/gloabl_text_field.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/components/global_checkbox.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/payment_controller.dart';
import '../widget/payment_widget.dart';

class PaymentRegisterCardInfoScreen extends GetView<PaymentController> {

  final String selectedCardName;
  final List<List<String>> cardBankList = [
    ['하나','ic_card_hana.svg','374'],
    ['현대','ic_card_hyundai.svg','367'],
    // ['기업','ic_card_ibk.svg',''],
    ['카카오뱅크','ic_card_kakao.svg','090'],
    ['국민','ic_card_kb.svg','381'],
    ['MG새마을금고','ic_card_mg.svg','045'],
    // ['SC제일','ic_card_sc.svg',''],
    ['신한','ic_card_shinhan.svg','366'],
    ['우리','ic_card_woori.svg','041'],
    ['기타','ic_card_etc.svg',''], //나머지 모든 카드 '' 이면 전부 기타카드
  ];

  final String cardNum = '';
  final String cardExp = '';
  final String cardCvc = '';
  final String cardUserBirth = '';
  final String cardPw = '';

  PaymentRegisterCardInfoScreen({Key? key, required this.selectedCardName}) : super(key: key);

  @override
  Widget build(BuildContext context){

    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Text(
                      '카드 정보 입력 ',
                      style: AppTextStyles.T1Bold18,
                    ),
                    Text(
                      '(최초 1회만 등록)',
                      style: AppTextStyles.T1Bold18.copyWith(color: AppColors.grey3),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Divider( // 수평선 추가
                  height: 1, // 선의 높이
                  color: AppColors.grey1, // 선의 색상
                  thickness: 1, // 선의 두께
                ),
                SizedBox(height: 40.h),

                //TODO) 카드 svg
                (() {
                  final matchingCard = cardBankList.firstWhere(
                        (card) => selectedCardName.contains(card[0]),
                      orElse: () => cardBankList.firstWhere((card) => card[2] == '')
                  );
                  return Center(
                    child: Stack(
                      children: [
                        // 기존 카드 이미지
                        Container(
                          child: SvgPicture.asset(
                            iconDir + "card/" + matchingCard[1],
                            width: 263.w,
                            height: 150.h,
                          ),
                        ),
                        /// 카드사
                        Positioned(
                          bottom: 40.h,
                          left: 18.w,
                          child: Text(
                              matchingCard[0],
                              style: AppTextStyles.T1Bold15.copyWith(color: AppColors.white)
                          ),
                        ),
                        /// 카드 번호
                        Positioned(
                          bottom: 20.h,
                          left: 18.w,
                          child: Text(
                              'NNNN - **** - **** - NNNN',
                              style: AppTextStyles.T1Bold14.copyWith(color: AppColors.white)
                          ),
                        ),
                      ],
                    ),
                  );
                })(),
                SizedBox(height: 16.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '카드번호',
                        style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                    ),
                    SizedBox(height: 12.h),
                    CommonInputField.cardNum(
                        textController : controller.cardNumTextController.value,
                        onChange: (value) async {
                          print(">>> 입력한 카드번호: $value");
                        }),
                    SizedBox(height: 37.h),

                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '유효기간',
                                style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                            ),
                            SizedBox(height: 14.h),
                            Container(
                              width: 150.w,
                              child: CommonInputField.cardExp(
                                  textController : controller.cardExpTextController.value,
                                  onChange: (value) async {
                                    print(">>> 입력한 유효기간: $value");
                                  }),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                    'CVC  ',
                                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                                ),
                                Text(
                                    '(카드 뒷면 숫자 3자리)',
                                    style: AppTextStyles.T1Bold13.copyWith(color: AppColors.grey3)
                                ),
                              ],
                            ),
                            SizedBox(height: 14.h),
                            Container(
                              width: 150.w,
                              child: CommonInputField.cardCvc(
                                  textController : controller.cardCVCTextController.value,
                                  onChange: (value) async {
                                    print(">>> 입력한 CVC: $value");
                                  }),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 37.h),

                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                    '생년월일  ',
                                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                                ),
                                Text(
                                    '(6자리)',
                                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey3)
                                ),
                              ],
                            ),
                            SizedBox(height: 14.h),
                            Container(
                              width: 150.w,
                              child: CommonInputField.cardUserBirth(
                                  textController : controller.cardUserBirthTextController.value,
                                  onChange: (value) async {
                                    print(">>> 입력한 생년월일: $value");
                                  }),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                    '카드 비밀번호  ',
                                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                                ),
                                Text(
                                    '(앞 2자리)',
                                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey3)
                                ),
                              ],
                            ),
                            SizedBox(height: 14.h),
                            Container(
                              width: 150.w,
                              child: CommonInputField.cardPw(
                                  textController : controller.cardPWTextController.value,
                                  onChange: (value) async {
                                    print(">>> 입력한 카드 비밀번호: $value");
                                  }),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 35.h),




                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
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
                    text: "다음",
                    onTap: () async {
                      Get.back();
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
        ],
        ),
      ),
    );
  }
}
