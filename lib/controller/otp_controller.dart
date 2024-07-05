import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mandirwiki/controller/home_controller.dart';
import 'package:mandirwiki/controller/login_screen_controller.dart';
import 'package:mandirwiki/model/login_model.dart';
import 'package:mandirwiki/model/otp_model.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/api_client.dart';
import 'package:mandirwiki/util/api_constant.dart';
import 'package:mandirwiki/util/local_database.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';

class OTPController extends GetxController {
  TextEditingController otpController = TextEditingController(text: "");
  RxBool value = true.obs;
  Rx<FocusNode> focusNode = FocusNode().obs;
  var token = "".obs;
  var mobileNumber = "".obs;
  RxInt timeCountdown = 0.obs;
  Timer? _timer;
  RxInt get timeRemaining => timeCountdown;
  var loginController = Get.find<LoginScreenController>();
  @override
  void onInit() async {
    mobileNumber.value = Get.arguments[0];
    startTimer(59);
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void startTimer(int durationInSeconds) {
    timeCountdown.value = durationInSeconds;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeCountdown.value > 0) {
        timeCountdown.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  Future<void> verifyNumber(pin) async {
    var body = {
      "mobile_number": mobileNumber.value,
      "code": pin.toString(),
    };

    final response =
        await ApiClient().postMethod(uri: ApiConstants.verifyOTP, body: body);
    if (response != null) {
      print(response);
      var otpResponse = OTPModel.fromJson(response);
      if (otpResponse.isRegistered == 1) {
        showToastMsg(otpResponse.message ?? "");
        token.value = otpResponse.token ?? "";
        debugPrint("jwt token value is  ===> ${token.value}");
        StorageUtil.write(ApiConstants.token, token.value);
        var tokenValue = await StorageUtil.read(
          ApiConstants.token,
        );
        debugPrint("token value is ===> $tokenValue");

        Get.offAllNamed(RouteName.bottom_navigation, arguments: [
          token.value,
        ]);
      } else {
        showToastMsg(otpResponse.message ?? "");
        Get.offAllNamed(RouteName.registration_screen, arguments: [
          mobileNumber.value,
        ]);
      }
    }
  }

}
