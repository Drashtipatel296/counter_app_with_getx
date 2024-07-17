import 'package:counter_app_with_getx/view/change_theme.dart';
import 'package:counter_app_with_getx/view/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

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
        home: const ChangeTheme(),
        theme: themeController.isDark.value ? ThemeData.dark() : ThemeData.light(),
        getPages: [
          GetPage(name: '/first', page: () => const NavigationScreen(),),
          GetPage(name: '/second', page: () => const SecondScreen(),transition: Transition.zoom),
        ],
      );
    });
  }
}
