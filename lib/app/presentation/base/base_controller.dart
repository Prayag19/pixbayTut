import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui/constant/strings.dart';


class BaseAppController extends GetxController {
  RxBool isLoading = false.obs;

  void openLoader({String? msg, RxString? percent, bool canPop =false}) {
    Get.dialog(PopScope(
      canPop: canPop,
      child: Dialog(
        elevation: 10,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator()
                            ),
              const SizedBox(
                height: 10,
              ),
              Text(msg ?? Strings.instance.textLoading),
              const SizedBox(
                height: 10,
              ),
              percent!=null? Obx(() {
                return Text(percent.value);
              }):const SizedBox()
            ],
          ),
        ),
      ),
    ));
  }

  void closeLoader() {
    Get.close(1);
  }
}
