import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/my_plans_controller.dart';
import 'package:mandirwiki/screen/widget/custom_image.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/app_colors.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import 'package:mandirwiki/util/image_constant.dart';

class MyPlansScreen extends GetView<MyPlanController> {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
      Center(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  backButton(),
                  SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    text: 'My Plan',
                    fontSize: 20.sp,
                    fontWeight:
                        FontWeight.bold, // You can specify the font weight
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomImage(
                        height: 25.h,
                        width: 23.h,
                        image: "",
                        placeholder: ImageConstant.share,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      CustomImage(
                        height: 25.h,
                        width: 23.h,
                        image: "",
                        placeholder: ImageConstant.location,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      CustomImage(
                        height: 25.h,
                        width: 23.h,
                        image: "",
                        placeholder: ImageConstant.search,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 8.r,
                      top: 15.h,
                    ),
                    height: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        30.r,
                      ),
                      color: Colors.black,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                            8.r,
                          ),
                          margin: EdgeInsets.only(
                            left: 2.w,
                            right: 8.w,
                          ),
                          height: 28.h,
                          width: 28.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: CustomImage(
                            height: 10.h,
                            width: 10.w,
                            image: "",
                            placeholder: ImageConstant.hotel,
                          ),
                        ),
                        CustomText(
                          text: 'Add your Hotel',
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          width: 20.w,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Obx(() => buildContainer(1, "1")),
                      Obx(() => buildContainer(2, "2")),
                      Obx(() => buildContainer(3, "3")),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                20.r,
                              ),
                              topLeft: Radius.circular(
                                20.r,
                              ),
                            ),
                            child: Image.asset(
                              ImageConstant.temple_image,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    CustomText(
                                      text: 'Swaminarayan Akshardham',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff080E1E).withOpacity(
                                        0.8,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 7.0),
                                      child: SizedBox(
                                        height: 50.h,
                                        width: 300.w,
                                        child: CustomText(
                                          textAlign: TextAlign.start,
                                          text:
                                          'A Huge Complex of Multimedia, Diormas, Temples  and art to teach about Hinduism',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff080E1E).withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 23.h,
                                      width: 55.w,
                                      child: CustomText(
                                        text: "2 hours, 30 mins",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
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
        margin: EdgeInsets.all(
          6.r,
        ),
        padding: EdgeInsets.all(
          6.r,
        ),
        height: 25.h,
        width: 25.w,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              color: controller.selectedContainer.value == containerIndex
                  ? Colors.black
                  : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(
              3.r,
            ),
            color: Colors.white),
        child: Center(
          child: CustomText(
            text: text,
            color: controller.selectedContainer.value == containerIndex
                ? Colors.black
                : Colors.grey,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}
