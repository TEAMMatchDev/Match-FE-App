import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../home/widget/home_widget.dart';

class ProjectComment extends StatelessWidget {
  final String profileUrl;
  final String profile;
  final String comment;
  final String timeStamp;
  final bool isEdit;
  const ProjectComment(
      {super.key,
      required this.profileUrl,
      required this.profile,
      required this.comment,
      required this.timeStamp,
      required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        profileItem(profileUrl: profileUrl, isBorder: false),
        SizedBox(width: 11.w),
        Expanded(
          child: Column(
            children: [
              Text(
                profile,
                style: AppTextStyles.T1Bold13,
              ),
              SizedBox(height: 6.h),
              Text(
                comment,
                style:
                    AppTextStyles.S1SemiBold12.copyWith(color: AppColors.grey7),
              ),
              SizedBox(height: 6.h),
              SizedBox(
                width: 251.w,
                child: Text(
                  timeStamp,
                  style:
                      AppTextStyles.L1Medium10.copyWith(color: AppColors.grey4),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        isEdit
            ? SvgPicture.asset(iconDir + "ic_more_18.svg")
            : SizedBox.shrink()
      ],
    );
  }
}
