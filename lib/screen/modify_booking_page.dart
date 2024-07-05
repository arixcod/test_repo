import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mandirwiki/controller/rent_locker_controller.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/app_colors.dart';
import 'package:mandirwiki/util/custom_component/custom_button.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';

class ModifyBookingScreen extends GetView<RentLockerController> {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
      SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                backButton(),
                SizedBox(
                  width: 15.w,
                ),
                CustomText(
                  text: 'Rent a Locker',
                  fontSize: 20.sp,
                  fontWeight:
                      FontWeight.w700, // You can specify the font weight
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: whiteContainer(
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Obx(() {
                        return InkWell(
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 5.h,
                              ),
                              height: 45.h,
                              width: Get.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.darkBlue,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: controller.selectedDate.value == ""
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.h,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "Date*",
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey.shade600,
                                          ),
                                          Icon(
                                            Icons.calendar_month_sharp,
                                            size: 20.r,
                                            color: AppColors.lightBlueK,
                                          )
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.h,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "Date*",
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey.shade600,
                                          ),
                                          CustomText(
                                            text: controller.selectedDate.value
                                                .toString(),
                                          ),
                                          Icon(
                                            Icons.calendar_month_sharp,
                                            size: 20.r,
                                            color: AppColors.lightBlueK,
                                          )
                                        ],
                                      ),
                                    )),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              lastDate: DateTime(2080),
                              firstDate: DateTime.now(),
                              initialDate: DateTime.now(),
                            );

                            if (pickedDate == null) return;
                            controller.selectedDate.value.text =
                                DateFormat('dd/MM/yyyy').format(pickedDate);
                          },
                        );
                      }),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(
                10.r,
              ),
              padding: EdgeInsets.all(
                8.r,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Available Slots',
                        fontSize: 18.sp,
                        color: AppColors.darkBlue.withOpacity(
                          0.80,
                        ),
                        fontWeight:
                            FontWeight.w600, // You can specify the font weight
                      ),
                      CustomText(
                        text: 'Available Lockers(143)',
                        fontSize: 12.sp,
                        color: AppColors.darkBlue.withOpacity(
                          0.80,
                        ),
                        fontWeight:
                            FontWeight.w600, // You can specify the font weight
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Obx(() => buildContainer(1, "8:00 - 9:00")),
                      Obx(() => buildContainer(2, "9:00 - 10:00")),
                      Obx(() => buildContainer(3, "10:00 - 12:00")),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(() => buildContainer(4, "12:00 - 14:00")),
                      Obx(() => buildContainer(5, "14:00 - 16:00")),
                      Obx(() => buildContainer(6, "16:00 - 19:00")),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  button(
                    text: 'Modify',
                    onTap: () {
                      Get.toNamed(
                        RouteName.my_locker,
                      );
                      ;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(int containerIndex, String text) {
    return GestureDetector(
      onTap: () {
        controller.selectedContainer.value = containerIndex;
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: controller.selectedContainer.value == containerIndex
              ? Colors.black
              : Colors.grey,
        ),
        child: Center(
          child: CustomText(
            text: text,
            color: Colors.white,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}
