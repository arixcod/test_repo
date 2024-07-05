import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mandirwiki/controller/rent_locker_controller.dart';
import 'package:mandirwiki/model/locker_model.dart';
import 'package:mandirwiki/model/mandir_list_model.dart';
import 'package:mandirwiki/screen/terms_conditions.dart';
import 'package:mandirwiki/screen/widget/custom_image.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/app_colors.dart';
import 'package:mandirwiki/util/custom_component/allContentList.dart';
import 'package:mandirwiki/util/custom_component/custom_button.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import 'package:mandirwiki/util/custom_component/custom_textField.dart';
import 'package:mandirwiki/util/image_constant.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';

class RentLockerDetail extends GetView<RentLockerController> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (canPop) {
        controller.selectedDate.value.clear();
        controller.promoCodeController.clear();
        controller.mandirList.clear();
        controller.lockerList.clear();
        controller.availableSlotList.clear();
        controller.selectedDate.value.text =
            DateFormat('DD/MM/YYYY').format(DateTime.now()).toString();
        // Get.offNamed(RouteName.bottom_navigation);
      },
      child: customScaffold(
        SafeArea(
          child: Obx(() {
            return controller.accessToken.value == ""
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Login Required",
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  margin: EdgeInsets.all(
                                    8.r,
                                  ),
                                  height: 34.h,
                                  width: 175.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40.r),
                                      border: Border.all(
                                        color: Colors.black,
                                      )),
                                  child: Center(
                                    child: CustomText(
                                      text: 'Go Back',
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteName.login_screen);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(
                                    8.r,
                                  ),
                                  height: 34.h,
                                  width: 175.w,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(
                                      40.r,
                                    ),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: ' To Login',
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
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
                              fontSize: 16.sp,
                              fontWeight: FontWeight
                                  .w700, // You can specify the font weight
                            ),
                          ],
                        ),
                        whiteContainer(
                          Container(
                            padding: EdgeInsets.all(8.r),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5.h,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: CustomText(
                                    text: '  Select Locker & Date ',
                                    fontSize: 15.sp,
                                    color: AppColors.darkBlue.withOpacity(
                                      0.8,
                                    ),
                                    fontWeight: FontWeight
                                        .w600, // You can specify the font weight
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Obx(() {
                                  return controller.isLoading.value
                                      ? CircularProgressIndicator()
                                      : SizedBox(
                                          height: 54.4.h,
                                          width: 310.25.w,
                                          child: DropdownMenu<MandirList>(
                                            //initialSelection: menuItems.first,
                                            controller:
                                                controller.mandirController,

                                            hintText: "Search Nearby Temples",

                                            width: 310.25.w,
                                            requestFocusOnTap: true,
                                            enableFilter: true,
                                            enableSearch: true,
                                            trailingIcon: CustomImage(
                                              image: "",
                                              // Replace with actual image path or URL
                                              placeholder:
                                                  ImageConstant.dropdown,
                                              fit: BoxFit.fill,
                                              height: 7.h,
                                              width: 12.w,
                                              radius: 2.25.r,
                                            ),
                                            inputDecorationTheme:
                                                InputDecorationTheme(
                                              enabledBorder: outlineBorder,
                                              focusedBorder: outlineBorder,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10.r,
                                                ),
                                              ),
                                              alignLabelWithHint: true,
                                            ),
                                            menuStyle: MenuStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all<
                                                      Color>(
                                                Colors.white,
                                              ),
                                            ),

                                            label: CustomText(
                                              text: "Search Nearby Temples",
                                              color: Colors.grey.shade600,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            ).paddingOnly(
                                              left: 5.w,
                                            ),
                                            onSelected: (val) {
                                              controller.mandirIds.value =
                                                  val!.sId ?? "";
                                              debugPrint(
                                                  "mandir name in on changed ===> ${val.sId ?? ""}");
                                              controller.getLockerAPI(
                                                mandirId:
                                                    controller.mandirIds.value,
                                              );
                                            },
                                            dropdownMenuEntries:
                                                controller.mandirList.map<
                                                        DropdownMenuEntry<
                                                            MandirList>>(
                                                    (MandirList mandirList) {
                                              return DropdownMenuEntry<
                                                  MandirList>(
                                                value: mandirList,
                                                label:
                                                    mandirList.mandirName ?? "",
                                              );
                                            }).toList(),
                                          ),
                                        );
                                }).paddingOnly(
                                  bottom: 8.h,
                                ),
                                Obx(() {
                                  return controller.isLoadingLocker.value
                                      ? CircularProgressIndicator()
                                      : Container(
                                          height: 54.4.h,
                                          width: 310.25.w,
                                          alignment: Alignment.center,
                                          child: DropdownMenu<Data>(
                                            //initialSelection: menuItems.first,
                                            controller:
                                                controller.lockerController,
                                            width: 310.25.w,
                                            hintText: "Select Locker Name",

                                            requestFocusOnTap: true,
                                            enableFilter: true,
                                            enableSearch: true,
                                            trailingIcon: CustomImage(
                                              image: "",
                                              // Replace with actual image path or URL
                                              placeholder:
                                                  ImageConstant.dropdown,
                                              fit: BoxFit.fill,
                                              height: 7.h,
                                              width: 12.w,
                                              radius: 2.25.r,
                                            ),
                                            inputDecorationTheme:
                                                InputDecorationTheme(
                                              enabledBorder: outlineBorder,
                                              focusedBorder: outlineBorder,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                              alignLabelWithHint: true,
                                            ),
                                            menuStyle: MenuStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all<
                                                      Color>(
                                                Colors.white,
                                              ),
                                            ),

                                            label: CustomText(
                                              text: "Select Locker",
                                              color: Colors.grey.shade600,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            onSelected: (val) async {
                                              controller.lockerIds.value =
                                                  val!.sId ?? "";
                                              debugPrint(
                                                  "locker id is ===> ${controller.lockerIds.value}");
                                            },
                                            dropdownMenuEntries: controller
                                                .lockerList
                                                .map<DropdownMenuEntry<Data>>(
                                                    (Data lockerList) {
                                              return DropdownMenuEntry<Data>(
                                                value: lockerList,
                                                label:
                                                    lockerList.lockerName ?? "",
                                              );
                                            }).toList(),
                                          ),
                                        );
                                }).paddingOnly(
                                  bottom: 8.h,
                                ),
                                Container(
                                  height: 54.4.h,
                                  width: 310.25.w,
                                  alignment: Alignment.center,
                                  child: DropdownMenu<String>(
                                    //initialSelection: menuItems.first,
                                    controller:
                                        controller.lockerNumberController,
                                    width: 310.25.w,
                                    hintText: "Select No. of Lockers You want",
                                    textStyle: GoogleFonts.poppins(
                                      color: Colors.grey.shade600,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    requestFocusOnTap: true,
                                    enableFilter: true,
                                    enableSearch: true,
                                    trailingIcon: CustomImage(
                                      image: "",
                                      // Replace with actual image path or URL
                                      placeholder: ImageConstant.dropdown,
                                      fit: BoxFit.fill,
                                      height: 7.h,
                                      width: 12.w,
                                      radius: 2.25.r,
                                    ),
                                    inputDecorationTheme: InputDecorationTheme(
                                      enabledBorder: outlineBorder,
                                      focusedBorder: outlineBorder,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      alignLabelWithHint: true,
                                    ),
                                    menuStyle: MenuStyle(
                                      backgroundColor:
                                          WidgetStateProperty.all<Color>(
                                        Colors.white,
                                      ),
                                    ),

                                    label: CustomText(
                                      text: "No. of Lockers",
                                      color: Colors.grey.shade600,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    onSelected: (val) async {
                                      controller.selectedLocker.value = val!;
                                      controller.totalAmount.value =
                                          "${40 * int.parse(
                                                controller.selectedLocker.value,
                                              )}";
                                      debugPrint(
                                          "value in locker select ===> $val");
                                      debugPrint(
                                          "total amount is  ===> ${controller.totalAmount.value}");
                                    },
                                    dropdownMenuEntries: AllContentList
                                        .lockerNumberList
                                        .map<DropdownMenuEntry<String>>(
                                            (String lockerNumber) {
                                      return DropdownMenuEntry<String>(
                                        value: lockerNumber,
                                        label: lockerNumber ?? "",
                                      );
                                    }).toList(),
                                  ),
                                ).paddingOnly(
                                  bottom: 8.h,
                                ),
                                Container(
                                  height: 54.4.h,
                                  width: 310.25.w,
                                  alignment: Alignment.center,
                                  child: Obx(() {
                                    return TextFormField(
                                      controller: controller.selectedDate.value,
                                      style: GoogleFonts.poppins().copyWith(
                                        fontSize: 12.sp,
                                        color: AppColors.darkBlue,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.calendar_month,
                                          color: AppColors.lightBlueK,
                                          size: 18.r,
                                        ),
                                        labelText: 'Select Date',
                                        labelStyle:
                                            GoogleFonts.poppins().copyWith(
                                          fontSize: 12.sp,
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        hintText: 'Select Date',
                                        hintStyle:
                                            GoogleFonts.poppins().copyWith(
                                          fontSize: 10.sp,
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        border: outlineBorder,
                                      ),
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          lastDate: DateTime.now()
                                              .add(Duration(days: 30)),
                                          firstDate: DateTime.now(),
                                          initialDate: DateTime.now(),
                                        );
                                        if (pickedDate == null) return;
                                        controller.selectedDate.value.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                        if (pickedDate != null) {
                                          if (controller.lockerIds.value ==
                                              "") {
                                            showToastMsg(
                                                "Please Select Mandir and Locker");
                                          } else {
                                            loadingDialogBox(context: context);
                                            await controller.locker_slot(
                                              lockerId:
                                                  controller.lockerIds.value,
                                              date: controller
                                                  .selectedDate.value.text,
                                            );
                                          }
                                        }
                                      },
                                    );
                                  }),
                                ).paddingOnly(
                                  bottom: 10.h,
                                ),
                              ],
                            ),
                          ),
                        ).paddingOnly(
                          left: 8.w,
                          right: 8.w,
                          top: 8.h,
                          bottom: 10.h,
                        ),
                        SizedBox(
                          height: 8.h,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: '   Available Slots',
                                    fontSize: 15.sp,
                                    color: AppColors.darkBlue.withOpacity(
                                      0.80,
                                    ),
                                    fontWeight: FontWeight
                                        .w600, // You can specify the font weight
                                  ),
                                  (controller.availableSlotList.length == 0)
                                      ? CustomText(
                                          text: 'Available Lockers(0)',
                                          fontSize: 10.sp,
                                          color: AppColors.darkBlue.withOpacity(
                                            0.80,
                                          ),
                                          fontWeight: FontWeight
                                              .w600, // You can specify the font weight
                                        )
                                      : CustomText(
                                          text:
                                              'Available Lockers(${controller.availableLockerData!.data?.availableTickets})',
                                          fontSize: 10.sp,
                                          color: AppColors.darkBlue.withOpacity(
                                            0.80,
                                          ),
                                          fontWeight: FontWeight
                                              .w600, // You can specify the font weight
                                        ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Column(
                                children: [
                                  LayoutBuilder(
                                      builder: (context, constraints) {
                                    double screenWidth = constraints
                                        .maxWidth; // Get screen width
                                    int crossAxisCount =
                                        controller.calculateCrossAxisCount(
                                            screenWidth,
                                            controller.itemWidth.value);
                                    return Obx(() {
                                      return (controller
                                                  .availableSlotList.length ==
                                              0)
                                          ? SizedBox()
                                          : GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              padding:
                                                  EdgeInsets.only(left: 9.w),
                                              itemCount: controller
                                                  .availableSlotList[0]
                                                  .availableSlot!
                                                  .length,
                                              gridDelegate:
                                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 140,
                                                childAspectRatio: 6 / 2,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 12,
                                              ),
                                              itemBuilder: (context, index) {
                                                String? slot = controller
                                                    .availableSlotList[0]
                                                    .availableSlot![index];

                                                return Obx(() => buildContainer(
                                                    index, slot ?? ""));
                                              },
                                            );
                                    });
                                  }),
                                ],
                              ),
                            ],
                          ),
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
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: CustomText(
                                      text: '   Do you have a promo Code?',
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlue.withOpacity(
                                        0.8,
                                      ),
                                      fontWeight: FontWeight
                                          .w600, // You can specify the font weight
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  textField(
                                      label: 'Do you have a promo Code?',
                                      controller:
                                          controller.promoCodeController,
                                      inputType: TextInputType.text,
                                      validate: (val) {}),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  button(
                                    text: 'Apply promo code',
                                    onTap: () {
                                      controller.promoCodeController.text =
                                          "FIRSTFREE";
                                      controller.totalAmount.value = "0";
                                      debugPrint(
                                          "on tap total amount is  ===> ${controller.totalAmount.value}");
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CustomText(
                                    text: 'Total Payable Amount',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkBlue.withOpacity(
                                      0.80,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: '4 Hours ',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Obx(() {
                                      return CustomText(
                                        text:
                                            'Rs. ${controller.totalAmount.value}',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      );
                                    }),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                button(
                                  text: 'Proceed to Book',
                                  onTap: () {
                                    debugPrint("pressed ===> ");
                                    if (controller.mandirIds.value == "") {
                                      showToastMsg("Select Nearby Temple");
                                    } else if (controller.lockerIds.value ==
                                        "") {
                                      showToastMsg("Select Locker");
                                    } else if (controller
                                            .selectedLocker.value ==
                                        "") {
                                      showToastMsg("Select Number of Locker");
                                    } else if (controller
                                            .selectedDate.value.text ==
                                        "") {
                                      showToastMsg("Select Date");
                                    } else if (controller.selectedTime.value ==
                                        "") {
                                      showToastMsg("Select Available Slot");
                                    } else {
                                      loadingDialogBox(context: context);
                                      controller.book_locker(
                                          totalAmounts:
                                              controller.totalAmount.value);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }

  Widget buildContainer(int containerIndex, String text) {
    return GestureDetector(
      onTap: () {
        controller.selectedContainer.value = containerIndex;
        controller.selectedTime.value = text;
        debugPrint("index value is ===> ${containerIndex}");
        debugPrint("index value is ===> ${text}");
        debugPrint("index value is ===> ${controller.selectedTime.value}");
        debugPrint(
            "selected container index value is ===> ${controller.selectedContainer.value}");
      },
      child: Container(
        width: 94.03.w,
        height: 27.98.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5.r,
          ),
          color: controller.selectedContainer.value == containerIndex
              ? Colors.black
              : Colors.grey,
        ),
        child: Center(
          child: CustomText(
            text: text,
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
