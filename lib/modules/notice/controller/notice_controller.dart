import 'package:get/get.dart';
import 'package:match/provider/api/notice_api.dart';

import '../../../model/notice/notice.dart';
import '../../../provider/api/util/global_api_field.dart';
import '../../../util/const/style/global_logger.dart';

class NoticeController extends GetxController {
  RxList<Notice> noticeList = <Notice>[].obs;
  RxInt totalNotice = 0.obs;

  Future<void> getMoreNotice(int index) async {
    logger.d(
        "2:  총 페이지수 : ${NoticeApi.notice.totalCnt ~/ PAGINATION_SIZE}, 불러오고자 하는 페이지: ${index}");
    if (!NoticeApi.notice.isLast) {
      noticeList.addAll(await NoticeApi.getNoticeList(getMore: true));
    }
  }

  @override
  void onInit() async {
    super.onInit();
    noticeList.assignAll(await NoticeApi.getNoticeList());
    totalNotice.value = NoticeApi.notice.totalCnt;
  }
}
