import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/payment/controller/payment_controller.dart';
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
            style: AppTextStyles.T1Bold16.copyWith(
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
  final PaymentController _paymentController = Get.find<PaymentController>();

  List<String> payDates = ['1일', '15일', '직접 입력'];
  List<String> payDatesNew = ['1일', '15일'];

  String selectedDateStr = '1일';
  int selectedDateInt = 1;

  @override
  Widget build(BuildContext context) {
    List<String> activeDates = (selectedDateInt == 1 || selectedDateInt == 15) ? payDates : payDatesNew;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // 리스트의 각 항목에 대해 반복합니다.
              for (int i = 0; i < activeDates.length; i++)
              // 마지막 항목이 아닌 경우에만 오른쪽 마진을 추가합니다.
                Container(
                  margin: EdgeInsets.only(right: (i < activeDates.length - 1) ? 10.w : 0),
                  child: Column(
                    children: [
                      PayDateButton(
                        text: activeDates[i],
                        isSelected: selectedDateStr == activeDates[i],
                        onPressed: () {
                          setState(() {
                            selectedDateStr = activeDates[i];
                            if (activeDates[i] == '1일') {
                              selectedDateInt = 1;
                            } else if (activeDates[i] == '15일') {
                              selectedDateInt = 15;
                            } else {
                              selectedDateInt = 0;
                              _paymentController.selectedDate.value = 0;
                              _paymentController.updateIsPayAbleReg();
                              //print('컨트롤러에 저장된 날짜: ' + _paymentController.selectedDate.value);
                            }
                            _paymentController.selectedDate.value = selectedDateInt;
                            _paymentController.updateIsPayAbleReg();
                            //print('선택된 날짜: ${selectedDateInt.toString()}');
                          });
                        },
                      ),
                    ],
                  ),
                ),
              if (selectedDateInt != 1 && selectedDateInt != 15)
                Container( // 날짜 직접입력
                  width: 100.w,
                  height: 46.h,
                  margin: EdgeInsets.only(left: 10.w),
                  child: NumberInputFieldExample(),
                ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }




}