import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/my_locker_controller.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/app_colors.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';

class MyLocker extends GetView<MyLockerController> {
  @override
  Widget build(BuildContext context) {
    return customScaffold(SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              backButton(),
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: 'My Locker',
                fontSize: 20.sp,
                fontWeight:
                FontWeight.bold, // You can specify the font weight
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: controller.importantInfoList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(
                      8.r,
                    ),
                    child: whiteContainer(
                      Container(
                        margin: EdgeInsets.all(
                          8.r,
                        ),
                        child: Column(
                          children: [

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Booking ID ",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp,
                                      color: AppColors.kPrimaryColor,
                                    ),
                                    CustomText(
                                      text: controller
                                          .importantInfoList[index].bookingID,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp,
                                      color: AppColors.kPrimaryColor,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Locker No.",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue,
                                    ),
                                    CustomText(
                                      text: controller
                                          .importantInfoList[index]
                                          .lockerNumber,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Date",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue,
                                    ),
                                    CustomText(
                                      text:
                                      ":${controller.importantInfoList[index].date}",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: "Slot : ",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue,
                                    ),
                                    CustomText(
                                      text:
                                      "${controller.importantInfoList[index].slot}",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Check In",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue,
                                    ),
                                    CustomText(
                                      text:
                                      ":${controller.importantInfoList[index].checkIn}",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: "Charges : ",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue,
                                    ),
                                    CustomText(
                                      text:
                                      "${controller.importantInfoList[index].charges}",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Check Out",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue,
                                    ),
                                    CustomText(
                                      text:
                                      ":${controller.importantInfoList[index].checkOut}",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: "Status : ",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue,
                                    ),
                                    CustomText(
                                      text:
                                      "${controller.importantInfoList[index].status}",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp,
                                      color: AppColors.greenColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    ),);
  }
}
