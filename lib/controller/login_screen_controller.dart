import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/model/login_model.dart';
import 'package:mandirwiki/model/otp_model.dart';
import 'package:mandirwiki/screen/otp_screen.dart';
import 'package:mandirwiki/screen/user_detais.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/api_client.dart';
import 'package:mandirwiki/util/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:mandirwiki/util/routes/routes_name.dart';

import '../util/app_colors.dart';

class LoginScreenController extends GetxController {
  RxBool isLoading = false.obs;
  GlobalKey<FormState> formKey = GlobalKey();

  Rx<FocusNode> focusNode = FocusNode().obs;
  RxBool value = true.obs;

  TextEditingController phoneNumber = TextEditingController(text: "");
  void showLoading() {
    loadingDialogBox(context: Get.context!);
  }

  Future<void> loginByNumber({bool resend = false}) async {
    var body = {
      "mobile_number": phoneNumber.text,
    };
    final response =
        await ApiClient().postMethod(uri: ApiConstants.login, body: body);
    if (response != null) {
      Get.back();

      var loginResponse = LoginModel.fromJson(response);
      showToastMsg(loginResponse.message ?? "");
      if (resend == false) {
        Get.toNamed(RouteName.otp_screen, arguments: [
          phoneNumber.value.text.toString(),
        ]);
      }
    } else {
      Get.back();
    }
  }

  //
  // Future<void> loginByNumber() async {
  //   isLoading.value = true;
  //   try {
  //     var headers = {
  //       'Content-Type': 'application/x-www-form-urlencoded',
  //     };
  //     var request = http.Request('POST', Uri.parse(ApiConstants.login));
  //     request.bodyFields = {
  //       'mobile_number': phoneNumber.value.text.toString()
  //     };
  //
  //     request.headers.addAll(headers);
  //
  //     http.StreamedResponse response = await request.send();
  //
  //     if (response.statusCode == 200) {
  //       // isLoading.value = false;
  //       var loginResponse = LoginModel.fromJson(
  //           jsonDecode(await response.stream.bytesToString()));
  //       debugPrint("loginResponse from model is ===> ${loginResponse}");
  //       if (loginResponse.message == "OTP send Successfully") {
  //         showToastMsg(loginResponse.message ?? "");
  //         Get.offAndToNamed(RouteName.otp_screen, arguments: [
  //           phoneNumber.value.text.toString(),
  //         ]);
  //       }
  //     } else {
  //       showToastMsg("Server connection Failed");
  //
  //       print(response.reasonPhrase);
  //     }
  //   } catch (e) {
  //     showToastMsg("Something went wrong");
  //     debugPrint("error while login ${e.toString()}");
  //   }
  // }
}
