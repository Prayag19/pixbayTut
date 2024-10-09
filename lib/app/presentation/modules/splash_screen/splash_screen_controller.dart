import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashScreenPageController extends GetxController {
  @override
  void onInit() {
    gotoPreLoginPage();
    super.onInit();
  }

  Future<void> gotoPreLoginPage() async {
    await Future.delayed(Duration(milliseconds: 800));
    Get.offAllNamed(Routes.homeView);
  }
}
