import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/wishlist_controller.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/app_colors.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import 'package:mandirwiki/util/image_constant.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';

import 'mandir_details.dart';

class MyWishlistBottomNav extends GetView<WishListController> {
  const MyWishlistBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WishListController());
    return customScaffold(
      SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 15.w,
                ),
                CustomText(
                  text: 'Wishlist',
                  fontSize: 20.sp,
                  fontWeight:
                      FontWeight.bold, // You can specify the font weight
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  height: 20.h,
                  width: 90.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black,
                  ),
                  child: InkWell(
                    onTap: () async {
                      await showAdaptiveDialog<bool>(
                        context: context,
                        builder: (context) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaY: 10,
                              sigmaX: 10,
                              tileMode: TileMode.mirror,
                            ),
                            child: AlertDialog.adaptive(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Select Days',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              contentPadding: EdgeInsets.only(top: 0),
                              content: Padding(
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                ),
                                child: CustomText(
                                  text:
                                  'How many days are you going to be in New Delhi?',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              actions: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Obx(() => buildContainer(1, "1")),
                                        Obx(() => buildContainer(2, "2")),
                                        Obx(() => buildContainer(3, "3")),
                                        Obx(() => buildContainer(4, "More")),
                                      ],
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(
                                            8.r,
                                          ),
                                          height: 37.h,
                                          width: 138.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              35.r,
                                            ),
                                            border: Border.all(
                                              width: 1.w,
                                              color: AppColors.darkBlue,
                                            ),
                                          ),
                                          child: Center(
                                            child: CustomText(
                                              text: 'Cancel',
                                              fontSize: 15.sp,
                                              color: AppColors.darkBlue,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset('assets/images/Vector.svg'),
                        CustomText(
                          text: 'Make a Plan',
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Get.to(MandirDetails());
              },
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
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.asset(
                                ImageConstant.temple_image,
                              ),
                              Container(
                                height: 40.h,
                                width: 40.w,
                                margin: EdgeInsets.only(
                                  top: 10.h,
                                  right: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    100.r,
                                  ),
                                  color: Colors.white.withOpacity(
                                    0.4,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    8.r,
                                  ),
                                  child: SvgPicture.asset(
                                    ImageConstant.heart,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                text: 'Swaminarayan Akshardham',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff080E1E).withOpacity(0.8),
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                itemSize: 12.w,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 0.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.0),
                          child: CustomText(
                            textAlign: TextAlign.start,
                            text:
                                'A Huge Complex of Multimedia, Diormas, Temples  and art to teach about Hinduism',
                            fontSize: 12.sp,
                            color: Color(0xff080E1E).withOpacity(0.8),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.0),
                          child: Row(
                            children: [
                              CustomText(
                                text: 'Temple Timings',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.lightBlueK,
                                // color: Color(0xff345AFA),
                              ),
                              SvgPicture.asset(
                                'assets/images/timer.svg',
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
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
    );
  }
  Widget buildContainer(int containerIndex, String text) {
    return GestureDetector(
      onTap: () {
        controller.selectedContainer.value = containerIndex;
        Get.toNamed(RouteName.my_plan);
      },
      child: Container(
        margin: EdgeInsets.all(
          6.r,
        ),
        padding: EdgeInsets.all(
          6.r,
        ),
        height: 45.h,
        width: 45.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(5),
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
