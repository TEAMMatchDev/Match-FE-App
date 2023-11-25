import 'package:get/get.dart';

import '../../../model/event/event.dart';
import '../../../provider/api/event_api.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/const/style/global_logger.dart';

class EventController extends GetxController {
  ///* event list
  RxList<Event> eventList = <Event>[].obs;

  ///* pagination 함수
  Future<void> getMoreNotice(int index) async {
    if (!EventApi.event.isLast) {
      eventList.addAll(await EventApi.getEventList(getMore: true));
    }
  }

  @override
  void onInit() async {
    super.onInit();
    eventList.assignAll(await EventApi.getEventList());
  }
}
