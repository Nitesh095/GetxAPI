import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_part2/res/getx_localization/languages.dart';
import 'package:getx_part2/res/routes/routes.dart';
import 'package:getx_part2/view_model/bindings/bindings.dart';
import 'package:getx_part2/view_model/splash_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();

    splashServices.login();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      translations: Languages(),
      locale: const Locale("en", "US"),
      fallbackLocale: const Locale("en", "US"),
      initialBinding: HomeBindings(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
