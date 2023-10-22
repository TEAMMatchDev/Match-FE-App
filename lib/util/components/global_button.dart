import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/util/const/style/global_color.dart';

import '../const/style/global_text_styles.dart';

class CommonButton extends StatelessWidget {
  final Future<void> Function() onTap;
  final String text;
  final int textSize;
  final Color backgroundColor;
  final Color textColor;
  final int verticalPadding;
  final int horizonatlPadding;
  final bool isBottom;

  const CommonButton({
    super.key,
    required this.onTap,
    required this.text,
    this.textSize = 14,
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.grey9,
    this.verticalPadding = 17,
    this.horizonatlPadding = 0,
    this.isBottom = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding.h, horizontal: horizonatlPadding.w),
          alignment: isBottom ? Alignment.bottomCenter : Alignment.center,
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: AppColors.grey1),
              borderRadius: BorderRadius.circular(10.r)),
          child: Text(text,
              style: AppTextStyles.T1Bold14.copyWith(
                  color: textColor, fontSize: textSize.sp)),
        ));
  }

  // //TODO: 추후 버튼 종류 추가될 경우 해당 주석 해제하여 color 변경
  // factory CommonButton.matchDetail({required String text}) {
  //   return CommonButton(
  //       onTap: (() async {
  //         //TODO: navigate 매치기록, 해지
  //       }),
  //       text: text);
  // }
  factory CommonButton.login(
      {String text = "로그인",
      int verticalPadding = 13,
      int textSize = 16,
      required Future<void> Function() onTap,
      bool isBottom = true}) {
    return CommonButton(
      text: text,
      verticalPadding: verticalPadding,
      onTap: onTap,
      backgroundColor: AppColors.black,
      textColor: AppColors.white,
      textSize: textSize,
      isBottom: isBottom,
    );
  }

  factory CommonButton.payment(
      {String text = "결제 방법 변경",
      int verticalPadding = 17,
      bool isActive = false,
      required Future<void> Function() onTap}) {
    return CommonButton(
      onTap: onTap,
      text: text,
      backgroundColor: AppColors.black,
      textColor: AppColors.white,
      textSize: 16,
      verticalPadding: verticalPadding,
    );
  }

  factory CommonButton.edit(
      {String text = "변경 완료",
      int verticalPadding = 13,
      bool isActive = false,
      required Future<void> Function() onTap}) {
    return CommonButton(
      onTap: onTap,
      text: text,
      backgroundColor: isActive ? AppColors.black : AppColors.grey0,
      textColor: isActive ? AppColors.white : AppColors.grey2,
      textSize: 16,
      verticalPadding: verticalPadding,
    );
  }

  factory CommonButton.phone(
      {String text = "인증번호 발송",
      int verticalPadding = 15,
      bool isActive = false,
      required Future<void> Function() onTap}) {
    return CommonButton(
      onTap: onTap,
      text: text,
      backgroundColor: isActive ? AppColors.black : AppColors.grey0,
      textColor: isActive ? AppColors.white : AppColors.grey2,
      textSize: 14,
      horizonatlPadding: 10,
      verticalPadding: verticalPadding,
    );
  }
}
