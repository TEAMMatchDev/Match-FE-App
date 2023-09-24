import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global_color.dart';

class AppTextStyles {
  AppTextStyles._();
  static const _defaultTextColor = AppColors.grey9;
  static const _defaultFontFamily = 'AppleSDGothicNeo';

  //design system 명시대로 나머지는 행간 auto로 설정
  static const _body1Height = 28.0 / 15.0;
  static const _body2Height = 28.0 / 14.0;

  static var heading1Medium24 = TextStyle(
      color: _defaultTextColor,
      fontFamily: _defaultFontFamily,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.1);
  static var heading2Bold18 = TextStyle(
      color: _defaultTextColor,
      fontFamily: _defaultFontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.08);
  static var heading3Bold16 = TextStyle(
      color: _defaultTextColor,
      fontFamily: _defaultFontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.08);
  static var subtitle1Bold15 = TextStyle(
      color: _defaultTextColor,
      fontFamily: _defaultFontFamily,
      fontSize: 15.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.08);
  static var subtitle2Bold14 = TextStyle(
      color: _defaultTextColor,
      fontFamily: _defaultFontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.08);
  static var subtitle3Bold13 = TextStyle(
      color: _defaultTextColor,
      fontFamily: _defaultFontFamily,
      fontSize: 13.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.08);
  static var body1Regular15 = TextStyle(
      color: _defaultTextColor,
      fontFamily: _defaultFontFamily,
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      height: _body1Height,
      letterSpacing: -0.08);
  static var body2Regular13 = TextStyle(
      color: _defaultTextColor,
      fontFamily: _defaultFontFamily,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      height: _body2Height,
      letterSpacing: -0.08);
  //design guide 아직 추가 전
  static var body3Bold12 = TextStyle(
      color: _defaultTextColor,
      fontFamily: _defaultFontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.08);
}
