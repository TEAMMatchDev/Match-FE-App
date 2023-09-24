import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global_color.dart';

class AppTextStyles {
  AppTextStyles._();
  static const _defaultTextColor = AppColors.grey9;
  static const _defaultFontFamily = 'AppleSDGothicNeo';

  static const _heading1Height = 45.0 / 30.0;
  static const _title3Height = 19.0 / 16.0;
  static const _body2Height = 16.0 / 13.0;
  static const _body3Height = 14.0 / 12.0;

  //TODO: design font system 구축시 수정
  static var heading1Bold = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    height: _heading1Height,
  );
  static var title3Bold = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: _title3Height,
  );
  static var body2Regular = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    height: _body2Height,
  );
  static var body3Bold = TextStyle(
    color: _defaultTextColor,
    fontFamily: _defaultFontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    height: _body3Height,
  );
}
