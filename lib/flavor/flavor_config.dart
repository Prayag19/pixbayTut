import 'package:flutter/material.dart';

import 'environment.dart';

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final String baseUrl;
  static FlavorConfig? _instance;

  factory FlavorConfig({required Flavor flavor}) {
    _instance ??= FlavorConfig._internal(
        flavor, getValue(flavor), getColor(flavor), getBaseUrl(flavor));
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.baseUrl);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance?.flavor == Flavor.LIVE;

  static bool isDevelopment() => _instance?.flavor == Flavor.DEV;

  static String getValue(Flavor flavor) {
    switch (flavor) {
      case Flavor.DEV:
        return "Dev";
      case Flavor.LIVE:
        return "Live";
      default:
        return "";
    }
  }

  static String getBaseUrl(Flavor flavor) {
    switch (flavor) {
      case Flavor.DEV:
        return "https://pixabay.com/api/";
      case Flavor.LIVE:
        return "https://pixabay.com/api/";
      default:
        return "";
    }
  }

  static Color getColor(Flavor flavor) {
    switch (flavor) {
      case Flavor.DEV:
        return Colors.blue;
      default:
        return Colors.green;
    }
  }

  getKey() {
    switch (flavor) {
      case Flavor.DEV:
        return "46410878-ac4a7051f09605450c0ffdd4a";
      case Flavor.LIVE:
        return "46410878-ac4a7051f09605450c0ffdd4a";
      default:
        return "";
    }
  }
}
