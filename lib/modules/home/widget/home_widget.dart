import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  final String backgroundImg;
  const MyMatchItem(
      {super.key,
      required this.title,
      required this.count,
      required this.imgList,
      //TODO: NetworkImage(backgroundImg)로 변경
      this.backgroundImg = imgDir + "iv_test_ad_320.png"});

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
            //TODO: NetworkImage(backgroundImg)로 변경
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
              child: GestureDetector(
                  onTap: () {
                    //TODO: share 기능 구현/ 저장,복사,공유하기 버튼
                  },
                  child: SvgPicture.asset(iconDir + "ic_share_16.svg"))),
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
  //TODO: NetworkImage(backgroundImg)로 변경
  final String backgroundImg;
  const TodayMatchItem(
      {super.key,
      required this.title,
      required this.organization,
      required this.count,
      required this.isLike,
      this.backgroundImg = imgDir + "iv_test_ad_320.png"});

  @override
  Widget build(BuildContext context) {
    var onLikeTap = () {
      var likeToastMsg = "매치를 찜하셨어요!";
      var dislikeToastMsg = "찜 내역에서 삭제됩니다!";
      Fluttertoast.showToast(
          msg: isLike.value ? dislikeToastMsg : likeToastMsg,
          //design 확인
          fontSize: 12.sp);
      isLike.value = !isLike.value;
    };
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
                //TODO: NetworkImage(backgroundImg)로 변경
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
                            onTap: onLikeTap,
                            child: SvgPicture.asset(
                                iconDir + "ic_like_able_24.svg"))
                        : GestureDetector(
                            onTap: onLikeTap,
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
  //TODO: NetworkImage(backgroundImg)로 변경
  final String backgroundImg;
  const OrganizationItem(
      {super.key,
      required this.title,
      required this.comment,
      //TODO: NetworkImage(backgroundImg)로 변경
      this.backgroundImg = imgDir + "iv_test_ad_320.png"});

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
