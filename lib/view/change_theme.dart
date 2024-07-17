import 'package:counter_app_with_getx/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({super.key});

  @override
  Widget build(BuildContext context) {

    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Theme Change'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            themeController.toggleTheme();
          },
          child: Text('Toggle Theme'),
        ),
      ),
    );
  }
}
