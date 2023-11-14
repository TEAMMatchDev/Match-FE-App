import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'global_color.dart';

class CommonSkeleton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRaidus;

  const CommonSkeleton(
      {super.key, required this.width, required this.height, required this.borderRaidus});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.plainBackground,
      highlightColor: AppColors.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRaidus.r),
            color: AppColors.grey1),
      ),
    );
  }
  factory CommonSkeleton.ad() {
    return CommonSkeleton(
      width: 310.w,
      height: 50.h,
      borderRaidus: 10,
    );
  }
  factory CommonSkeleton.historyTitle() {
    return CommonSkeleton(
      width: 153.w,
      height: 18.h,
      borderRaidus: 10,
    );
  }
  factory CommonSkeleton.historyContent() {
    return CommonSkeleton(
      width: 56.w,
      height: 18.h,
      borderRaidus: 10,
    );
  }
  factory CommonSkeleton.event() {
    return CommonSkeleton(
      width: 299.w,
      height: 445.h,
      borderRaidus: 10,
    );
  }
}
