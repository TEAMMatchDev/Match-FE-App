import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/enum/social_type.dart';
import '../../../provider/service/auth_service.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

Widget SocialTypeEmailWidget() {
  return IntrinsicWidth(
    child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
    ]),
  );
}

///<h2>마이페이지에서 사용하는 타일</h2>
//
class MypageListTile extends StatelessWidget {
  final Future<void> Function()? onTap;
  final String title;
  final String? icon;
  final bool leading;
  final bool isLast;

  const MypageListTile({
    super.key,
    this.onTap,
    required this.title,
    this.icon,
    this.isLast = false,
    this.leading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: isLast
                ? null
                : Border(
                    bottom: BorderSide(color: AppColors.divider1, width: 1.h))),
        padding: EdgeInsets.symmetric(vertical: 16.h,).copyWith(
          right: leading ? 20.w : 0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon != null
                ? SvgPicture.asset(
                    "${iconDir}mypage/ic_${icon}_18.svg",
                    width: 18.w,
                  )
                : const SizedBox.shrink(),
            SizedBox(width: 14.w,),
            Text(title, style: AppTextStyles.T1Bold14),
            const Expanded(child: SizedBox.shrink()),
            leading
                ? SvgPicture.asset(
                    "${iconDir}ic_arrow_right_22.svg",
                    width: 24.w,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
