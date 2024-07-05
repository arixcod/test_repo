import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mandirwiki/controller/otp_controller.dart';
import 'package:mandirwiki/controller/login_screen_controller.dart';
import 'package:mandirwiki/screen/login_screen.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/custom_component/custom_button.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import 'package:mandirwiki/util/image_constant.dart';
import '../util/custom_component/custom_text_style.dart';
import '../util/theme_helper.dart';

class OtpScreen extends GetView<OTPController> {
  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginScreenController());
    return customScaffold(
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 90.h,
              ),
              Center(
                  child: Image.asset(
                ImageConstant.logo,
                height: 100,
              )),
              SizedBox(
                height: 40.h,
              ),
              CustomText(
                text: 'OTP Verification',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold, // You can specify the font weight
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomText(
                  text:
                      'Enter OTP sent to ${convertToMaskedNumber(controller.mobileNumber.value)}',
                  fontSize: 13.sp,
                  fontWeight:
                      FontWeight.normal, // You can specify the font weight
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                //   height: 64,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextFormField(
                    controller: controller.otpController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val == null || val.isEmpty || val.length != 4) {
                        return "Enter a valid 4 digit OTP ";
                      } else {
                        controller.value.value = true;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 4,
                    focusNode: controller.focusNode.value,
                    decoration: InputDecoration(
                      label: Text(
                        'Otp Code',
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      counterText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
              ),
              Obx(() {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.h, vertical: 3.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.timeCountdown.value != 0
                          ? Text(
                              "Expires in ${controller.timeCountdown.value.toString()} second"
                                  .tr,
                              style: CustomTextStyles.bodySmallBluegray400,
                            )
                          : SizedBox(),
                      controller.timeCountdown.value != 0
                          ? SizedBox()
                          : InkWell(
                              onTap: () {
                                controller.startTimer(59);
                                loadingDialogBox(context: context);
                                controller.loginController
                                    .loginByNumber(resend: true);
                              },
                              child: Text(
                                "Resend OTP".tr,
                                style: theme.textTheme.labelMedium,
                              ),
                            )
                    ],
                  ),
                );
              }),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      ImageConstant.infoIcon,
                      height: 15.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(
                              text:
                                  'By continuing to Verify, I agree to Mandir Wiki',
                              fontSize: 12,
                            )),
                        Row(
                          children: [
                            CustomText(
                                text: 'Terms & Conditions ',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                underline: true),
                            CustomText(
                              text: 'and the  ',
                              fontSize: 12,
                            ),
                            CustomText(
                                text: 'Privacy Policy',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                underline: true),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              button(
                text: 'Verify',
                onTap: () {
                  debugPrint(
                      "otp value ===>  ${controller.otpController.value.text.toString()}");
                  if (controller.value.value == true &&
                      controller.otpController.value.text.toString() != "" &&
                      controller.otpController.value.text.toString().length ==
                          4) {
                    controller.verifyNumber(
                        controller.otpController.value.text.toString());
                  } else {
                    showToastMsg("Please Enter valid OTP");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildRowDuration() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: Text(
            "Expires in 04:50 Minutes".tr,
            style: CustomTextStyles.bodySmallBluegray400,
          ),
        ),
        Text(
          "Resend OTP".tr,
          style: theme.textTheme.labelMedium,
        )
      ],
    ),
  );
}

// insert dot between numbers

String insertDotsToNumber(String number) {
  String numberString = number.toString();
  String formattedNumber = '';
  for (int i = 0; i < numberString.length; i++) {
    formattedNumber += numberString[i];
    if ((i + 1) % 3 == 0 && (i + 1) != numberString.length) {
      formattedNumber += '.';
    }
  }
  return formattedNumber;
}

// insert dot between numbers
String convertToDottedNumber(String number) {
  // Convert number to string
  String numberString = number.toString();

  // Calculate the number of dots needed
  int dotsCount = (numberString.length - 1) ~/ 3;

  // Initialize a string buffer to build the result
  StringBuffer result = StringBuffer();

  // Iterate over each character in the number string
  for (int i = 0; i < numberString.length; i++) {
    // Add the current character to the result string
    result.write(numberString[i]);

    // Check if a dot should be added after the current character
    if ((i + 1) % 3 == 0 && dotsCount > 0) {
      result.write('.');
      dotsCount--;
    }
  }

  // Return the result string
  return result.toString();
}

// mask number with star
String convertToMaskedNumber(String number) {
  // Convert number to string
  String numberString = number.toString();

  // Check if the length of the number is greater than 8
  if (numberString.length > 8) {
    // Get the length of the first part to be displayed
    int visibleLength = numberString.length - 6;

    // Replace characters with asterisks
    String maskedNumber = numberString.substring(0, visibleLength) +
        '****' +
        numberString.substring(visibleLength + 4);

    return maskedNumber;
  } else {
    // If the number has 8 or fewer digits, return it as is
    return numberString;
  }
}
