import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../const/global_variable.dart';

Widget TypeChip({required String type}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
    decoration: BoxDecoration(
      color: AppColors.grey0,
      borderRadius: BorderRadius.circular(4.r),
    ),
    child: Text(type,
        style: AppTextStyles.body3Bold12.copyWith(
          color: AppColors.grey6,
        )),
  );
}

///<h2>like Icon widget</h2>
///*좋아요 api 연동 및 재사용성이 높아 위젯으로 분리
class LikeIcon extends StatelessWidget {
  final Rx<bool> isLike;
  LikeIcon({
    super.key,
    required this.isLike,
  });

  ///API 연결이후에 테스트
  ///* 현재 동작X
  void onLikeTap() {
    var likeToastMsg = "매치를 찜하셨어요!";
    var dislikeToastMsg = "찜 내역에서 삭제됩니다!";
    Fluttertoast.showToast(
        msg: isLike.value ? dislikeToastMsg : likeToastMsg,
        //design 확인
        fontSize: 12.sp);
    isLike.value = !isLike.value;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => isLike.value
          ? GestureDetector(
              onTap: () => onLikeTap(),
              child: SvgPicture.asset(iconDir + "ic_like_able_24.svg"))
          : GestureDetector(
              onTap: () => onLikeTap(),
              child: SvgPicture.asset(iconDir + "ic_like_disable_24.svg")),
    );
  }
}
