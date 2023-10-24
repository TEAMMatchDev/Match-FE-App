import 'package:get/get.dart';

import '../../../model/event/event.dart';
import '../../../provider/api/event_api.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/const/style/global_logger.dart';

class EventController extends GetxController {
  RxList<Event> eventList = <Event>[].obs;

  Future<void> getMoreNotice(int index) async {
    logger.d(
        "2:  총 페이지수 : ${EventApi.event.totalCnt ~/ PAGINATION_SIZE}, 불러오고자 하는 페이지: ${index}");
    if (!(EventApi.event.totalCnt ~/ PAGINATION_SIZE < index) &&
        !EventApi.event.isLast) {
      EventApi.event.currentpage = index;
      eventList.addAll(await EventApi.getEventList(getMore: true));
    }
  }
  @override
  void onInit() async{
    super.onInit();
    eventList.assignAll(await EventApi.getEventList());
  }
}
