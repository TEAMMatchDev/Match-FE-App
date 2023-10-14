import 'package:get/get.dart';
import 'package:match/model/menu/menu.dart';

class MypageController extends GetxController {
  static MypageController get to => Get.find();

  List<Menu> menuList = [
    Menu(menuIcon: "donation", title: "기부내역 / 해지하기"),
    Menu(menuIcon: "notice", title: "공지사항"),
    Menu(menuIcon: "setting", title: "환경설정"),
    Menu(menuIcon: "policy", title: "운영정책 및 약관"),
    Menu(menuIcon: "client", title: "고객센터"),
  ];
  @override
  void onInit() {
    super.onInit();
  }
}
