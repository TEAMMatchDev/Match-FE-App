import 'package:get/get.dart';
import 'package:match/provider/api/notification_api.dart';

import '../../../model/notification_permission/notification_permission.dart';
import '../../../util/const/global_mock_data.dart';

class SettingController extends GetxController {
  Rx<NotificationPermission> permission = tmpNotificationPermission.obs;
  Rx<bool> servicePermission = false.obs;
  Rx<bool> eventPermission = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    permission.value = await NotificationApi.getAlarmPermission();
    servicePermission.value = permission.value.serviceAlarm;
    eventPermission.value = permission.value.eventAlarm;
  }
}
