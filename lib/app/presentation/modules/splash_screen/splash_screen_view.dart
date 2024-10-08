import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../ui/constant/screen.size.dart';
import '../../base/base_view.dart';

class SplashScreenPageView extends GetView {
  const SplashScreenPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onViewCreated: (context, orientation, constrains){
        return Container(
          width: Responsive.widthPer(100),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Responsive.heightPer(20),
                child: CircularProgressIndicator(
                  strokeWidth:  Responsive.heightPer(10),
                )
              )
            ],
          ),
        );
      },

    );
  }
}
