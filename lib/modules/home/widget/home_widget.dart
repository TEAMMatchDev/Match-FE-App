import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

Widget CommonSectionHeader(
    {required String title, required String destination}) {
  return Padding(
    padding: EdgeInsets.only(top: 31.h, bottom: 17.5.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.heading3Bold16,
        ),
        GestureDetector(
            onTap: () async {
              //상세페이지 구현전까지 주석처리
              // await Get.toNamed(destination);
            },
            child: SvgPicture.asset(iconDir + "ic_arrow_right_22.svg"))
      ],
    ),
  );
}

///* 나의 매치 section
class MyMatchItem extends StatelessWidget {
  final String title;
  final int count;
  final List<String> imgList;
  const MyMatchItem(
      {super.key,
      required this.title,
      required this.count,
      required this.imgList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: 280.w,
      decoration: BoxDecoration(
        //radius 수정
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(imgDir + "iv_test_ad_320.png"),
            colorFilter: ColorFilter.mode(
                //TODO: gradient 적용 detail 수정
                Colors.black.withOpacity(0.6),
                BlendMode.saturation)),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 14.h,
              right: 17.w,
              child: SvgPicture.asset(iconDir + "ic_share_16.svg")),
          Positioned(
            bottom: 23.h,
            left: 23.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body1Regular15.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(children: [
                  //TODO: 프로필
                  Stack(
                    children: [],
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    "${count}명 후원중",
                    style: AppTextStyles.body3Bold12.copyWith(
                      color: AppColors.white,
                    ),
                  )
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TodayMatchItem extends StatelessWidget {
  final String title;
  final String organization;
  final int count;
  final Rx<bool> isLike;
  //TODO: imgUrl 추가
  const TodayMatchItem(
      {super.key,
      required this.title,
      required this.organization,
      required this.count,
      required this.isLike});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 170.h,
          width: 130.w,
          decoration: BoxDecoration(
            //radius 수정
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(imgDir + "iv_test_ad_320.png"),
                colorFilter: ColorFilter.mode(
                    //TODO: gradient 적용 detail 수정
                    Colors.black.withOpacity(0.6),
                    BlendMode.saturation)),
          ),
          child: Stack(
            children: [
              Obx(
                () => Positioned(
                    right: 12.w,
                    top: 12.h,
                    child: isLike.value
                        ? GestureDetector(
                            onTap: () {
                              isLike.value = false;
                            },
                            child: SvgPicture.asset(
                                iconDir + "ic_like_able_24.svg"))
                        : GestureDetector(
                            onTap: () {
                              isLike.value = true;
                            },
                            child: SvgPicture.asset(
                                iconDir + "ic_like_disable_24.svg"))),
              ),
              Positioned(
                  bottom: 14.h,
                  left: 14.w,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          //TODO: boxfit.fill로 변경
                          //TODO: 테두리 하얀색으로 변경
                          CircleAvatar(
                            child: Image.asset(imgDir + "iv_test_ad_320.png"),
                            radius: 11.r,
                          ),
                          Text(
                            "+${count}",
                            style: AppTextStyles.subtitle3Bold13
                                .copyWith(color: AppColors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(organization,
                          style: AppTextStyles.subtitle3Bold13.copyWith(
                            color: AppColors.white,
                          )),
                    ],
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        Text(
          title,
          style: AppTextStyles.subtitle3Bold13,
        )
      ],
    );
  }
}

class OrganizationItem extends StatelessWidget {
  final String title;
  final String comment;
  //TODO: imgUrl
  const OrganizationItem(
      {super.key, required this.title, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 99.h,
      width: 220.w,
      padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 23.w),
      decoration: BoxDecoration(
        //radius 수정
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          image: AssetImage(imgDir + "iv_test_ad_320.png"),
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3), BlendMode.srcOver),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: AppTextStyles.subtitle1Bold15.copyWith(color: AppColors.white),
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            SvgPicture.asset("${iconDir}ic_comment_16.svg"),
            SizedBox(
              width: 4.w,
            ),
            Text(
              comment,
              style: AppTextStyles.body3Bold12.copyWith(color: AppColors.white),
            )
          ],
        )
      ]),
    );
  }
}
