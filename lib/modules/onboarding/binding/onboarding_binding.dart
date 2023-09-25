import 'package:get/get.dart';

import '../controller/onboarding_controller.dart';

class OnboardingBiding implements Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingController());
  }
}
