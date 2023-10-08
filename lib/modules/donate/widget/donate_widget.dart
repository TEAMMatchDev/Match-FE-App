import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../model/enum/project_type.dart';
import '../../../util/const/style/global_color.dart';

//* 후원 카테고리 선택 위젯
//*[ProjectType]
class CircleType extends StatelessWidget {
  final bool isSelect;
  final ProjectType type;
  final bool isAll;
  const CircleType(
      {super.key,
      required this.isSelect,
      this.type = ProjectType.ANIMAL,
      this.isAll = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50.h,
          height: 50.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: isSelect ? AppColors.grey9 : AppColors.grey0,
                width: isSelect ? 2 : 1),
          ),
          child: isAll
              ? Text("ALL",
                  style: AppTextStyles.T1Bold15.copyWith(
                    color: isSelect ? AppColors.grey9 : AppColors.grey3,
                    height: 1.4,
                  ))
              : SvgPicture.asset(iconDir +
                  "ic_${type.engName}" +
                  (!isSelect ? "_unable" : "") +
                  ".svg"),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(type.stateName,
            style: AppTextStyles.T1Bold13.copyWith(
              color: isSelect ? AppColors.grey9 : AppColors.grey3,
            )),
      ],
    );
  }
}
