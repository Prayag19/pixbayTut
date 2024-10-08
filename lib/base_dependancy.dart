import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'app/data/provider/apis/api_provider.dart';



Future<void> initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => ApiCaller().init());

}
