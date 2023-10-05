import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:logger/logger.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../const/style/global_color.dart';

class ShareBottomSheet extends StatelessWidget {
  final String imgUrl;
  final String usages;
  final String title;
  final String appLink;
  const ShareBottomSheet(
      {super.key,
      required this.imgUrl,
      required this.usages,
      required this.title,
      required this.appLink});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 27.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("매치 공유하기", style: AppTextStyles.T1Bold18),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(iconDir + "ic_close_24.svg")),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            //TODO: 후원 상세 페이지에서는 매치 사진 저장하기 부분 삭제
            //TODO: 각 button 로직 추가
            buttonTile(icon: "save_18", text: "매치 사진 저장하기", type: "SAVE"),
            buttonTile(icon: "copy_18", text: "링크 복사하기", type: "LINK"),
            buttonTile(icon: "share_18", text: "카카오톡 공유하기", type: "KAKAO"),
          ],
        ),
      ),
    );
  }

  /// bottomSheet button tile
  Widget buttonTile(
      {required String icon, required String text, required type}) {
    return GestureDetector(
      onTap: () {
        switch (type) {
          case "KAKAO":
            kakoShare(
                imgUrl: imgUrl, usages: usages, title: title, appLink: appLink);
            break;
          case "LINK":
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(iconDir + "ic_${icon}.svg"),
            SizedBox(
              width: 12.w,
            ),
            Text(
              text,
              style: AppTextStyles.T1Bold15,
            ),
          ],
        ),
      ),
    );
  }

  ///*카카오톡 공유하기 메소드
  Future<void> kakoShare(
      {required String imgUrl,
      required String usages,
      required String title,
      required String appLink}) async {
    ShareClient shareClient = ShareClient.instance;
    //카카오톡 설치 여부 판별
    bool isKakaoTalkSharingAvailable =
        await shareClient.isKakaoTalkSharingAvailable();
    //카카오톡 공유하기 위젯
    final FeedTemplate shareFeed = FeedTemplate(
      content: Content(
        title: usages,
        description: title,
        imageUrl: Uri.parse(imgUrl),
        link: Link(
          mobileWebUrl: Uri.parse(appLink),
          // androidExecutionParams: ,
          // iosExecutionParams: ,
        ),
      ),
      buttonTitle: "매치 보러가기",
    );

    if (isKakaoTalkSharingAvailable) {
      try {
        Uri uri = await shareClient.shareDefault(template: shareFeed);
        await shareClient.launchKakaoTalk(uri);
        Logger().d('카카오톡 공유 완료');
      } catch (error) {
        Logger().d('카카오톡 공유 실패 $error');
      }
    } else {
      try {
        Uri shareUrl =
            await WebSharerClient.instance.makeDefaultUrl(template: shareFeed);
        await launchBrowserTab(shareUrl, popupOpen: true);
      } catch (error) {
        print('카카오톡 공유 실패 $error');
      }
    }
  }

  ///*앱 내 딥링크 이동
  Future<void> launchDeepLink({required String appLink}) async {
    //TODO:해당 앱 link 복사
  }
}
