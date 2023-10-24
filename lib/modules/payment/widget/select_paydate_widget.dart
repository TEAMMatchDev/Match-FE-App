import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/util/components/global_number_field.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';


import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

class PayDateButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function() onPressed;
  final bool isDirectInput; //직접입력

  const PayDateButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
    this.isDirectInput = false, //기본적으로 직접입력 버튼 비활성화
    required EdgeInsets margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100.w,
        height: 46.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isSelected ? AppColors.grey10 : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.grey10 : AppColors.grey1,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.T1Bold13.copyWith(
              color: isSelected ? AppColors.white : AppColors.grey10,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}


class PayDateRadioButtons extends StatefulWidget {
  @override
  _RadioButtonsState createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<PayDateRadioButtons> {
  List<String> payDates = ['1일', '15일', '직접 입력'];
  List<String> payDatesNew = ['1일', '15일'];

  String selectedDate = '1일';
  int selectedDateInt = 1;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var row in (selectedDateInt == 1 || selectedDateInt == 15) ? payDates : payDatesNew)
                Column(
                  children: [
                    PayDateButton(
                      text: row,
                      isSelected: selectedDate == row,
                      onPressed: () {
                        setState(() {
                          selectedDate = row;
                          if (row == '1일') {
                            selectedDateInt = 1;
                          } else if (row == '15일') {
                            selectedDateInt = 15;
                          } else {
                            selectedDateInt = 0;
                          }
                          print('선택된 날짜: ' + selectedDateInt.toString());
                        });
                      },
                      margin: EdgeInsets.only(right: 10.w),
                    ),
                  ],
                ),
            ],
          ),
        ),
        if (selectedDateInt != 1 && selectedDateInt != 15)
          Container(
            width: 200.0, // 원하는 너비 설정
            child: NumberInputFieldExample(),
          ),
        SizedBox(height: 16.h),
      ],
    );
  }




}