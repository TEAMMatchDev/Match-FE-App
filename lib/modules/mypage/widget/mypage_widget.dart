import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/enum/social_type.dart';
import '../../../provider/service/auth_service.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

Widget SocialTypeEmailWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AuthService.to.myProfile.value.socialType != SocialType.NORMAL.name
            ? Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: SvgPicture.asset(
                    "${iconDir}login/ic_${socialTypeToIcon[AuthService.to.myProfile.value.socialType]}.svg"),
              )
            : const SizedBox.shrink(),
        Text(AuthService.to.myProfile.value.email,
            style: AppTextStyles.S1SemiBold14.copyWith(
              color: AppColors.grey6,
            )),
      ]);
}
