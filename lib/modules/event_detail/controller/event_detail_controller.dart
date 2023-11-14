import 'package:get/get.dart';
import 'package:match/provider/api/event_api.dart';
import 'package:match/util/const/global_mock_data.dart';

import '../../../model/event_detail/event_detail.dart';

class EventDetailController extends GetxController {
  int eventId = Get.arguments['eventId'] ?? 0;
  Rx<EventDetail> eventDetail = tmpEventDetail.obs;
  @override
  void onInit() async {
    super.onInit();
    eventDetail.value =
        await EventApi.getEventDetail(eventId: eventId) ?? tmpEventDetail;
  }
}
