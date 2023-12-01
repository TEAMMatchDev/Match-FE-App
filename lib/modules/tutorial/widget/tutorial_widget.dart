import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../model/enum/project_type.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

//TODO: 기획 확인후, donateWidget과 통일
///* 튜토리얼에서 프로젝트 타입 선택하는 위젯
Widget categoryType({
  required ProjectType type,
  required Rx<bool> isSelect,
}) {
  return Column(
    children: [
      Obx(
        ()=> Container(
          width: 60.w,
          height: 60.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelect.value ? AppColors.primary100 : AppColors.white,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.grey9, width: 2),
          ),
          child: SvgPicture.asset(
            "${iconDir}project/ic_${type.engName}.svg",
            height: 30.w,
          ),
        ),
      ),
      SizedBox(
        height: 6.h,
      ),
      Text(type.stateName, style: AppTextStyles.T1Bold14),
    ],
  );
}
