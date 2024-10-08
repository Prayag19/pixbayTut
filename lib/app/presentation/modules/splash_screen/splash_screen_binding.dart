import 'package:get/get.dart';

import 'splash_screen_controller.dart';

class SplashScreenPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenPageController());
  }
}
