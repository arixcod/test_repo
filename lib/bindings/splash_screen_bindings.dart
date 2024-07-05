import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => SplashScreenController(),);
  }

}