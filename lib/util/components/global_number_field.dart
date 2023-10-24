import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

class NumberInputFieldExample extends GetView {
  final TextEditingController textController = TextEditingController();
  final RxString inputValue = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NumberInputField(
          textController: textController,
          placeHolder: "직접 입력",
          onChanged: (value) {
            // Handle the input value here
            inputValue.value = value;
          },
          isPlain: true,
        ),
      ],
    );
  }
}

class NumberInputField extends StatelessWidget {
  final TextEditingController textController;
  final String placeHolder;
  final void Function(String) onChanged;
  final bool isPlain;

  NumberInputField({
    Key? key,
    required this.textController,
    required this.placeHolder,
    required this.onChanged,
    this.isPlain = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 46.h,
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          labelText: placeHolder,
          labelStyle: TextStyle(
            color: isPlain ? AppColors.white : AppColors.grey9, // placeholder 텍스트 색상 설정
          ),
          filled: isPlain,
          fillColor: isPlain ? AppColors.grey9 : AppColors.white, // 선택되어 활성화되면 배경색을 AppColors.grey9로, 비활성화면 white로 설정
          contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: isPlain ? AppColors.grey9 : AppColors.grey1, // 미활성 상태에서는 Colors.grey 사용
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: AppColors.grey9, // 활성 상태에서 AppColors.grey9 사용
            ),
          ),
        ),
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^1?[1-9]$|^2[0-8]$')),
        ],
        style: AppTextStyles.T1Bold16.copyWith(
          color: isPlain ? AppColors.white : AppColors.grey9,
        ),
      ),
    );
  }
}
