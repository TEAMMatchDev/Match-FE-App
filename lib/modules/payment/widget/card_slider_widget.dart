import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/model/card_info/card_info.dart';
import 'package:match/model/enum/card_types.dart';
import 'package:match/modules/payment/controller/payment_controller.dart';
import 'package:match/modules/payment/view/payment_select_card_view.dart';
import 'package:match/modules/project/controller/project_controller.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import 'package:get/get.dart';

class CardSlider extends StatefulWidget {
  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  final PaymentController paymentController = Get.find<PaymentController>();

  @override
  void initState() {
    super.initState();
    // 첫 번째 카드에 대한 정보 처리
    if (paymentController.cardCodeList.isNotEmpty) {
      paymentController.currentSlide.value = 0; // 첫 번째 슬라이드로 설정
      handleSlideChange(paymentController.currentSlide.value);
    }
  }

  void handleSlideChange(int index) {
    // 리스트의 크기를 가져옵니다.
    int listSize = paymentController.cardCodeList.length;
    // 인덱스가 리스트 범위 내에 있는지 확인합니다.
    if (index < listSize) {
      // 인덱스가 리스트 범위 내에 있으면 카드 정보를 처리합니다.
      print('>>> 선택한 카드 code : ${paymentController.cardCodeList[index]}');
      print('>>> 선택한 카드 번호 : ${paymentController.cardNumList[index]}');
      paymentController.cardId.value = paymentController.cardIdList[index];
      print('>>> 선택한 카드 id : ${paymentController.cardIdList[index]}');

      paymentController.isDeleteAble.value = true;
      print('>>> 카드 삭제 가능 여부 : ${paymentController.isDeleteAble.value}');

    } else {
      print('>>> 카드 등록');
      paymentController.isDeleteAble.value = false;
      print('>>> 카드 삭제 가능 여부 : ${paymentController.isDeleteAble.value}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        SizedBox(height: 23.h),
        buildCarouselSlider(),
        SizedBox(height: 20.h),
        buildCardIndicator(),
        if (paymentController.accessFrom != 'mypage') buildAdditionalInfo(),
      ],
    ));
  }
  /*Widget build(BuildContext context) {
    Key sliderKey = Key("CarouselSlider_${paymentController.cardCodeList.length}");

    if (paymentController.accessFrom != '') {
      print('>> ${paymentController.accessFrom}에서 접근');
    }

    return Obx(() => Column(
        children: [
          SizedBox(height: 23.h),
          //TODO) 카드 캐러셀 슬라이더 --현재 슬라이더 selected & 현재 슬라이더 정보 logger
          CarouselSlider(
            key: sliderKey,
            options: CarouselOptions(
              height: 150.h,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                paymentController.currentSlide.value = index;
                handleSlideChange(index);
              },
            ),

            items: [
              ...paymentController.cardCodeList.asMap().entries.map((entry) {
                int idx = entry.key;
                String code = entry.value;

                final matchingCard = CardBank.fromCode(code);

                return Stack(
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
                          matchingCard.name,
                          style: AppTextStyles.T1Bold15.copyWith(color: AppColors.white)
                      ),
                    ),
                    /// 카드 번호
                    Positioned(
                      bottom: 20.h,
                      left: 18.w,
                      child: Text(
                          paymentController.cardNumList[idx].substring(0, 4) +
                              ' - **** - **** - ' +
                          paymentController.cardNumList[idx].substring(paymentController.cardNumList[idx].length - 4),
                          style: AppTextStyles.T1Bold14.copyWith(color: AppColors.white)
                      ),
                    ),
                    if (idx == paymentController.currentSlide.value)
                      Positioned(
                        top: 18.h,
                        right: 15.w,
                        child: SvgPicture.asset(
                          iconDir + "card/ic_card_selected.svg",
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                  ],
                );
              }).toList(),
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
            ],
          ),

          SizedBox(height: 20.h),
          (paymentController.currentSlide.value != paymentController.cardCodeList.length)
              ? Text(
              '${paymentController.currentSlide.value + 1}'+'/'+(paymentController.cardCodeList.length).toString(),
              style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey6)
          )
              : Text(
              '최초 1회 계좌 등록시 3초 만에 간편결제 가능',
              style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey6)
          ),
          SizedBox(height: 20.h),

          if (paymentController.accessFrom != 'mypage')
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
      )
    );
  }*/


  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
      key: Key("CarouselSlider_${paymentController.cardCodeList.length}"),
      options: CarouselOptions(
        height: 150.h,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) {
          paymentController.currentSlide.value = index;
          handleSlideChange(index);
        },
      ),
      items: buildCarouselItems(),
    );
  }

  List<Widget> buildCarouselItems() {
    List<Widget> carouselItems = paymentController.cardCodeList.asMap().entries.map((entry) {
      int idx = entry.key;
      String code = entry.value;
      final matchingCard = CardBank.fromCode(code);
      return buildCarouselItem(idx, matchingCard);
    }).toList();

    carouselItems.add(
      GestureDetector(
        onTap: () {
          Get.to(PaymentRegisterCardScreen());
        },
        child: SvgPicture.asset(
          iconDir + "payment/ic_card_reg.svg",
          width: 263.w,
        ),
      ),
    );

    return carouselItems;
  }

  Widget buildCarouselItem(int idx, CardBank matchingCard) {
    return Stack(
      children: [
        SvgPicture.asset(
          iconDir + "card/" + matchingCard.cardIcon,
          width: 263.w,
          height: 150.h,
        ),
        Positioned(
          bottom: 40.h,
          left: 18.w,
          child: Text(
            matchingCard.name,
            style: AppTextStyles.T1Bold15.copyWith(color: AppColors.white),
          ),
        ),
        Positioned(
          bottom: 20.h,
          left: 18.w,
          child: Text(
            paymentController.cardNumList[idx].substring(0, 4) +
                ' - **** - **** - ' +
                paymentController.cardNumList[idx].substring(paymentController.cardNumList[idx].length - 4),
            style: AppTextStyles.T1Bold14.copyWith(color: AppColors.white),
          ),
        ),
        if (idx == paymentController.currentSlide.value)
          Positioned(
            top: 18.h,
            right: 15.w,
            child: SvgPicture.asset(
              iconDir + "card/ic_card_selected.svg",
              width: 20.w,
              height: 20.h,
            ),
          ),
      ],
    );
  }

  Widget buildCardIndicator() {
    return Text(
      (paymentController.currentSlide.value != paymentController.cardCodeList.length)
          ? '${paymentController.currentSlide.value + 1}' +
          '/' +
          (paymentController.cardCodeList.length).toString()
          : '최초 1회 계좌 등록시 3초 만에 간편결제 가능',
      style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey6),
    );
  }

  Widget buildAdditionalInfo() {
    return Container(
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
    );
  }

}

