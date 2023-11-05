import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/modules/buring_match/controller/burning_match_controller.dart';
import 'package:match/modules/buring_match/widget/match_record_widget.dart';
import 'package:match/modules/home/widget/home_widget.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/components/global_app_bar.dart';
import '../../../util/const/style/global_logger.dart';
import '../../../util/const/style/global_skeleton.dart';

///<h2>불꽃이(기부 내역) 상세 정보 페이지</h2>
///[HomeScreen]에서 접근
class BurningMatchScreen extends GetView<BurningMatchController> {
  const BurningMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///* 상단 flame 정보
                  Center(
                    child: FlameWidget(
                      flameName: controller.flameDetail.value.inherenceName,
                      flameImg: controller.flameDetail.value.imgUrl,
                      usages: controller.flameDetail.value.usages,
                      flameTalk: controller.flameDetail.value.randomMessage,
                      isHome: false,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),

                  ///* flame 상세 정보
                  flameInfo(
                      title: "생성 횟수",
                      value: controller.flameDetail.value.sequence,
                      valueMsg: " 번째"),
                  flameInfo(
                      title: "전달된 온도",
                      value: controller.flameDetail.value.amount,
                      valueMsg: "°C"),

                  ///* 상단 flame 정보
                  Text(
                    "매치 기록",
                    style: AppTextStyles.T1Bold15,
                  ),
                  controller.flameHistories.isEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonSkeleton.historyTitle(),
                            SizedBox(
                              height: 6.h,
                            ),
                            CommonSkeleton.historyContent(),
                          ],
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.flameHistories.length,
                          itemBuilder: (context, index) {
                            logger.d(index);
                            //pagination 처리
                            if (index % (PAGINATION_SIZE - 1) == 0 &&
                                index != 0) {
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
                              isChange: history.historyStatus == "CHANGE"
                                  ? true
                                  : false,
                            );
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

  ///<h2>불꽃이 생성횟수, 기부금액 정보를 표시하는 위젯</h2>
  ///* text : text 형식으로 구성
  Widget flameInfo(
      {required String title, String? valueMsg, required int value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 80.w,
          child: Text(
            "$title = ",
            style: AppTextStyles.L1Medium14.copyWith(color: AppColors.grey6),
            textAlign: TextAlign.end,
          ),
        ),
        SizedBox(
          width: 70.w,
          child: Text(
            "$value ${valueMsg ?? ""}",
            style: AppTextStyles.S1SemiBold14.copyWith(color: AppColors.grey7),
            textAlign: TextAlign.end,
          ),
        ),
        SizedBox(
          width: 36.w,
        )
      ],
    );
  }
}
