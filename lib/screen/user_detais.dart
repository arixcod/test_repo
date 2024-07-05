import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/login_screen_controller.dart';
import 'package:mandirwiki/controller/registration_controller.dart';
import 'package:mandirwiki/screen/login_screen.dart';
import 'package:mandirwiki/screen/rent_locker.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/custom_component/custom_button.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import 'package:mandirwiki/util/custom_component/custom_textField.dart';
import 'package:mandirwiki/util/image_constant.dart';
import 'bottom_navigation.dart';
import 'otp_screen.dart';

class UserDetails extends GetView<RegistrationController> {
  UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return customScaffold(
      SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
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
                  text: 'New User, Profile Details',
                  fontSize: 18.sp,
                  fontWeight:
                      FontWeight.w700, // You can specify the font weight
                ),
                SizedBox(
                  height: 16.h,
                ),
                textField(
                  label: 'First Name',
                  controller: controller.firstNameController,
                  inputType: TextInputType.text,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                textField(
                  label: 'Last Name',
                  controller: controller.lastNameController,
                  inputType: TextInputType.text,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                textField(
                  label: 'E mail',
                  controller: controller.emailController,
                  inputType: TextInputType.emailAddress,
                  validate: controller.validateEmail,
                ),
                textField(
                  label: 'Address',
                  controller: controller.addressController,
                  inputType: TextInputType.text,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                button(
                    text: 'Submit',
                    onTap: () async {
                      if (controller.formKey.currentState!.validate()) {
                        loadingDialogBox(context: context);
                        await controller.user_registration();
                      } else {
                        showToastMsg("Fill all the details");
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
