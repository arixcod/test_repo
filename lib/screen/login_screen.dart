import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/login_screen_controller.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/custom_component/custom_button.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import 'package:mandirwiki/util/image_constant.dart';
import '../util/app_colors.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return customScaffold(SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              SizedBox(
                height: 90.h,
              ),
              Center(
                  child: Image.asset(
                ImageConstant.logo,
                height: 100.h,
              )),
              SizedBox(
                height: 40.h,
              ),
              CustomText(
                text: 'My Mobile',
                fontSize: 18.sp,
                fontWeight: FontWeight.w700, // You can specify the font weight
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.0.w,
                ),
                child: CustomText(
                  text:
                      'Please enter your valid phone number. We will send you a 4-digit code to verify your account. ',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kPrimaryColor2,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Obx(() {
                return SizedBox(
                  //   height: 64,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: TextFormField(
                      controller: controller.phoneNumber,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^[6-9]\d*'),
                        ),
                      ],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        if (val == null || val.isEmpty || val.length != 10) {
                          return "Enter a valid 10 digit mobile number";
                        } else {
                          controller.value.value = false;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      focusNode: controller.focusNode.value,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0.w),
                              child: Image.asset(
                                ImageConstant.indianFlag,
                                height: 15.h,
                              ),
                            ),
                            Text(
                              '(+91)',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5.w,
                                right: 10.w,
                              ),
                              child: Container(
                                color: Colors.black,
                                width: 1.w,
                                height: 20.h,
                              ),
                            ),
                          ],
                        ),
                        hintText: '',
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
                );
              }),
              SizedBox(
                height: 60.h,
              ),
              button(
                text: 'Request for OTP',
                onTap: () {
                  debugPrint(
                      "phone number value ===>  ${controller.phoneNumber.value.text.toString()}");

                  if (controller.formKey.currentState!.validate()) {
                    // controller.showLoading();
                    loadingDialogBox(context: context);
                    controller.loginByNumber();
                  } else {
                    showToastMsg("Please Enter valid Number");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
