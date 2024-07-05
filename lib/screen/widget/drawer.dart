import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/home_controller.dart';
import 'package:mandirwiki/screen/widget/custom_image.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/app_colors.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import 'package:mandirwiki/util/image_constant.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';

class AppDrawer extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 324.w,
      backgroundColor: AppColors.darkBlue,
      child: ListView(
        children: [
          DrawerHeader(
            margin: EdgeInsets.only(
              bottom: 20.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.darkBlue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImage(
                      image: "",
                      // Replace with actual image path or URL
                      placeholder: ImageConstant.drawer_profile,
                      fit: BoxFit.fill,
                      height: 52.h,
                      width: 52.h,
                      radius: 2.25.r,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.isLoggedIn.value == ""
                              ? CustomText(
                                  text: 'Guest',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                )
                              : Row(
                                  children: [
                                    CustomText(
                                      text: controller.userFirstName.value,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ).paddingOnly(
                                      right: 4.w,
                                    ),
                                    CustomText(
                                      text: controller.userLastName.value,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                          controller.isLoggedIn.value == ""
                              ? SizedBox()
                              : CustomText(
                                  text: "edit profile",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 65.h,

                )
              ],
            ),
          ).paddingOnly(
            left: 25.w,
            right: 25.w,
          ),
          ListTile(
            leading: CustomImage(
              image: "",
              // Replace with actual image path or URL
              placeholder: ImageConstant.locker,
              fit: BoxFit.fill,
              height: 15.h,
              width: 15.h,
              radius: 2.25.r,
            ),
            title: CustomText(
                text: "Booked Locker",
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                textAlign: TextAlign.start),
            splashColor: Colors.transparent,
            onTap: () {
              Get.back();
              controller.isLoggedIn.value == ""
                  ? showToastMsg("Please Login First")
                  : Get.toNamed(
                      RouteName.my_booking,
                    );
            },
          ).paddingOnly(
            left: 25.w,
            right: 25.w,
          ),
          Container(
            height: 1.h,
            color: Colors.white.withOpacity(0.20),
          ).paddingOnly(
            left: 40.w,
            right: 40.w,
          ),
          ListTile(
            leading: CustomImage(
              image: "",
              // Replace with actual image path or URL
              placeholder: ImageConstant.about,
              fit: BoxFit.fill,
              height: 15.h,
              width: 15.h,
              radius: 2.25.r,
            ),
            title: CustomText(
                text: "About Us",
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                textAlign: TextAlign.start),
            splashColor: Colors.transparent,
            onTap: () {
              Get.back();
            },
          ).paddingOnly(
            left: 25.w,
            right: 25.w,
          ),
          Container(
            height: 1.h,
            color: Colors.white.withOpacity(0.20),
          ).paddingOnly(
            left: 40.w,
            right: 40.w,
          ),
          ListTile(
            leading: CustomImage(
              image: "",
              // Replace with actual image path or URL
              placeholder: ImageConstant.setting,
              fit: BoxFit.fill,
              height: 15.h,
              width: 15.h,
              radius: 2.25.r,
            ),
            title: CustomText(
                text: "Setting",
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                textAlign: TextAlign.start),
            splashColor: Colors.transparent,
            onTap: () {
              Get.back();
            },
          ).paddingOnly(
            left: 25.w,
            right: 25.w,
          ),
          Container(
            height: 1.h,
            color: Colors.white.withOpacity(0.20),
          ).paddingOnly(
            left: 40.w,
            right: 40.w,
          ),
          ListTile(
            leading: CustomImage(
              image: "",
              // Replace with actual image path or URL
              placeholder: ImageConstant.privacyPolicy,
              fit: BoxFit.fill,
              height: 15.h,
              width: 15.h,
              radius: 2.25.r,
            ),
            title: CustomText(
                text: "Privacy Policy",
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                textAlign: TextAlign.start),
            splashColor: Colors.transparent,
            onTap: () {
              Get.back();
            },
          ).paddingOnly(
            left: 25.w,
            right: 25.w,
          ),
          Container(
            height: 1.h,
            color: Colors.white.withOpacity(0.20),
          ).paddingOnly(
            left: 40.w,
            right: 40.w,
          ),
          ListTile(
            leading: CustomImage(
              image: "",
              // Replace with actual image path or URL
              placeholder: ImageConstant.support,
              fit: BoxFit.fill,
              height: 15.h,
              width: 15.h,
              radius: 2.25.r,
            ),
            title: CustomText(
                text: "Help and Support",
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                textAlign: TextAlign.start),
            splashColor: Colors.transparent,
            onTap: () {
              Get.back();
            },
          ).paddingOnly(
            left: 25.w,
            right: 25.w,
          ),
          Container(
            height: 37.h,
            margin: EdgeInsets.only(
              left: 30.w,
              right: 30.w,
              top: 50.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                5.r,
              ),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Log Out",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ).paddingOnly(
                  right: 10.w,
                ),
                CustomImage(
                  image: "",
                  // Replace with actual image path or URL
                  placeholder: ImageConstant.logOut,
                  fit: BoxFit.fill,
                  height: 18.h,
                  width: 18.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
