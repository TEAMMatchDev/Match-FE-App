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
    logger.e(dynamicLinkData);
    String link = dynamicLinkData.link.path;
    int id = int.parse(dynamicLinkData.link.queryParameters["id"] ?? "-1");

    String donatorName = dynamicLinkData.link.queryParameters["donatorName"] ?? "김매치"; //후원자 이름
    String donateUsage = dynamicLinkData.link.queryParameters["donateUsage"] ?? "test title"; //후원제목
    String sponsorName = dynamicLinkData.link.queryParameters["sponsorName"] ?? "sponsor name"; //후원처명
    int amount = int.parse(dynamicLinkData.link.queryParameters["donateAmount"] ?? "1000"); //후원금액, 후원방식
    String status = dynamicLinkData.link.queryParameters["donateStatus"] ?? "ONE_TIME";

    if (link.contains("project")) {
      Get.toNamed(Routes.project, arguments: {"projectId": id});
    } else if (link.contains("flame")) {
      Get.toNamed(Routes.burning_match, arguments: {"donationId": id});
    } else if (link.contains("donate")) {
      Get.to(PaymentFinishScreen(),
          arguments: {
            "donatorName": donatorName,
            "donateUsage": donateUsage,
            "sponsorName": sponsorName,
            "donateAmount": amount,
            "donateStatus": status,
          });
    }
  }

}
