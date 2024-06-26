import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/modules/payment/controller/payment_controller.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';


import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

class AmountButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function() onPressed;

  const AmountButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
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


class SelectAmountRadioButtons extends StatefulWidget {
  @override
  _RadioButtonsState createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<SelectAmountRadioButtons> {
  final PaymentController _paymentController = Get.find<PaymentController>();

  String selectedAmountStr = '1,000';
  int selectedAmountInt = 1000;

  final amountButtons = [
    ['1,000', '3,000', '5,000'],
    ['10,000', '15,000', '더보기'],
  ];
  final expandedAmountButtons = [
    ['1,000', '3,000', '5,000'],
    ['10,000', '15,000', '20,000'],
    ['25,000', '30,000', '50,000'],
    ['100,000', '200,000', '300,000'],
  ];
  List<List<String>> displayedAmountButtons = [];

  bool isExpanded = false;

  @override
  void initState() {
    displayedAmountButtons = List.of(amountButtons);
    super.initState();
  }

  void toggleExpansion() {
    setState(() {
      if (isExpanded) {
        displayedAmountButtons = amountButtons;
      } else {
        displayedAmountButtons = expandedAmountButtons;
      }
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_paymentController.donateState.value == "REGULAR") {
      _paymentController.updateIsPayAbleReg();
    }
    else {
      _paymentController.updateIsPayAbleOnce();
    }
    print('>>> 선택한 금액 ${_paymentController.selectedAmount.value}');

    return Column(
      children: [
        for (var row in displayedAmountButtons)
          Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add this line
              children: [
                for (var i = 0; i < row.length; i++)
                  AmountButton(
                    text: row[i],
                    isSelected: selectedAmountStr == row[i], // Set isSelected to false by default
                    onPressed: () {
                      if (row[i] == '더보기') {
                        selectedAmountStr = row[i];
                        selectedAmountInt = 0;
                        print('선택된 금액: ${selectedAmountInt.toString()}');
                        _paymentController.selectedAmount.value = selectedAmountInt;
                        if(_paymentController.donateState.value == "REGULAR") {
                          _paymentController.updateIsPayAbleReg();
                        }
                        else {
                          _paymentController.updateIsPayAbleOnce();
                        }
                        toggleExpansion();
                      }
                      setState(() {
                        selectedAmountStr = row[i];
                        selectedAmountInt = int.parse(row[i].replaceAll(',', ''));
                        print('선택된 금액: ${selectedAmountInt.toString()}');
                        _paymentController.selectedAmount.value = selectedAmountInt;
                        if(_paymentController.donateState.value == "REGULAR") {
                          _paymentController.updateIsPayAbleReg();
                        }
                        else {
                          _paymentController.updateIsPayAbleOnce();
                        }
                      });
                    },
                  ),
              ],
            ),
          ),
      ],
    );
  }

}
