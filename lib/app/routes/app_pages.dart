import 'package:get/get.dart';

import '../presentation/modules/home_page/home_page_bindin.dart';
import '../presentation/modules/home_page/home_page_view.dart';
import '../presentation/modules/splash_screen/splash_screen_binding.dart';
import '../presentation/modules/splash_screen/splash_screen_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.homeView;

  static final routes = <GetPage>[
    GetPage(
        name: Routes.splash,
        page: () => SplashScreenPageView(),
        binding: SplashScreenPageBinding()),
    GetPage(
        name: Routes.homeView,
        page: () => HomeViewPageView(),
        binding: HomeViewPageBinding()),

  ];
}
