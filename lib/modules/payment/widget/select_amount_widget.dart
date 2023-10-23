import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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


class SelectAmountRadioButtons extends StatefulWidget {
  @override
  _RadioButtonsState createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<SelectAmountRadioButtons> {
  String selectedAmount = '1,000';
  int selectedAmountInt = 1000;

  final amountButtons = [
    ['1,000', '5,000', '10,000'],
    ['20,000', '30,000', '더보기'],
  ];
  final expandedAmountButtons = [
    ['1,000', '5,000', '10,000'],
    ['20,000', '30,000', '50,000'],
    ['70,000', '100,000', '150,000'],
    ['200,000', '250,000', '300,000'],
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
                    isSelected: selectedAmount == row[i], // Set isSelected to false by default
                    onPressed: () {
                      if (row[i] == '더보기') {
                        print('더보기 버튼 클릭!!');
                        selectedAmount = row[i];
                        selectedAmountInt = 0;
                        print('선택된 금액: '+selectedAmountInt.toString());
                        toggleExpansion();
                      }
                      setState(() {
                        selectedAmount = row[i];
                        selectedAmountInt = int.parse(row[i].replaceAll(',', ''));
                        print('선택된 금액: '+selectedAmountInt.toString());
                      });
                    },
                    margin: EdgeInsets.only(right: i < row.length - 1 ? 10.w : 0),
                  ),
              ],
            ),
          ),
      ],
    );
  }

}
