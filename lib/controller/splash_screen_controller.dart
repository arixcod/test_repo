import 'dart:async';

import 'package:get/get.dart';
import 'package:mandirwiki/screen/login_screen.dart';
import 'package:mandirwiki/util/api_constant.dart';
import 'package:mandirwiki/util/image_constant.dart';
import 'package:mandirwiki/util/local_database.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';

class SplashScreenController extends GetxController {
  RxString imageConst = ImageConstant.splash.obs;
  RxString logo = ImageConstant.logo1.obs;
  var waitingTime = 1.obs;
  @override
  void onInit() async {
    super.onInit();
    await nextPage();
  }

  nextPage() {
    Future.delayed(Duration(seconds: waitingTime.value), () async {
      var isLogged = await StorageUtil.read(
        ApiConstants.token,
      );
      print("isLogged value in splash ===> ${isLogged}");
      if (isLogged == null) {
        Get.offAllNamed(
          RouteName.bottom_navigation,
          arguments: [""],
        );
      } else {
        Get.offAllNamed(RouteName.bottom_navigation, arguments: [isLogged]);
      }
    });
  }

}
