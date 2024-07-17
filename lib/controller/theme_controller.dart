import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController{
  var isDark = false.obs;

  void toggleTheme(){
    isDark.value = !isDark.value;
    Get.changeTheme(isDark.value ? ThemeData.dark() : ThemeData.light());
  }
}