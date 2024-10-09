import 'package:get/get.dart';
import 'home_page_controller.dart';

class HomeViewPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeViewPageController());
  }
}
