import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:match/model/enum/banner_type.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../model/banner/banners.dart';
import '../../../provider/routes/routes.dart';
import '../../../util/const/global_mock_data.dart';

///*광고 section 순서 표시하는 위젯
Widget adIndexItem({required int total, required int currentIdx}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: const Color(0x4D000000)),
    child: RichText(
        text: TextSpan(children: [
      TextSpan(
        text: "$currentIdx",
        style: AppTextStyles.T1Bold12.copyWith(
            color: AppColors.white, letterSpacing: 0),
      ),
      TextSpan(
        text: " / $total",
        style: AppTextStyles.T1Bold12.copyWith(
            color: AppColors.grey4, letterSpacing: 0),
      )
    ])),
  );
}

///<h2> 광고 section widget</h2>
class BannerWidget extends StatelessWidget {
  final int totalItem;
  final int currentIdx;
  final Banners banner;

  const BannerWidget(
      {super.key,
      required this.totalItem,
      required this.currentIdx,
      required this.banner});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (banner.bannerType == BannerType.CONTENTS.name) {
          if (banner.contentsUrl == null) {
            Fluttertoast.showToast(msg: "해당 배너는 링크가 없습니다.");
          } else {
            if (Platform.isAndroid) {
              launchUrlString(
                      mode: LaunchMode.externalApplication, banner.contentsUrl!)
                  .catchError((err) {
                launchUrlString(
                    mode: LaunchMode.externalApplication,
                    'https://www.official-match.kr');
                return true;
              });
            }
            //IOS
            else if (Platform.isIOS) {
              launchUrlString(banner.contentsUrl!).catchError((err) {
                launchUrlString('https://www.official-match.kr');
                return true;
              });
            }
          }
        } else {
          Get.toNamed(Routes.event_detail,
              arguments: {"eventId": banner.eventId});
        }
      },
      child: Container(
          width: 310.w,
          height: 50.h,
          decoration: BoxDecoration(
            //radius 수정
            borderRadius: BorderRadius.circular(5.r),
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(banner.bannerImg),
            ),
          ),
          child: Stack(children: [
            Positioned(
                bottom: 6.h,
                right: 11.w,
                child: adIndexItem(total: totalItem, currentIdx: currentIdx))
          ])),
    );
  }
}

///*타오로는 불꽃이 위젯
///[HomeScreen], [BurningMathScreen]에서 사용
///초기화 위젯 생성을 위해 Flame 모델 field 각각을 생성자로 설정
class FlameWidget extends StatelessWidget {
  final String? flameName;
  final String? flameImg;
  final String? flameTalk;
  final String? usages;
  final int? id;
  final bool isHome;

  const FlameWidget(
      {super.key,
      this.flameName,
      this.flameImg,
      this.flameTalk = "이곳에 불꽃이를 생성해보세요!",
      this.usages,
      this.id,
      this.isHome = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        isHome
            ? await Get.toNamed(Routes.home + Routes.burning_match,
                arguments: {"donaionId": id})
            : null;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 298.h,
            width: 270.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(imgDir +
                    (flameName == null
                        //배경 색상에 따른 이미지 변경
                        ? "iv_home_background_blank.png"
                        : "iv_home_background.png")),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 18.h,
                ),
                usages != null ? usageChip() : const SizedBox.shrink(),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 250.w,
                  height: 57.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          AssetImage("${imgDir}ic_speech_background_232.png"),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: flameTalk != null
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 13.h,
                              child: SizedBox(
                                width: 240.w,
                                height: 30.h,
                                child: Text(
                                  flameTalk!,
                                  style: AppTextStyles.L1Medium12,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        )
                      : null,
                ),
                SizedBox(
                  height: 11.h,
                ),
                flameImg != null
                    ? Image.network(height: 114.h, width: 102.w, flameImg!)
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 10.h,
                ),
                flameName != null && flameName!.length > 3
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: Text(
                              flameName!.substring(0, flameName!.length - 3),
                              style: AppTextStyles.T1Bold18,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text("불꽃이", style: AppTextStyles.T1Bold18)
                        ],
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget usageChip() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(width: 1, color: AppColors.grey7),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(usages!, style: AppTextStyles.T1Bold12),
    );
  }
}

Widget profileItem(
    {String profileUrl = tmpProfileImg,
    double size = 22,
    bool isBorder = true}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: isBorder ? AppColors.white : Colors.transparent,
        width: 1.375,
      ),
    ),
    child: ClipOval(
      child: Image.network(
        tmpProfileImg,
        fit: BoxFit.fill,
      ),
    ),
  );
}

///* 오늘의 후원에서 사용되는 listTile
///[TodayMatchScreen]에서 사용되는 위젯<br/>
class TodayMatchList extends StatelessWidget {
  final int count;
  final List<String> imgList;
  final String backgroundImg;
  final int projectId;

  const TodayMatchList(
      {super.key,
      required this.count,
      required this.imgList,
      this.backgroundImg = tmpBackgroundImg,
      required this.projectId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Get.toNamed(Routes.project, arguments: {"projectId": projectId});
      },
      child: Container(
        height: 180.h,
        width: 320.w,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 1],
            colors: [
              Color(0x00000099),
              Color(0x0000001A),
            ],
          ),
          borderRadius: BorderRadius.circular(10.r),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(backgroundImg),
              colorFilter: ColorFilter.mode(
                  //TODO: gradient 적용 detail 수정
                  Colors.black.withOpacity(0.3),
                  BlendMode.srcATop)),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 17.h,
              left: 20.w,
              child: count == 0
                  ? Text(
                      "아직 후원하는 사람이 없어요.",
                      style: AppTextStyles.T1Bold12.copyWith(
                        color: AppColors.white,
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Wrap(
                            spacing: -4,
                            children: imgList
                                .map((e) => profileItem(size: 30))
                                .toList(),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "외 $count마리의 불꽃이 함께하고 있어요.",
                            style: AppTextStyles.L1Medium13.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
            )
          ],
        ),
      ),
    );
  }
}
