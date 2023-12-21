import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:match/modules/payment/view/payment_done_by_web_view.dart';
import 'package:uni_links/uni_links.dart';

import '../../provider/routes/routes.dart';
import '../const/global_variable.dart';
import '../const/style/global_logger.dart';

class DynamicLink {
  static Future<bool> setUp() async {
    bool isExistDynamicLink = await _getInitialDynamicLink();
    await _addListener();

    return isExistDynamicLink;
  }

  static Future<bool> _getInitialDynamicLink() async {
    final String? deepLink = await getInitialLink();

    if (deepLink != null) {
      PendingDynamicLinkData? dynamicLinkData = await FirebaseDynamicLinks
          .instance
          .getDynamicLink(Uri.parse(deepLink));

      if (dynamicLinkData != null) {
        _redirectScreen(dynamicLinkData);
        return true;
      }
    }

    return false;
  }

  static Future<String> getShortLink({
    required String screenName,
    required int id,
  }) async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("$dynamicBase/$screenName?id=$id"),
      uriPrefix: dynamicBase,
      androidParameters: const AndroidParameters(packageName: "com.dev.match"),
      iosParameters: const IOSParameters(bundleId: "com.dev.match"),
    );
    final dynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(
      dynamicLinkParams,
      shortLinkType: ShortDynamicLinkType.unguessable,
    );
    return dynamicLink.shortUrl.toString();
  }

  static Future<void> _addListener() async {
    FirebaseDynamicLinks.instance.onLink.listen((
      PendingDynamicLinkData dynamicLinkData,
    ) {
      _redirectScreen(dynamicLinkData);
    }).onError((error) {
      logger.e(error);
    });
  }

  static void _redirectScreen(PendingDynamicLinkData dynamicLinkData) {
    print('dynamiclink 확인');
    logger.e(dynamicLinkData);
    String link = dynamicLinkData.link.path;
    print('>>> 딥링크 url: ${link}');
    int id = int.parse(dynamicLinkData.link.queryParameters["id"] ?? "-1");
    print('>>> 딥링크 id: ${id}');

    String donatorName = Uri.decodeComponent(dynamicLinkData.link.queryParameters["donatorName"] ?? "김매치");
    String donateTitle = Uri.decodeComponent(dynamicLinkData.link.queryParameters["donateTitle"] ?? "후원제목"); //후원제목
    String donateUsages = Uri.decodeComponent(dynamicLinkData.link.queryParameters["donateUsages"] ?? "후원처명"); //후원제목
    String amountString = dynamicLinkData.link.queryParameters["donateAmount"] ?? "후원금액"; //후원금액 str
    int amount = int.parse(amountString); //후원금액 int
    String status = dynamicLinkData.link.queryParameters["donateStatus"] ?? "ONE_TIME or REGULAR"; //후원방식

    if (link.contains("project")) {
      Get.toNamed(Routes.project, arguments: {"projectId": id});
    } else if (link.contains("flame")) {
      Get.toNamed(Routes.burning_match, arguments: {"donationId": id});
    } else if (link.contains("donate")) {
      logger.d('>> 웹에서 생성된 딥링크)\n 기부자 이름: ${donatorName}\n 후원제목: ${donateTitle}\n 후원처명: ${donateUsages}\n 후원금액: ${amountString}\n 후원방식: ${status}');
      Get.to(PaymentFinishScreen(),
          arguments: {
            "donatorName": donatorName,
            "donateTitle": donateTitle,
            "donateUsages": donateUsages,
            "donateAmount": amountString,
            "donateStatus": status,
          });
    }
  }

}
