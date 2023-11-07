import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

class SelectGenderRadioButtons extends StatefulWidget {
  final ValueChanged<String> onGenderSelected;
  SelectGenderRadioButtons({required this.onGenderSelected}); //callback할 성별버튼 상태

  @override
  _RadioButtonsState createState() => _RadioButtonsState();
}

class GenderButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function() onPressed;

  const GenderButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 92.w,
        height: 40.h,
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
              color: isSelected ? AppColors.white : AppColors.grey3,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _RadioButtonsState extends State<SelectGenderRadioButtons> {
  String selectedGender = '남성';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GenderButton(
          text: '남성',
          isSelected: selectedGender == '남성',
          onPressed: () {
            setState(() {
              selectedGender = '남성';
            });
            widget.onGenderSelected(selectedGender);
          },
        ),
        SizedBox(width: 10.w),
        GenderButton(
          text: '여성',
          isSelected: selectedGender == '여성',
          onPressed: () {
            setState(() {
              selectedGender = '여성';
            });
            widget.onGenderSelected(selectedGender);
          },
        ),
        SizedBox(width: 10.w),
        GenderButton(
          text: '선택 안함',
          isSelected: selectedGender == '선택 안함',
          onPressed: () {
            setState(() {
              selectedGender = '선택 안함';
            });
            widget.onGenderSelected(selectedGender);
          },
        ),
      ],
    );
  }
}
