import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


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
              Container(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator()
              )),
              SizedBox(
                height: 10,
              ),
              Text(msg ?? "Loading"),
              SizedBox(
                height: 10,
              ),
              percent!=null? Obx(() {
                return Text(percent.value);
              }):SizedBox()
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
