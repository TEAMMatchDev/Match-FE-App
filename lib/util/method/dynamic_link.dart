import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
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
    if (link.contains("project")) {
      Get.toNamed(Routes.project, arguments: {"projectId": id});
    }else if(link.contains("flame")){
      Get.toNamed(Routes.burning_match, arguments: {"donationId": id});
    }
  }
}
