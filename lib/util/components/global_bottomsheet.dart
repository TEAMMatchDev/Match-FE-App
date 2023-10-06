import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:logger/logger.dart';
import 'package:match/util/components/global_modal.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import 'package:match/util/method/dynamic_link.dart';
import 'package:match/util/method/permission_handler.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../const/style/global_color.dart';

class ShareBottomSheet extends StatelessWidget {
  final String imgUrl;
  final String usages;
  final String title;
  final int id;
  const ShareBottomSheet(
      {super.key,
      required this.imgUrl,
      required this.usages,
      required this.title,
      required this.id});

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
            buttonTile(
                icon: "save_18",
                text: "매치 사진 저장하기",
                type: "PHOTO",
                context: context),
            buttonTile(icon: "copy_18", text: "링크 복사하기", type: "LINK"),
            buttonTile(icon: "share_18", text: "카카오톡 공유하기", type: "KAKAO"),
          ],
        ),
      ),
    );
  }

  /// bottomSheet button tile
  Widget buttonTile(
      {required String icon,
      required String text,
      required String type,
      BuildContext? context}) {
    return GestureDetector(
      onTap: () async {
        var appLink =
            await DynamicLink.getShortLink(screenName: "project", id: id);
        Logger().d(appLink);
        switch (type) {
          case "KAKAO":
            await kakoShare(
                imgUrl: imgUrl, usages: usages, title: title, appLink: appLink);
            break;
          case "LINK":
            await launchDeepLink(appLink: appLink);
            break;
          case "PHOTO":
            var result = await savePhoto(
                imgUrl: imgUrl, title: title, context: context ?? Get.context!);
            if (!result) {
              Fluttertoast.showToast(msg: "사진이 저장이 되지 않았습니다. 다시 시도해주세요");
            }
            break;
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

  ///*사진 저장하기
  Future<bool> savePhoto(
      {required String imgUrl,
      required String title,
      required BuildContext context}) async {
    try {
      if (await PermissionHandler.checkGalleryPermission()) {
        var response = await Dio()
            .get(imgUrl, options: Options(responseType: ResponseType.bytes));
        final result = await ImageGallerySaver.saveImage(
            Uint8List.fromList(response.data),
            quality: 60,
            name: title,
            isReturnImagePathOfIOS: true);
        // ${result["filePath"] + " 에" ?? " "} 사진이 저장되었어요!로 메세지 변경고려
        Fluttertoast.showToast(msg: " 사진이 저장되었어요!");

        return true;
      } else {
        await PermissionHandler.requestGallery(context);
      }
    } catch (e) {
      Logger().d(e);
    }
    return false;
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
          // iosExecutionParams: ,
        ),
      ),
      buttons: [
        Button(
          title: "매치 보러가기",
          link: Link(
            mobileWebUrl: Uri.parse(appLink),
          ),
        ),
      ],
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
        Logger().d('카카오톡 공유 실패 $error');
      }
    }
  }

  ///*앱 내 딥링크 링크 복사
  Future<void> launchDeepLink({required String appLink}) async {
    // copy to clipboard
    await Clipboard.setData(ClipboardData(text: appLink));
    Fluttertoast.showToast(msg: "링크가 복사되었어요! 공유해 주세요.");
  }
}
