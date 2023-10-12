import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../provider/routes/routes.dart';
import '../../../util/components/global_widget.dart';

///*서버 통신 로직 구현전에 사용할 임시 프로필이미지
const String tmpProfileImg =
    "http://k.kakaocdn.net/dn/bq8XQY/btsjqweTr1J/c0kplPW8eo8iOCeoYTBGxK/img_640x640.jpg";
const String tmpBackgroundImg =
    "https://match-image.s3.ap-northeast-2.amazonaws.com/project/1/1fd4cf5b-1863-432f-8277-f51bccd0c3e6.png";

///색상있는 버전
const String tmpBackgroundImg2 =
    "https://match-image.s3.ap-northeast-2.amazonaws.com/profile.png";

///*광고 section 순서 표시하는 위젯
Widget adIndexItem({required int total, required int currentIdx}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r), color: Color(0x4D000000)),
    child: RichText(
        text: TextSpan(children: [
      TextSpan(
        text: "${currentIdx}",
        style: AppTextStyles.T1Bold12.copyWith(
            color: AppColors.white, letterSpacing: 0),
      ),
      TextSpan(
        text: " / ${total}",
        style: AppTextStyles.T1Bold12.copyWith(
            color: AppColors.grey4, letterSpacing: 0),
      )
    ])),
  );
}

///*타오로는 불꽃이 위젯
///[HomeScreen]에서 사용
class HomeFlame extends StatelessWidget {
  final String flameName;
  final String flameImg;
  final String flameTalk;
  final String usages;
  final int id;
  const HomeFlame(
      {super.key,
      required this.flameName,
      required this.flameImg,
      required this.flameTalk,
      required this.usages,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Get.toNamed(Routes.home + Routes.burning_match,
            arguments: {"donaionId": 1});
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 283.h,
              width: 255.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imgDir + "iv_home_background_553.png"),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  UsagesChip(),
                  SizedBox(
                    height: 28.h,
                  ),
                  Container(
                    width: 232.w,
                    height: 57.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image:
                            AssetImage(imgDir + "ic_speech_background_232.png"),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 13.h,
                          child: Text(
                            flameTalk,
                            style: AppTextStyles.L1Medium12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Image.network(height: 122.h, width: 182.w, flameImg)
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(flameName, style: AppTextStyles.T1Bold20)
          ],
        ),
      ),
    );
  }

  Widget UsagesChip() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.grey0,
        border: Border.all(width: 1, color: AppColors.grey7),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(usages, style: AppTextStyles.T1Bold12),
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
  final Rx<bool> isLike;
  final int projectId;
  const TodayMatchList(
      {super.key,
      required this.count,
      required this.imgList,
      this.backgroundImg = tmpBackgroundImg,
      required this.isLike,
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
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Wrap(
                  spacing: -4,
                  children: imgList.map((e) => profileItem(size: 30)).toList(),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  "외 ${count}마리의 불꽃이 함께하고 있어요.",
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
