import 'package:get/get.dart';
import 'package:match/util/const/global_mock_data.dart';

import '../../../model/notice_detail/notice_detail.dart';
import '../../../provider/api/notice_api.dart';

class NoticeDetailController extends GetxController {
  int id = Get.arguments["id"] ?? 0;
  Rx<NoticeDetail> noticeDetail = tmpNoticeDetail.obs;

  @override
  void onInit() async {
    super.onInit();
    noticeDetail.value = await NoticeApi.getNoticeDetail(noticeId: id) ?? tmpNoticeDetail;
  }
}
