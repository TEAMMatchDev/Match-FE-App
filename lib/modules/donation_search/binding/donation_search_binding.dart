import 'package:get/get.dart';

import '../controller/donation_search_controller.dart';

class DonationSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DonationSearchController());
  }
}
