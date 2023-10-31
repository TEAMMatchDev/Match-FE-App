import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:match/modules/payment/view/payment_select_card_view.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import 'package:get/get.dart';

class CardSlider extends StatefulWidget {
  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  //TODO) 카드정보
  final List<List<String>> cardInfoList = []; // id, cardCode, cardNo, cardAbleState 담은 json
  final List<String> cardNameList = ['카카오뱅크','삼성','현대','국민']; // 카드 이름만 뽑은 리스트
  final List<String> cardNumList = ['1234********2456','1111********3333','4444********1111']; // 카드 번호만 뽑은 리스트
  final List<List<String>> cardBankList = [
    ['하나','ic_card_hana.svg','374'],
    ['현대','ic_card_hyundai.svg','367'],
    ['기업','ic_card_ibk.svg',''],
    ['카카오뱅크','ic_card_kakao.svg','090'],
    ['KB국민','ic_card_kb.svg','381'],
    ['MG새마을금고','ic_card_mg.svg','045'],
    ['SC제일','ic_card_sc.svg',''],
    ['신한','ic_card_shinhan.svg','366'],
    ['우리','ic_card_woori.svg','041'],
    ['기타','ic_card_etc.svg',''], //나머지 모든 카드 '' 이면 전부 기타카드
  ];

  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 23.h),

        //TODO) 카드 캐러셀 슬라이더
        CarouselSlider(
          options: CarouselOptions(
            height: 150.h,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentSlide = index;
              });
            },
          ),
          items: cardBankList.map((item) {
            return Container(
              child: SvgPicture.asset(
                iconDir + "card/" + item[1],
                width: 263.w,
                height: 150.h,
              ),
            );
          }).toList()
            ..add(
              Container(
                child: GestureDetector(
                  onTap: () {
                    Get.to(PaymentRegisterCardScreen());
                  },
                  child: SvgPicture.asset(
                    iconDir + "payment/ic_card_reg.svg",
                    width: 263.w,
                  ),
                ),
              ),
            ),
        ),
        SizedBox(height: 20.h),
        (_currentSlide != cardBankList.length)
          ? Text(
              '${_currentSlide + 1}'+'/'+(cardBankList.length).toString(),
              style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey6)
          )
        : Text(
            '최초 1회 계좌 등록시 3초 만에 간편결제 가능',
            style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey6)
          ),
        SizedBox(height: 20.h),
        Container(
          width: 360.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: AppColors.grey11,
              width: 1.0,
            ),
            color: AppColors.grey11,
          ),
          padding: EdgeInsets.only(left: 10.w, top: 11.w, bottom: 11.w),
          child: Text(
            '* 첫 후원금은 즉시 결제되며,\n  다음 달부터 선택한 결제일에 결제됩니다.\n* 출금일에 후원금이 승인되지 않으면, 재요청할 수 있습니다.',
            style: AppTextStyles.T1Bold12.copyWith(color: AppColors.grey4),
          ),
        ),
      ],
    );
  }
}

