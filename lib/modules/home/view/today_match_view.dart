import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/home/controller/home_controller.dart';
import 'package:match/modules/home/widget/home_widget.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/const/global_variable.dart';

import '../../../util/components/global_widget.dart';
import '../../../util/const/style/global_color.dart';
import '../../../util/const/style/global_text_styles.dart';

///<h2>오늘의 후원 화면</h2>
///[HomeController]에서 [TodayProject]를 받아와서 화면에 뿌려준다.</br></br>
///[HomeController]에서 [HomeSceen]이 그려질때 해당 데이터를 가져오기때문에
/// 같은 Controller및 Binding 사용
class TodayMatchScreen extends GetView<HomeController> {
  const TodayMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("오늘의 후원"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Obx(
              () => Wrap(
                direction: Axis.vertical,
                spacing: 12.h,
                children: [
                  TodayMatchList(
                      count: 5,
                      imgList: ["df", "fds"],
                      isLike: controller.isLike),
                  TypeChip(type: controller.tmpText.value),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("후원 함께할 분, 들어와요! 아직 따끈한 후원 중!",
                          style: AppTextStyles.subtitle1Bold15),
                      Text("후원처명",
                          style: AppTextStyles.body2Regular13.copyWith(
                            color: AppColors.grey7,
                          )),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
