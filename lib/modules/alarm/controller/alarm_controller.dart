import 'package:get/get.dart';
import 'package:match/provider/api/notification_api.dart';

import '../../../model/notification/notification.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/const/style/global_logger.dart';

class AlarmController extends GetxController {
  static AlarmController get to => Get.find();
  RxList<Notification> notifcationList = <Notification>[].obs;

  Future<void> getMoreNotification(int index) async {
    logger.d(
        "2:  총 페이지수 : ${NotificationApi.notification.totalCnt ~/ PAGINATION_SIZE}, 불러오고자 하는 페이지: ${index}");
    if (!NotificationApi.notification.isLast) {
      notifcationList
          .addAll(await NotificationApi.getNotificationList(getMore: true));
    }
  }

  @override
  void onInit() async {
    super.onInit();
    notifcationList.assignAll(await NotificationApi.getNotificationList());
  }
}
