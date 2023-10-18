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

import '../../../util/components/global_app_bar.dart';
import '../../../util/const/global_variable.dart';

class BurningMatchScreen extends GetView<BurningMatchController> {
  const BurningMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: 라우팅 수정전 임시 controller init
    Get.put(BurningMatchController());
    return Scaffold(
      appBar: CommonAppBar.basic("불꽃이 스토리"),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          //1. 후원타이틀
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "후원 타이틀",
                  style: AppTextStyles.T1Bold18,
                ),
                //TODO:임시 하드코딩
                TypeChip(type: "매칭 진행 중")
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: AppColors.divider1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //*매치 정보
                FlameWidget(
                  flameName: "순두부찌개 먹은 불꽃이",
                  flameImg: tmpBackgroundImg,
                  flameTalk: "말을 겁니다 후원집행시, 생성시, ",
                  usages: "T.B.T 레스큐",
                  id: 1,
                  isHome: false,
                ),
                SizedBox(
                  height: 19.h,
                ),
                flameInfo(title: "생성 횟수", value: 1, valueMsg: " 번째 생성"),
                flameInfo(title: "전달된 온도", value: 5000, valueMsg: "°C"),

                //매치 기록 제목
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: Text(
                    "매치 기록",
                    style: AppTextStyles.T1Bold15,
                  ),
                ),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final history = controller.matchHistories[index];
                      return MatchRecord(
                          title: history.histories,
                          date: history.historyDate,
                          imgList: history.donationHistoryImages);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 12.h,
                      );
                    },
                    itemCount: controller.matchHistories.length),
                // 매치기록
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget flameInfo(
      {required String title, String? valueMsg, required int value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title + "= ",
          style: AppTextStyles.L1Medium14.copyWith(color: AppColors.grey6),
        ),
        Text(
          "${value} ${valueMsg ?? ""}",
          style: AppTextStyles.L1Medium14.copyWith(color: AppColors.grey7),
        ),
      ],
    );
  }
}
