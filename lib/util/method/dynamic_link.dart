import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:match/modules/project/view/project_view.dart';
import 'package:uni_links/uni_links.dart';

import '../../provider/routes/routes.dart';
import '../const/global_variable.dart';

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
      link: Uri.parse("${dynamicBase}/$screenName?id=$id"),
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
      Logger().d(error);
    });
  }

  static void _redirectScreen(PendingDynamicLinkData dynamicLinkData) {
    if (dynamicLinkData.link.queryParameters.containsKey('id')) {
      if (dynamicLinkData.link.queryParameters.containsKey('id')) {
        String link = dynamicLinkData.link.path.split('/').last;
        String id = dynamicLinkData.link.queryParameters['id']!;

        switch (link) {
          case "project":
            Get.offAllNamed(Routes.project, arguments: {"projectId": id});
            break;
        }
      }
    }
  }
}
