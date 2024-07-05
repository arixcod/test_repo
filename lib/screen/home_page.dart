import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/home_controller.dart';
import 'package:mandirwiki/screen/mandir_details.dart';
import 'package:mandirwiki/screen/widget/custom_image.dart';
import 'package:mandirwiki/screen/widget/drawer.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/api_constant.dart';
import 'package:mandirwiki/util/app_colors.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import 'package:mandirwiki/util/image_constant.dart';
import 'package:mandirwiki/util/local_database.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffF7F6F0),
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
              8.0.r,
            ),
            child: Obx(() {
              return Column(
                children: [
                  if (controller.value.value == false)
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade200,
                      highlightColor: Colors.grey.shade400,
                      period: const Duration(milliseconds: 1500),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageConstant.profile_pic,
                                  height: 55,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 15.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          5.r,
                                        ),
                                        color: Colors.orange,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Container(
                                      height: 10.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          3.r,
                                        ),
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: 2.h,
                                      ),
                                      height: 10.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          3.r,
                                        ),
                                        color: Colors.orange,
                                      ),
                                    ),
                                    Container(
                                      height: 15.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            height: 50.h,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                              color: Colors.orange,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 20.h,
                                width: 90.w,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              Container(
                                height: 20.h,
                                width: 90.w,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              Container(
                                height: 20.h,
                                width: 90.w,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .45,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 25,
                                right: 25,
                                top: 10,
                              ),
                              child: AppinioSwiper(
                                invertAngleOnBottomDrag: true,
                                backgroundCardCount: 1,
                                swipeOptions: SwipeOptions.symmetric(
                                  horizontal: true,
                                ),
                                controller: controller.swipeController,
                                loop: false,
                                maxAngle: 5,
                                onCardPositionChanged: (
                                  SwiperPosition position,
                                ) {},
                                onSwipeEnd: controller.swipeEnd,
                                onEnd: controller.onEnd,
                                cardCount: 1,
                                cardBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: EdgeInsets.all(
                                        6.r,
                                      ),
                                      child: Stack(
                                        children: [
                                          CustomImage(
                                            image: ImageConstant.noImageFound,
                                            placeholder:
                                                ImageConstant.noImageFound,
                                            fit: BoxFit.fill,
                                            height: 250.h,
                                            width: Get.width,
                                            radius: 34.r,
                                          ),
                                          Positioned(
                                            right: 30.w,
                                            top: 13.h,
                                            child: Container(
                                              height: 30.14.h,
                                              width: 30.14.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
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
                                                  height: 15.91.h,
                                                  width: 15.91.h,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            width: 220.w,
                                            bottom: 65.h,
                                            left: 35.w,
                                            child: Material(
                                              elevation: 1,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10.r,
                                              ),
                                              child: Container(
                                                width: 209.w,
                                                height: 51.91.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10.r,
                                                    ),
                                                    color: Colors.white),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                    8.r,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: CustomText(
                                                          text: "No Data Found",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12.sp,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 29.3.h,
                                                        width: 29.3.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: AppColors
                                                              .black_color_1,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                            8.r,
                                                          ),
                                                          child: Image.asset(
                                                            ImageConstant.arrow,
                                                            height: 15.35.h,
                                                            width: 22.73.w,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ));
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: 170.h,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                15.r,
                              ),
                            ),
                          ),
                          Obx(() {
                            return CarouselSlider(
                              options: CarouselOptions(
                                height: 200.h,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.95,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(
                                  seconds: 3,
                                ),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeFactor: 0.3,
                                scrollDirection: Axis.horizontal,
                              ),
                              items:
                                  controller.bannerList.map((bannerDataList) {
                                return InkWell(
                                  child: Container(
                                    width: Get.width,
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(left: 20.w),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      // color: MyColors.appThirdThemeColor.withOpacity(
                                      //   0.4,
                                      // ),
                                      borderRadius: BorderRadius.circular(
                                        8,
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "${ApiConstants.imageUrl}${bannerDataList.bannerImage.toString()}"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 200.h,
                            width: Get.width,
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 300.h,
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (controller.value.value == true)
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                            8.r,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                child: Image.asset(
                                  ImageConstant.profile_pic,
                                  height: 40.h,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.getGreeting(),
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins"),
                                    ),
                                    controller.isLoggedIn.value == ""
                                        ? CustomText(
                                            text: 'Guest',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black_color)
                                        : CustomText(
                                            text:
                                                controller.userFirstName.value,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black_color,
                                          ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Obx(() {
                                    return controller.isLoggedIn.value == ""
                                        ? InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                RouteName.login_screen,
                                              );
                                            },
                                            child: CustomText(
                                              text: 'Sign in',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w300,
                                              underline: true,
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              StorageUtil.clear();
                                              Get.offAllNamed(
                                                  RouteName.login_screen);
                                            },
                                            child: CustomText(
                                              text: 'Sign Out',
                                              fontSize: 10.5.sp,
                                              fontWeight: FontWeight.w300,
                                              underline: true,
                                            ),
                                          );
                                  }),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        margin: EdgeInsets.only(
                                          top: 5.h,
                                        ),
                                        width: 87.07.w,
                                        height: 16.74.h,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              5.r,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.1,
                                                ),
                                                blurRadius: 5.0,
                                              ),
                                            ]),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 12.w,
                                            right: 12.w,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                ImageConstant.language,
                                                height: 12.56.h,
                                                width: 9.42.w,
                                              ),
                                              CustomText(
                                                text: 'English',
                                                fontSize: 10.5.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              Image.asset(
                                                ImageConstant.dropdown,
                                                color: Colors.black,
                                                width: 4.74.w,
                                                height: 2.37.h,
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                            8.r,
                          ),
                          child: Container(
                            height: 37.h,
                            width: 310.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                8.r,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 5.w,
                                right: 5.w,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      // buildName(),
                                      Image.asset(
                                        ImageConstant.search1,
                                        color: Colors.black,
                                        width: 16.91.w,
                                        height: 17.16.h,
                                      ).paddingOnly(
                                        right: 10.w,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          DefaultTextStyle(
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey_color),
                                            child: AnimatedTextKit(
                                              pause: Duration(seconds: 1),
                                              animatedTexts: [
                                                RotateAnimatedText(
                                                  "  Discover by Temple",
                                                ),
                                                RotateAnimatedText(
                                                  " Discover by City",
                                                ),
                                                RotateAnimatedText(
                                                  " Discover by Location",
                                                ),
                                              ],
                                              isRepeatingAnimation: true,
                                              totalRepeatCount:
                                                  1000000000000000000,
                                              onTap: () {
                                                print("Tap Event");
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // CustomImage(image:ImageConstant.filter , height: 40.h,),
                                  Image.asset(
                                    ImageConstant.filter,
                                    height: 11.72.h,
                                    width: 13.4.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Obx(() => buildContainer(1, "Popular")),
                              Obx(() => buildContainer(2, "Most Viewed")),
                              Obx(() => buildContainer(3, "Recommended")),
                            ],
                          ),
                        ).paddingOnly(
                          bottom:
                              15.h, // changed by clint on 5th june  \25 to 15
                          left: 10.w,
                        ),
                        (controller.mandirList.length != 0 ||
                                controller.mandirList.isNotEmpty)
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .45,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 25.w,
                                    right: 25.w,
                                  ),
                                  child: AppinioSwiper(
                                    invertAngleOnBottomDrag: true,
                                    backgroundCardCount: 1,
                                    swipeOptions: const SwipeOptions.all(),
                                    controller: controller.swipeController,
                                    loop: true,
                                    maxAngle: 5,
                                    onSwipeEnd: controller.swipeEnd,
                                    onEnd: controller.onEnd,
                                    cardCount: controller.mandirList.length,
                                    cardBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                          padding: EdgeInsets.all(
                                            6.r,
                                          ),
                                          child: Stack(
                                            children: [
                                              CustomCardImage(
                                                image:
                                                    "${ApiConstants.imageUrl}${controller.mandirList[index].mandirImg}",
                                                placeholder:
                                                    ImageConstant.noImageFound,
                                                fit: BoxFit.fill,
                                                height: 250.h,
                                                width: Get.width,
                                                radius: 34.r,
                                              ),
                                              Positioned(
                                                right: 30.w,
                                                top: 13.h,
                                                child: Container(
                                                  height: 30.14.h,
                                                  width: 30.14.h,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white
                                                        .withOpacity(
                                                      0.4,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                      8.r,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      ImageConstant.heart,
                                                      height: 15.91.h,
                                                      width: 15.91.h,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                width: 220.w,
                                                bottom: 65.h,
                                                left: 35.w,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        RouteName.mandir_detail,
                                                        arguments: [
                                                          controller
                                                              .mandirList[index],
                                                          controller
                                                              .isLoggedIn.value
                                                        ]);
                                                  },
                                                  child: Material(
                                                    elevation: 1,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10.r,
                                                    ),
                                                    child: Container(
                                                      width: 209.w,
                                                      height: 51.91.h,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            10.r,
                                                          ),
                                                          color: Colors.white),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                          8.r,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        30.26.h,
                                                                    width:
                                                                        118.05
                                                                            .w,
                                                                    child:
                                                                        CustomText(
                                                                      text: controller
                                                                              .mandirList[index]
                                                                              .mandirName ??
                                                                          "",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          12.sp,
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      SvgPicture
                                                                          .asset(
                                                                        'assets/images/mark.svg',
                                                                        height:
                                                                            9.29.h,
                                                                        width:
                                                                            7.76.h,
                                                                      ),
                                                                      CustomText(
                                                                        text: controller.mandirList[index].city ??
                                                                            "",
                                                                        color: Color(
                                                                            0xff64646E),
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            9.sp,
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 29.3.h,
                                                              width: 29.3.h,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: AppColors
                                                                    .black_color_1,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                  8.r,
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  ImageConstant
                                                                      .arrow,
                                                                  height:
                                                                      15.35.h,
                                                                  width:
                                                                      22.73.w,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ));
                                    },
                                  ),
                                ),
                              )
                            : SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .45,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                    top: 10,
                                  ),
                                  child: AppinioSwiper(
                                    invertAngleOnBottomDrag: true,
                                    backgroundCardCount: 1,
                                    swipeOptions: SwipeOptions.symmetric(
                                      horizontal: true,
                                    ),
                                    controller: controller.swipeController,
                                    loop: false,
                                    maxAngle: 5,
                                    onCardPositionChanged: (
                                      SwiperPosition position,
                                    ) {},
                                    onSwipeEnd: controller.swipeEnd,
                                    onEnd: controller.onEnd,
                                    cardCount: 1,
                                    cardBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                          padding: EdgeInsets.all(
                                            6.r,
                                          ),
                                          child: Stack(
                                            children: [
                                              CustomImage(
                                                image:
                                                    ImageConstant.noImageFound,
                                                placeholder:
                                                    ImageConstant.noImageFound,
                                                fit: BoxFit.fill,
                                                height: 250.h,
                                                width: Get.width,
                                                radius: 34.r,
                                              ),
                                              Positioned(
                                                right: 30.w,
                                                top: 13.h,
                                                child: Container(
                                                  height: 30.14.h,
                                                  width: 30.14.h,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white
                                                        .withOpacity(
                                                      0.4,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                      8.r,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      ImageConstant.heart,
                                                      height: 15.91.h,
                                                      width: 15.91.h,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                width: 220.w,
                                                bottom: 65.h,
                                                left: 35.w,
                                                child: Material(
                                                  elevation: 1,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10.r,
                                                  ),
                                                  child: Container(
                                                    width: 209.w,
                                                    height: 51.91.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          10.r,
                                                        ),
                                                        color: Colors.white),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                        8.r,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: CustomText(
                                                              text:
                                                                  "No Data Found",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 12.sp,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 29.3.h,
                                                            width: 29.3.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColors
                                                                  .black_color_1,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                8.r,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                ImageConstant
                                                                    .arrow,
                                                                height: 15.35.h,
                                                                width: 22.73.w,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ));
                                    },
                                  ),
                                ),
                              ),
                        whiteContainer(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                text: '   Our Services',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkBlue,
                              ).paddingOnly(
                                top: 20.h,
                                bottom: 15.h,
                              ),
                              (controller.mandirList.isNotEmpty &&
                                      controller
                                          .mandirList[
                                              controller.targetIndexValue.value]
                                          .ourServices!
                                          .isNotEmpty)
                                  ? Obx(
                                      () {
                                        return GridView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.all(
                                            10.r,
                                          ),
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: controller
                                              .mandirList[controller
                                                  .targetIndexValue.value]
                                              .ourServices!
                                              .length,
                                          gridDelegate:
                                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 120,
                                            // childAspectRatio: 3 / 2,
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 12,
                                          ),
                                          itemBuilder: (context, index) {
                                            var data = controller
                                                .mandirList[controller
                                                    .targetIndexValue.value]
                                                .ourServices![index];
                                            return Material(
                                              elevation: 1.5,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10.r,
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  controller
                                                      .onSelectedBottom(index);
                                                },
                                                child: Container(
                                                  height: 78.h,
                                                  width: 96.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      7.r,
                                                    ),
                                                    color: Color(
                                                      0xffF5F5F5,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            "${ApiConstants.imageUrl}${data.serviceImage}",
                                                        placeholder: (context,
                                                                url) =>
                                                            CupertinoActivityIndicator(),
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                            10.0.r,
                                                          ),
                                                          height: 43.h,
                                                          width: 43.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image:
                                                                DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: CustomText(
                                                          text:
                                                              data.serviceName ??
                                                                  "",
                                                          // text: controller.targetIndexValue.value.toString(),
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    )
                                  : SizedBox(
                                      height: 220.h,
                                      child: GridView.builder(
                                          padding: EdgeInsets.all(
                                            10.r,
                                          ),
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: 6,
                                          gridDelegate:
                                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 120,
                                            // childAspectRatio: 3 / 2,
                                            crossAxisSpacing: 13,
                                            mainAxisSpacing: 13,
                                          ),
                                          itemBuilder: (context, index) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    6.r,
                                                  ),
                                                  color: Color(0xffF5F5F5)),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.all(
                                                      10.0.r,
                                                    ),
                                                    height: 50.h,
                                                    width: 50.w,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                          ImageConstant
                                                              .noServiceFound,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: CustomText(
                                                      text: "No Data Found",
                                                      // text: controller.targetIndexValue.value.toString(),
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                            ],
                          ).paddingOnly(
                            bottom: 20.h,
                          ),
                        ).paddingOnly(
                          bottom: 30.h,
                        ),
                        (controller.mandirList.isNotEmpty &&
                                controller.bannerList.isNotEmpty)
                            ? Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  CarouselSlider(
                                    options: CarouselOptions(
                                        height: 130.h,
                                        aspectRatio: 16 / 9,
                                        viewportFraction: 1,
                                        initialPage: 0,
                                        enableInfiniteScroll: true,
                                        reverse: false,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(
                                          seconds: 3,
                                        ),
                                        autoPlayAnimationDuration:
                                            Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enlargeFactor: 0.3,
                                        scrollDirection: Axis.horizontal,
                                        onPageChanged: (index, reason) {
                                          controller.onBannerChangeIndex.value =
                                              index;
                                        }),
                                    items: controller.bannerList
                                        .map((bannerDataList) {
                                      return InkWell(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 20.w),
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 5.w,
                                            vertical: 5.h,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "${ApiConstants.imageUrl}${bannerDataList.bannerImage.toString()}"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  DotsIndicator(
                                    dotsCount: 2,
                                    position:
                                        controller.onBannerChangeIndex.value,
                                    onTap: (index) {
                                      controller.carouselController
                                          .animateToPage(index);
                                    },
                                    decorator: DotsDecorator(
                                      color: Colors.grey,
                                      activeColor: Colors.white,
                                      size: Size.square(
                                        8.r,
                                      ),
                                      activeSize: Size(
                                        23.w,
                                        6.h,
                                      ),
                                      activeShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                      ),
                                    ),
                                  ).paddingOnly(bottom: 5.h),
                                ],
                              ).paddingOnly(
                                bottom: 15.h,
                              )
                            : Container(
                                height: 155.h,
                                width: 390.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10.r,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        ImageConstant.noBannerFound,
                                      ),
                                    )),
                              ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(
                            15.r,
                          ),
                          child: Container(
                            width: 340.w,
                            height: 152.37.h,
                            padding: EdgeInsets.only(
                              top: 18.h,
                              left: 8.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                15.r,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: '   Other Services',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.darkBlue,
                                ).paddingOnly(
                                  bottom: 5.h,
                                ),
                                (controller.mandirList.isNotEmpty &&
                                        controller
                                            .mandirList[controller
                                                .targetIndexValue.value]
                                            .otherServices!
                                            .isNotEmpty)
                                    ? Expanded(
                                        child: ListView.builder(
                                          padding: EdgeInsets.all(0),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller
                                              .mandirList[controller
                                                  .targetIndexValue.value]
                                              .otherServices!
                                              .length,
                                          // Replace itemCount with the actual number of items
                                          itemBuilder: (context, index) {
                                            var data = controller
                                                .mandirList[controller
                                                    .targetIndexValue.value]
                                                .otherServices![index];
                                            return Column(
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl:
                                                      "${ApiConstants.imageUrl}${data.serviceImage}",
                                                  placeholder: (context, url) =>
                                                      CupertinoActivityIndicator(),
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10.0.w,
                                                        right: 10.w,
                                                        top: 5.h,
                                                        bottom: 0),
                                                    height: 51.91.h,
                                                    width: 52.7.w,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CustomText(
                                                    text:
                                                        data.serviceName ?? "",
                                                    fontSize: 9.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.darkBlue,
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                      )
                                    : SizedBox(
                                        height: 100.h,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 1,
                                          // Replace itemCount with the actual number of items
                                          itemBuilder: (context, index) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  6.r,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomText(
                                                    text: "No Data Found",
                                                    fontSize: 10.sp,
                                                    color: AppColors.darkBlue,
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 240.h,
                            width: 340.w,
                            padding: EdgeInsets.only(
                              top: 18.h,
                              left: 8.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: '   Important Information',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.darkBlue,
                                ),
                                MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child: Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.zero,
                                      itemCount:
                                          controller.importantInfoList.length,
                                      // Replace itemCount with the actual number of items
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.all(
                                            8.r,
                                          ),
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  15.r,
                                                ),
                                                child: CustomImage(
                                                  image: "",
                                                  // Replace with actual image path or URL
                                                  placeholder: controller
                                                      .importantInfoList[index]
                                                      .image,
                                                  fit: BoxFit.fill,
                                                  height: 174.98.h,
                                                  width: 137.7.w,
                                                  radius: 15.r,
                                                ),
                                              ),
                                              Container(
                                                height: 32.65.h,
                                                width: 137.7.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                      15.r,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(
                                                      15.r,
                                                    ),
                                                  ),
                                                  color:
                                                      Colors.black.withOpacity(
                                                    0.8,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: CustomText(
                                                    fontSize: 9.sp,
                                                    text: controller
                                                        .importantInfoList[
                                                            index]
                                                        .name,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              );
            }),
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
        height: 34.33.h,
        constraints: BoxConstraints(minWidth: 104.w),
        margin: EdgeInsets.symmetric(
          horizontal: 6.w,
          vertical: 4.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
        ),
        decoration: BoxDecoration(
          color: controller.selectedContainer.value == containerIndex
              ? Colors.black
              : Colors.white,
          borderRadius: BorderRadius.circular(
            18.r,
          ),
        ),
        child: Center(
          child: CustomText(
            text: text,
            fontSize: 12.sp,
            color: controller.selectedContainer.value == containerIndex
                ? Colors.white
                : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
