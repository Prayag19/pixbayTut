import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixbaydemo/app/ui/constant/colors.dart';
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
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is task demo by prayagbhoir19@gmail.com",
              textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: Responsive.heightPer(20),
                child: CircularProgressIndicator(
                  color: AppColor.lightNavyBlue,
                  strokeWidth:10,
                )
              )
            ],
          ),
        );
      },

    );
  }
}
