import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../flavor/flavor_config.dart';
import '/app/routes/app_pages.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlavorConfig _envConfig = FlavorConfig.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _envConfig.name,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            )),
      ),
      initialRoute: AppPages.INITIAL,
      onReady: () async {},
      getPages: AppPages.routes,
      supportedLocales: _getSupportedLocal(),
      debugShowCheckedModeBanner: false,
    );
  }

  List<Locale> _getSupportedLocal() {
    return [
      const Locale('en', ''),
    ];
  }
}
