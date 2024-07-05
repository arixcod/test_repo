
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: Obx(() {
        return Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              controller.imageConst.value,
              height: Get.height,
              width: Get.width,
              fit: BoxFit.cover,
            ), Image.asset(
              controller.logo.value,
              height: 400.65.h,
              width: 500.04.w,
              fit: BoxFit.cover,
            ),

          ],
        );
      }),
    );
  }
}
