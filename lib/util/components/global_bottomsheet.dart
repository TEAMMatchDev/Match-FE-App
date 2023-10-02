import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../const/style/global_color.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 27.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("매치 공유하기", style: AppTextStyles.T1Bold18),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(iconDir + "ic_close_24.svg")),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            //TODO: 후원 상세 페이지에서는 매치 사진 저장하기 부분 삭제
            //TODO: 각 button 로직 추가
            buttonTile(icon: "save_18", text: "매치 사진 저장하기"),
            buttonTile(icon: "copy_18", text: "링크 복사하기"),
            buttonTile(icon: "share_18", text: "카카오톡 공유하기"),
          ],
        ),
      ),
    );
  }

  /// bottomSheet button tile
  Widget buttonTile({required String icon, required String text}) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(iconDir + "ic_${icon}.svg"),
            SizedBox(
              width: 12.w,
            ),
            Text(
              text,
              style: AppTextStyles.T1Bold15,
            ),
          ],
        ),
      ),
    );
  }
}
