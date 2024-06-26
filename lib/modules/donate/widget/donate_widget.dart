import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:match/provider/api/project_api.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../model/enum/project_type.dart';
import '../../../model/today_project/today_project.dart';
import '../../../provider/routes/routes.dart';
import '../../../util/components/global_widget.dart';
import '../../../util/const/global_mock_data.dart';
import '../../../util/const/style/global_color.dart';
import '../../home/widget/home_widget.dart';

///<h2>검색결과 없는 경우 나오는 페이지</h2>
Widget emptyWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      SvgPicture.asset("${imgDir}ic_search_empty.svg"),
      SizedBox(
        height: 24.h,
      ),
      Text(
        "검색 결과가 없습니다.",
        style: AppTextStyles.T1Bold18,
      )
    ],
  );
}

///<h2>like Icon widget</h2>
class LikeIcon extends StatelessWidget {
  final Rx<bool> isLike;
  final int projectId;

  const LikeIcon({
    super.key,
    required this.isLike,
    required this.projectId,
  });

  ///TODO: API 연결
  Future<void> onLikeTap() async {
    var likeToastMsg = "찜했어요!";
    var dislikeToastMsg = "찜에서 삭제했어요!";
    var tmpLikeStatus = await ProjectApi.setProjectLike(
        projectId: projectId, isLike: isLike.value);
    if (tmpLikeStatus != isLike.value) {
      Fluttertoast.showToast(
          msg: isLike.value ? dislikeToastMsg : likeToastMsg, fontSize: 12.sp);
      isLike.value = !isLike.value;
    } else {
      Fluttertoast.showToast(msg: "요청에 실패했습니다. 잠시후에 다시 시도해주세요");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => isLike.value
          ? GestureDetector(
              onTap: () => onLikeTap(),
              child: SvgPicture.asset("${iconDir}ic_like_able_24.svg"))
          : GestureDetector(
              onTap: () => onLikeTap(),
              child: SvgPicture.asset("${iconDir}ic_like_disable_24.svg")),
    );
  }
}

///* [DonateScreen], [DonateSearchScreen]에서 사용
/// [TodayProject] model의 field들로 후원 Project 상세 내용을 보여주는 위젯
class ProjectWidget extends StatelessWidget {
  final TodayProject project;

  const ProjectWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///* 프로젝트 이미지, 후원자수를 표시하는 위젯
        TodayMatchList(
            count: project.totalDonationCnt,
            imgList: project.userProfileImages,
            backgroundImg: project.imgUrl,
            projectId: project.projectId,
            isLike: project.like),

        ///* 후원처명, 분야, 후원 제목을 나타냄
        SizedBox(
          height: 12.h,
        ),
        TypeChip(type: projectTypeMap[project.kind]?.stateName ?? "동물"),
        SizedBox(
          height: 8.h,
        ),
        Text(project.title, style: AppTextStyles.T1Bold15),
        SizedBox(
          height: 4.h,
        ),
        Text(project.usages,
            style: AppTextStyles.L1Medium13.copyWith(
              color: AppColors.grey7,
            ))
      ],
    );
  }
}

///<h2>후원 카테고리 선택 위젯</h2>
///*[ProjectType]enum을 이용하여 구현
class CircleType extends StatelessWidget {
  final RxBool isSelect;
  final ProjectType? type;
  final bool isAll;

  const CircleType(
      {super.key, required this.isSelect, this.type, this.isAll = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: isSelect.value ? AppColors.grey9 : AppColors.grey0,
                width: isSelect.value ? 2 : 1),
          ),
          child: isAll
              ? Text("ALL",
                  style: AppTextStyles.T1Bold15.copyWith(
                    color: isSelect.value ? AppColors.grey9 : AppColors.grey3,
                    height: 1.4,
                  ))
              : SvgPicture.asset(
                  "${iconDir}project/ic_${type?.engName}${!isSelect.value ? "_unable" : ""}.svg"),
        ),
        Text(type?.stateName ?? "전체",
            style: AppTextStyles.T1Bold13.copyWith(
              color: isSelect.value ? AppColors.grey9 : AppColors.grey3,
            )),
      ],
    );
  }
}

///<h2>기부처 탐색, 검색화면에서 공통적으로 사용되는 위젯의 이미지 부분</h2>
///* [ProjectWidget]에서 사용되는 위젯
class TodayMatchList extends StatelessWidget {
  final int count;
  final List<String> imgList;
  final String backgroundImg;
  final int projectId;
  final bool isLike;

  const TodayMatchList(
      {super.key,
      required this.count,
      required this.imgList,
      this.backgroundImg = tmpBackgroundImg,
      required this.projectId,
      required this.isLike});

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
                top: 16.h,
                right: 19.w,
                child: LikeIcon(projectId: projectId, isLike: isLike.obs)),
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
                                .map(
                                    (e) => profileItem(size: 30, profileUrl: e))
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
