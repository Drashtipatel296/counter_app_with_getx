import 'package:counter_app_with_getx/view/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/theme_controller.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const CounterScreen(),
        theme: themeController.isDark.value ? ThemeData.dark() : ThemeData.light(),
      );
    });
  }
}
