import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../model/enum/project_type.dart';
import '../../../model/today_project/today_project.dart';
import '../../../util/components/global_widget.dart';
import '../../../util/const/style/global_color.dart';
import '../../home/widget/home_widget.dart';

///*검색결과 없는 경우 나오는 페이지
Widget emptyWidget(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      SvgPicture.asset(imgDir + "iv_tmp_empty.svg"),
      SizedBox(height: 24.h,),
      Text("검색 결과가 없습니다.",style: AppTextStyles.T1Bold18,)
    ],
  );
}
///* [DonateScreen]에서 사용
class ProjectWidget extends StatelessWidget {
  final TodayProject project;
  const ProjectWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TodayMatchList(
          count: project.totalDonationCnt,
          imgList: project.userProfileImages,
          projectId: project.projectId,
        ),
        SizedBox(
          height: 12.h,
        ),
        TypeChip(type: projectTypeMap[project.kind]?.stateName ?? "동물"),
        SizedBox(
          height: 8.h,
        ),
        Text(project.title, style: AppTextStyles.T1Bold15),
        SizedBox(
          height: 4.h,
        ),
        Text(project.usages,
            style: AppTextStyles.L1Medium13.copyWith(
              color: AppColors.grey7,
            ))
      ],
    );
  }
}

//* 후원 카테고리 선택 위젯
//*[ProjectType]
class CircleType extends StatelessWidget {
  final RxBool isSelect;
  final ProjectType? type;
  final bool isAll;
  const CircleType(
      {super.key, required this.isSelect, this.type, this.isAll = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: isSelect.value ? AppColors.grey9 : AppColors.grey0,
                width: isSelect.value ? 2 : 1),
          ),
          child: isAll
              ? Text("ALL",
                  style: AppTextStyles.T1Bold15.copyWith(
                    color: isSelect.value ? AppColors.grey9 : AppColors.grey3,
                    height: 1.4,
                  ))
              : SvgPicture.asset(iconDir +
                  "project/ic_${type?.engName}" +
                  (!isSelect.value ? "_unable" : "") +
                  ".svg"),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(type?.stateName ?? "전체",
            style: AppTextStyles.T1Bold13.copyWith(
              color: isSelect.value ? AppColors.grey9 : AppColors.grey3,
            )),
      ],
    );
  }
}
