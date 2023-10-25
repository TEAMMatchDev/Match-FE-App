import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

class SelectableCards extends StatefulWidget {
  @override
  _SelectableCardsState createState() => _SelectableCardsState();
}

class _SelectableCardsState extends State<SelectableCards> {
  final cardNames = [
    ['토스카드','카카오뱅크','국민카드'],
    ['농협카드','우리카드','현대카드'],
    ['하나카드','신한카드','롯데카드'],
    ['BC카드','삼성카드','K뱅크카드'],
    ['씨티카드','수협카드','우체국카드'],
    ['신협카드','기타'],
  ];
  final cardIcons = [
    ['ic_toss.svg','ic_kakao.svg','ic_kbb.svg'],
    ['ic_nh.svg','ic_woori.svg','ic_hyundai.svg'],
    ['ic_hana.svg','ic_shinhan.svg','ic_lotte.svg'],
    ['ic_bc.svg','ic_samsung.svg','ic_kbank.svg'],
    ['ic_citi.svg','ic_suhyup.svg','ic_postoffice.svg'],
    ['ic_sinhyup.svg','ic_etc.svg',],
  ];

  // 선택된 카드를 추적하기 위한 변수를 정의합니다.
  int? selectedRow;
  int? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var rowIndex = 0; rowIndex < cardIcons.length; rowIndex++)
          Row(
            children: [
              for (var itemIndex = 0; itemIndex < cardIcons[rowIndex].length; itemIndex++)
                GestureDetector( // Container를 GestureDetector로 감쌉니다.
                  onTap: () {
                    setState(() {
                      // 사용자가 탭할 때마다 선택된 항목을 업데이트합니다.
                      selectedRow = rowIndex;
                      selectedItem = itemIndex;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20.h,
                      right: (itemIndex < cardIcons[rowIndex].length - 1) ? 17.w : 0,
                    ),
                    width: 95.w,
                    height: 62.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: (selectedRow == rowIndex && selectedItem == itemIndex)
                            ? AppColors.grey8 // 선택된 경우
                            : AppColors.grey1, // 선택되지 않은 경우
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 9.h),
                        SvgPicture.asset(
                          iconDir + "card/" + cardIcons[rowIndex][itemIndex],
                          width: 24.w,
                          height: 24.h,
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          cardNames[rowIndex][itemIndex],
                          style: AppTextStyles.T1Bold12.copyWith(color: AppColors.grey8),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
