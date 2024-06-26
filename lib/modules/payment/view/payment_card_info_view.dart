import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/model/card_info/card_info.dart';
import 'package:match/model/enum/card_types.dart';
import 'package:match/modules/payment/view/payment_method_info_view.dart';
import 'package:match/modules/payment/widget/select_pay_method_widget.dart';
import 'package:match/modules/user_paymethod/view/user_paymethod_view.dart';
import 'package:match/provider/api/order_api.dart';
import 'package:match/provider/routes/routes.dart';
import 'package:match/util/components/gloabl_text_field.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/components/global_checkbox.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/payment_controller.dart';
import '../widget/payment_widget.dart';

class PaymentRegisterCardInfoScreen extends StatefulWidget {
  final String selectedCardName;

  PaymentRegisterCardInfoScreen({Key? key, required this.selectedCardName}) : super(key: key);

  @override
  _PaymentRegisterCardInfoScreenState createState() => _PaymentRegisterCardInfoScreenState();
}

class _PaymentRegisterCardInfoScreenState extends State<PaymentRegisterCardInfoScreen> {

  String cardNum = '';
  String cardExp = '';
  String cardCvc = '';
  String cardUserBirth = '';
  String cardPw = '';
  String cardExpYear = '';
  String cardExpMonth = '';
  String part1 = '';
  String part2 = '';
  String part3 = '';
  String part4 = '';

  @override
  Widget build(BuildContext context){
    final PaymentController controller = Get.find();

    controller.clearInputFields();

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
                  final matchingCard = CardBank.fromName(widget.selectedCardName);

                  return Center(
                    child: Stack(
                      children: [
                        // 기존 카드 이미지
                        Container(
                          child: SvgPicture.asset(
                            iconDir + "card/" + matchingCard.cardIcon,
                            width: 263.w,
                            height: 150.h,
                          ),
                        ),
                        /// 카드사
                        Positioned(
                          bottom: 40.h,
                          left: 18.w,
                          child: Text(
                              matchingCard.bankName,
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
                    Row(
                      children: [
                        Container(
                          width: 70.w,
                          child: CommonInputField.cardNum(
                              textController : controller.cardNumTextControllerPart1.value,
                              onChange: (value) async {
                                cardNum = value;
                                print(">>> 입력한 카드번호: $cardNum");

                                part1 = controller.cardNumTextControllerPart1.value.text;
                                print('>>입력된 카드번호1: ${part1}');
                                //await onChange(numericValue); //callback
                              }),
                        ),
                        SizedBox(
                          width: 12.w,
                          child: Text(
                            '-',
                            style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                            textAlign: TextAlign.center, // Center text inside the container
                          ),
                        ),
                        Container(
                          width: 70.w,
                          child: CommonInputField.cardNum(
                              textController : controller.cardNumTextControllerPart2.value,
                              onChange: (value) async {
                                cardNum = value;
                                print(">>> 입력한 카드번호: $cardNum");

                                part2 = controller.cardNumTextControllerPart2.value.text;
                                print('>>입력된 카드번호1: ${part2}');
                                //await onChange(numericValue); //callback
                              }),
                        ),
                        SizedBox(
                          width: 12.w,
                          child: Text(
                            '-',
                            style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                            textAlign: TextAlign.center, // Center text inside the container
                          ),
                        ),
                        Container(
                          width: 70.w,
                          child: CommonInputField.cardNum(
                              textController : controller.cardNumTextControllerPart3.value,
                              onChange: (value) async {
                                cardNum = value;
                                print(">>> 입력한 카드번호: $cardNum");

                                part3 = controller.cardNumTextControllerPart3.value.text;
                                print('>>입력된 카드번호3: ${part3}');
                                //await onChange(numericValue); //callback
                              }),
                        ),
                        SizedBox(
                          width: 12.w,
                          child: Text(
                            '-',
                            style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                            textAlign: TextAlign.center, // Center text inside the container
                          ),
                        ),
                        Container(
                          width: 70.w,
                          child: CommonInputField.cardNum(
                              textController : controller.cardNumTextControllerPart4.value,
                              onChange: (value) async {
                                cardNum = value;
                                print(">>> 입력한 카드번호: $cardNum");

                                part4 = controller.cardNumTextControllerPart4.value.text;
                                print('>>입력된 카드번호4: ${part4}');
                                //await onChange(numericValue); //callback
                              }),
                        ),
                      ],
                    ),
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
                                    cardExp = value;
                                    cardExpYear = value.substring(2,4);
                                    cardExpMonth = value.substring(0,2);
                                    print(">>> 입력한 유효기간: $value");
                                    print(">>> 입력한 유효기간 year: ${cardExpYear}");
                                    print(">>> 입력한 유효기간 month: ${cardExpMonth}");
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
                                    cardCvc = value;
                                    print(">>> 입력한 CVC: $cardCvc");
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
                                    cardUserBirth = value;
                                    print(">>> 입력한 생년월일: $cardUserBirth");
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
                                    cardPw = value;
                                    print(">>> 입력한 카드 비밀번호: $cardPw");
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
                    text: "등록",
                    onTap: () async {
                      if (part1 != "" && part2 != "" && part3 != "" && part4 != "" && cardExpYear != "" && cardExpMonth != "" && cardUserBirth != "" && cardPw != ""){
                        var result = await OrderApi.setCard(
                            cardNo: part1+part2+part3+part4,
                            expYear: cardExpYear,
                            expMonth: cardExpMonth,
                            idNo: cardUserBirth,
                            cardPw: cardPw);
                        if (result) {
                          Fluttertoast.showToast(msg: "카드가 등록되었습니다.");
                          controller.refreshCardList();
                          controller.loadData();
                          Get.offAllNamed(Routes.pay_method);

                          // if (controller.accessFrom == 'mypage') {
                          //   Get.offAllNamed(Routes.pay_method);
                          //   print('>>> 넘어온 화면: ${controller.accessFrom}');
                          // }
                          // else {
                          //   Get.to(PaymentMethodScreen());
                          //   print('>>> 넘어온 화면: ${controller.accessFrom}');
                          // }
                        } else {
                          Fluttertoast.showToast(msg: "카드 등록에 실패했습니다. 카드 정보를 다시 확인해주세요.");
                        }
                      } else {
                        Fluttertoast.showToast(msg: "입력값 중 빈 값이 있는 지 확인해주세요. (끝자리를 한번씩 다시 입력해주세요)");
                      }
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
