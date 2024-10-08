import 'package:flutter/material.dart';
import '/app/my_app.dart';
import 'base_dependancy.dart';
import 'flavor/environment.dart';
import 'flavor/flavor_config.dart';

Future<void> main() async {
  FlavorConfig(flavor: Flavor.DEV);
  await initServices();
  runApp(const MyApp());
}
