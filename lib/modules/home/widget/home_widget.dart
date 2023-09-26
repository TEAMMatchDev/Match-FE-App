import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

Widget CommonSectionHeader(
    {required String title, required Future<void> Function() destination}) {
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
            onTap: destination,
            child: SvgPicture.asset(iconDir + "ic_arrow_right_22.svg"))
      ],
    ),
  );
}

///*서버 통신 로직 구현전에 사용할 임시 프로필이미지
const String tmpProfileImg =
    "http://k.kakaocdn.net/dn/bq8XQY/btsjqweTr1J/c0kplPW8eo8iOCeoYTBGxK/img_640x640.jpg";
const String tmpBackgroundImg =
    "https://match-image.s3.ap-northeast-2.amazonaws.com/project/1/1fd4cf5b-1863-432f-8277-f51bccd0c3e6.png";

///API 연결이후에 테스트
///* 현재 동작X
void onLikeTap({
  required Rx<bool> isLike,
}) {
  var likeToastMsg = "매치를 찜하셨어요!";
  var dislikeToastMsg = "찜 내역에서 삭제됩니다!";
  // Fluttertoast.showToast(
  //     msg: isLike.value ? dislikeToastMsg : likeToastMsg,
  //     //design 확인
  //     fontSize: 12.sp);
  isLike.value = !isLike.value;
}

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
        style: AppTextStyles.body3Bold12
            .copyWith(color: AppColors.white, letterSpacing: 0),
      ),
      TextSpan(
        text: " / ${total}",
        style: AppTextStyles.body3Bold12
            .copyWith(color: AppColors.grey4, letterSpacing: 0),
      )
    ])),
  );
}

///* 나의 매치(불타는 매치) section
class MyMatchItem extends StatelessWidget {
  final String title;
  final int count;
  final List<String> imgList;
  final String backgroundImg;
  final Future<void> Function() destination;
  const MyMatchItem(
      {super.key,
      required this.title,
      required this.count,
      required this.imgList,
      this.backgroundImg = tmpBackgroundImg,
      required this.destination});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: destination,
      child: Container(
        height: 180.h,
        width: 280.w,
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
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Wrap(
                      spacing: -4,
                      children:
                          imgList.map((e) => profileItem(size: 16)).toList(),
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
      ),
    );
  }
}

///*오늘의 매치 section
class TodayMatchItem extends StatelessWidget {
  final String title;
  final String organization;
  final int count;
  final Rx<bool> isLike;
  final String backgroundImg;
  const TodayMatchItem(
      {super.key,
      required this.title,
      required this.organization,
      required this.count,
      required this.isLike,
      this.backgroundImg = tmpBackgroundImg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: add route
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170.h,
            width: 130.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
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
                LikeIcon(isLike: isLike),
                Positioned(
                    bottom: 14.h,
                    left: 14.w,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            //TODO: boxfit.fill로 변경
                            //TODO: 테두리 하얀색으로 변경
                            profileItem(),
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
      ),
    );
  }
}

///<h2>like Icon widget</h2>
///*좋아요 api 연동 및 재사용성이 높아 위젯으로 분리
class LikeIcon extends StatelessWidget {
  final Rx<bool> isLike;
  final int leftPosition;
  final int topPosition;

  const LikeIcon({
    super.key,
    required this.isLike,
    this.leftPosition = 12,
    this.topPosition = 17,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: leftPosition.w,
        top: topPosition.h,
        child: isLike.value
            ? GestureDetector(
                onTap: () => onLikeTap(isLike: isLike),
                child: SvgPicture.asset(iconDir + "ic_like_able_24.svg"))
            : GestureDetector(
                onTap: () => onLikeTap(isLike: isLike),
                child: SvgPicture.asset(iconDir + "ic_like_disable_24.svg")));
  }
}

///*꼭 맞는 기부처 추천 section
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
      this.backgroundImg =
          "https://match-image.s3.ap-northeast-2.amazonaws.com/project/1/1fd4cf5b-1863-432f-8277-f51bccd0c3e6.png"});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: add route
      },
      child: Container(
        height: 99.h,
        width: 220.w,
        padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 23.w),
        decoration: BoxDecoration(
          //radius 수정
          borderRadius: BorderRadius.circular(10.r),
          image: DecorationImage(
            image: NetworkImage(backgroundImg),
            colorFilter:
                ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.src),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style:
                AppTextStyles.subtitle1Bold15.copyWith(color: AppColors.white),
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
                style:
                    AppTextStyles.body3Bold12.copyWith(color: AppColors.white),
              )
            ],
          )
        ]),
      ),
    );
  }
}

Widget profileItem({String profileUrl = tmpProfileImg, double size = 22}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: AppColors.white,
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
class TodayMatchList extends StatelessWidget {
  final int count;
  final List<String> imgList;
  final String backgroundImg;
  final Rx<bool> isLike;
  const TodayMatchList(
      {super.key,
      required this.count,
      required this.imgList,
      this.backgroundImg = tmpBackgroundImg,
      required this.isLike});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: 유저 해당 매치 상세보기 page 연결
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
            LikeIcon(
              isLike: isLike,
              leftPosition: 25,
              topPosition: 22,
            ),
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
                  "외 ${count}명 후원중",
                  style: AppTextStyles.body2Regular13.copyWith(
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
