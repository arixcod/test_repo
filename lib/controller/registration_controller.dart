import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mandirwiki/model/otp_model.dart';
import 'package:mandirwiki/model/registration_model.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/api_client.dart';
import 'package:mandirwiki/util/api_constant.dart';
import 'package:mandirwiki/util/local_database.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';

class RegistrationController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  var token = "".obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  var deviceId = "".obs;
  var mobileNumber = "".obs;
  @override
  void onInit() async {
    mobileNumber.value = Get.arguments[0];
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId.value = androidInfo.id;
    }
    super.onInit();
  }

  String? validateEmail(String? value) {
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  Future<void> user_registration() async {
    var body = {
      'first_name': firstNameController.value.text.toString(),
      'last_name': lastNameController.value.text.toString(),
      'email': emailController.value.text.toString(),
      'mobile_number': mobileNumber.value,
      'address': addressController.value.text.toString(),
      'deviceId': deviceId.value,
      'deviceType': Platform.isAndroid
          ? "Android"
          : Platform.isIOS
              ? "IOS"
              : "",
      'deviceToken': 'sahfjskfjhfjdf',
      'country': 'India',
      'country_code': '91',
    };

    final response = await ApiClient()
        .postMethod(uri: ApiConstants.registration, body: body);
    if (response != null) {
      print(response);
      var registrationResponse = RegistrationModel.fromJson(response);
      if (registrationResponse.status == true) {
        showToastMsg(registrationResponse.message ?? "");
        token.value = registrationResponse.token ?? "";
        debugPrint("jwt token value is  ===> ${token.value}");
        StorageUtil.write(ApiConstants.token, token.value);
        var tokenValue = await StorageUtil.read(
          ApiConstants.token,
        );
        debugPrint("token value is ===> $tokenValue");

        Get.offAndToNamed(RouteName.bottom_navigation, arguments: [
          token.value,
        ]);
      } else if (registrationResponse.status == false) {
        showToastMsg(registrationResponse.message ?? "");
      }
    }
  }
}
