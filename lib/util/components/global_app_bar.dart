import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../const/global_variable.dart';

class CommonAppBar extends AppBar {
  CommonAppBar({
    Key? key,
    required Widget title,
    required Widget leading,
    List<Widget>? actions,
    double? elevation,
    bool? centerTitle = true,
    Color? backgroundColor = AppColors.white,
    double? leadingWidth = 36,
  }) : super(
          key: key,
          title: title,
          leading: leading,
          actions: actions,
          elevation: elevation,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor,
          leadingWidth: leadingWidth,
        );

  factory CommonAppBar.basic(String title) {
    return CommonAppBar(
      title: Text(
        title,
        style: AppTextStyles.heading3Bold16,
      ),
      leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: SvgPicture.asset(
              iconDir + "ic_arrow_left_24.svg",
            ),
          )),
      elevation: 0,
      centerTitle: true,
    );
  }
}
