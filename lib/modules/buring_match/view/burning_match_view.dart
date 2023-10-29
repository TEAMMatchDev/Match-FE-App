import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:match/model/match_history/match_history.dart';
import 'package:match/modules/buring_match/controller/burning_match_controller.dart';
import 'package:match/modules/buring_match/widget/match_record_widget.dart';
import 'package:match/modules/home/widget/home_widget.dart';
import 'package:match/util/components/global_widget.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import 'package:timeline_tile_nic/timeline_tile.dart';

import '../../../provider/api/util/global_api_field.dart';
import '../../../util/components/global_app_bar.dart';
import '../../../util/const/global_variable.dart';
import '../../../util/const/style/global_logger.dart';

class BurningMatchScreen extends GetView<BurningMatchController> {
  const BurningMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: 라우팅 수정전 임시 controller init
    Get.put(BurningMatchController());
    return Scaffold(
      appBar: CommonAppBar.basic("불꽃이 스토리"),
      body: Obx(
        () => ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: [
            const Divider(
              thickness: 1,
              color: AppColors.divider1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w)
                  .copyWith(bottom: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///*. 상단 flame 정보
                  Center(
                    child: FlameWidget(
                      flameName: controller.flameDetail.value.inherenceName,
                      flameImg: controller.flameDetail.value.imgUrl,
                      usages: controller.flameDetail.value.usages,
                      flameTalk: controller.flameDetail.value.randomMessage,
                      // flameTalk: controller.flameDetail.value.fl,
                      isHome: false,
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  flameInfo(
                      title: "생성 횟수",
                      value: controller.flameDetail.value.sequence,
                      valueMsg: " 번째"),
                  flameInfo(
                      title: "전달된 온도",
                      value: controller.flameDetail.value.amount,
                      valueMsg: "°C"),

                  //매치 기록 제목
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 17.h)
                        .copyWith(bottom: 0.h),
                    child: Text(
                      "매치 기록",
                      style: AppTextStyles.T1Bold15,
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.flameHistories.length,
                    itemBuilder: (context, index) {
                      logger.d(index);
                      if (index % (PAGINATION_SIZE - 1) == 0 && index != 0) {
                        logger.d("1. getMoreFlame 호출!");
                        Future.wait({
                          controller.getMoreFlameHistory(
                              index ~/ (PAGINATION_SIZE - 1))
                        });
                      }
                      final history = controller.flameHistories[index];
                      return MatchRecord(
                          title: history.histories,
                          date: history.historyDate,
                          imgList: history.donationHistoryImages
                                  ?.map((e) => e.imageUrl)
                                  .toList() ??
                              [],
                      isChange: history.historyStatus == "CHANGE"?true:false,);
                    },
                  ),
                  // 매치기록
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget flameInfo(
      {required String title, String? valueMsg, required int value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 80.w,
          child: Text(
            title + " = ",
            style: AppTextStyles.L1Medium14.copyWith(color: AppColors.grey6),
            textAlign: TextAlign.end,
          ),
        ),
        SizedBox(
          width: 70.w,
          child: Text(
            "${value} ${valueMsg ?? ""}",
            style: AppTextStyles.S1SemiBold14.copyWith(color: AppColors.grey7),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
