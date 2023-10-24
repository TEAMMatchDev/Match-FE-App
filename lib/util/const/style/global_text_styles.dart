import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global_color.dart';

class AppTextStyles {
  AppTextStyles._();

  static const _defaultTextColor = AppColors.grey9;
  static const _defaultFontFamily = 'AppleSDGothicNeo';

  //design system 명시대로 나머지는 행간 auto로 설정
  static const _regularHeight = 1.5;

  static var T1Bold24 = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 24.sp,
    height: _regularHeight,
    fontWeight: FontWeight.w700,
  );
  static var T1Bold20 = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 20.sp,
    height: _regularHeight,
    fontWeight: FontWeight.w700,
  );

  static var T1Bold18 = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 18.sp,
    height: _regularHeight,
    fontWeight: FontWeight.w700,
  );
  static var T1Bold16 = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 16.sp,
    height: _regularHeight,
    fontWeight: FontWeight.w700,
  );
  static var T1Bold15 = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    height: _regularHeight,
  );
  static var T1Bold14 = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 14.sp,
    height: _regularHeight,
    fontWeight: FontWeight.w700,
  );
  static var S1SemiBold14 = T1Bold14.copyWith(fontWeight: FontWeight.w600);
  static var L1Medium14 = T1Bold14.copyWith(fontWeight: FontWeight.w500);

  static var T1Bold13 = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
    height: _regularHeight,
  );
  static var S1SemiBold13 = T1Bold13.copyWith(fontWeight: FontWeight.w600);
  static var L1Medium13 = T1Bold13.copyWith(fontWeight: FontWeight.w500);

  static var T1Bold12 = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    height: _regularHeight,
  );
  static var S1SemiBold12 = T1Bold12.copyWith(fontWeight: FontWeight.w600);
  static var L1Medium12 = T1Bold12.copyWith(fontWeight: FontWeight.w500);

  static var T1Bold10 = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    height: _regularHeight,
  );
  static var S1SemiBold10 = T1Bold10.copyWith(fontWeight: FontWeight.w600);
  static var L1Medium10 = T1Bold10.copyWith(fontWeight: FontWeight.w500);
}
