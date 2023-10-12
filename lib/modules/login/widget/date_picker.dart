import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/util/components/global_date_picker.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

/*
class DatePickerButton extends StatelessWidget {
  final Future<void> Function() onTap;
  final String text;
  final int textSize;
  final Color backgroundColor;
  final Color textColor;
  final int verticalPadding;
  final bool isBottom;

  const DatePickerButton({super.key,
    required this.onTap,
    required this.text,
    this.textSize = 14,
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.grey9,
    this.verticalPadding = 17,
    this.isBottom = false,
  });

  @override
  Future<void> showPicker(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: getHeightByPercentOfScreen(33.0, context),
          child: CuDatePicker(),
        );
      },
    );
  }

  double getHeightByPercentOfScreen(double percent,  BuildContext context) {
    return MediaQuery.of(context).size.height * percent / 100;
  }

  factory DatePickerButton.login({String text = "생년월일",
    int verticalPadding = 13,
    int textSize = 16,
    required Future<void> Function() onTap,
    bool isBottom = true}) {
    return DatePickerButton(
      text: text,
      verticalPadding: verticalPadding,
      onTap: onTap,
      backgroundColor: AppColors.white,
      textColor: AppColors.black,
      textSize: textSize,
      isBottom: isBottom,
    );
  }


}*/
