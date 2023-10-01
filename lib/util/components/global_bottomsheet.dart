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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 27.h),
      child: Container(
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
                Text("매치 공유하기", style: AppTextStyles.heading2Bold18),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(iconDir + "ic_close_24.svg")),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            buttonTile(icon: "save_18", text: "매치 사진 저장하기"),
            buttonTile(icon: "copy_18", text: "링크 복사하기"),
            buttonTile(icon: "share_16", text: "카카오톡 공유하기"),
          ],
        ),
      ),
    );
  }

  Widget buttonTile({required String icon, required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(iconDir + "ic_${icon}.svg"),
          SizedBox(
            width: 12.w,
          ),
          Text(
            text,
            style: AppTextStyles.body1Regular15,
          ),
        ],
      ),
    );
  }
}
