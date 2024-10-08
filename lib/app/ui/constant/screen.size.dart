import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Responsive {
  static const designSize = Size(430, 929);

  static double width(double width) {
    double factor = Get.size.width / designSize.width;
    return (width * factor).roundToDouble();
  }

  static double height(double height) {
    double factor = Get.size.height / designSize.height;
    return (height * factor).roundToDouble();
  }

  static double heightPer(double per) {
    double factor = Get.size.height * per / 100;
    return factor.roundToDouble();
  }

  static double widthPer(double per) {
    double factor = Get.size.width * per / 100;
    return factor.roundToDouble();
  }

  static double squareMin(double w, double h) {
    double factor = min(Responsive.height(h), Responsive.width(w));
    return factor.roundToDouble();
  }

  static Widget getResponsiveSpace({double? w, double? h}) {
    return SizedBox(
      height: height(h ?? 0),
      width: width(w ?? 0),
    );
  }
}

double iconSize(size) {
  return Responsive.height(size);
}
