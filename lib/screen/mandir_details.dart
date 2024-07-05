import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/model/home_page_model.dart';
import 'package:mandirwiki/screen/widget/custom_image.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/api_constant.dart';
import 'package:mandirwiki/util/app_colors.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import 'package:mandirwiki/util/image_constant.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MandirDetails extends StatefulWidget {
  const MandirDetails({super.key});

  @override
  State<MandirDetails> createState() => _MandirDetailsState();
}

class _MandirDetailsState extends State<MandirDetails>
    with SingleTickerProviderStateMixin {
  // 640 by 1000

  MandirLists? mandirDetails = null;

  RxInt onBannerChangeIndex = 0.obs;
  final ExpansionTileController expandedTileController =
      ExpansionTileController();

  RxString accessToken = "".obs;
  late TabController _tabController;
  bool isExpaned = true;

  @override
  void initState() {
    _tabController = TabController(length: items.length, vsync: this);
    _itemScrollController = ItemScrollController();
    _itemPositionsListener = ItemPositionsListener.create();

    _itemPositionsListener.itemPositions.addListener(() {
      final positions = _itemPositionsListener.itemPositions.value;

      int firstVisibleIndex = positions
          .where((ItemPosition position) {
            print(
                "${position.index}  --  ${position.itemLeadingEdge} ======== ${position.itemTrailingEdge}");

            return position.itemTrailingEdge > 0.17;
          })
          .first
          .index;
      setState(
        () {
          isVisible = firstVisibleIndex > 0;
        },
      );
      if (firstVisibleIndex != _tabController.index &&
          firstVisibleIndex < items.length) {
        _tabController.animateTo(firstVisibleIndex);
      }
    });
    super.initState();
    mandirDetails = Get.arguments[0];
    accessToken.value = Get.arguments[1];
    setupList();
  }

  void setupList() {
    List<Widget> list;
    items.forEach(
      (element) {},
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final scrollController = ScrollController().obs;
  var currentIndex = 0.obs;
  ValueNotifier<int> valueNotifier = ValueNotifier<int>(0);

  void nextPage() {
    if (currentIndex.value < mandirDetails!.mandirImages!.length - 1) {
      currentIndex.value++;
      if (scrollController.canUpdate) {
        scrollController.value.animateTo(
          currentIndex.value *
              200.0, // Adjust the 200.0 to the width of each item if different
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      scrollController.value.animateTo(
        currentIndex.value *
            200.0, // Adjust the 200.0 to the width of each item if different
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  final List<String> items = [
    'Temple name',
    'Time To Visit',
    'How to Reach',
    'Yatra Parchi / Registration',
    'Trek Distance',
    'Footfall',
    'Avg. Temperature (C)',
    'Where to Stay',
    'Temple Timings',
    'Dress Code',
    'Gate Information',
  ];

  int selectedIndex = 0;
  bool isVisible = false;
  late ItemScrollController _itemScrollController;
  late ItemPositionsListener _itemPositionsListener;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    _scrollToSelectedIndex(index);
  }

  void _scrollToSelectedIndex(int index) {
    _itemScrollController.jumpTo(index: index, alignment: 0.13);
  }

  // Widget _wrapScrollTag(int index, Widget child) {
  //   return AutoScrollTag(
  //     key: ValueKey(index),
  //     controller: _autoScrollController,
  //     index: index,
  //     child: child,
  //   );
  // }

  _buildSliverAppbar(BuildContext context, bool innerBoxIsScrolled) {
    return SliverAppBar(
      pinned: true,
      title: AnimatedOpacity(
          opacity: isExpaned ? 0.0 : 1,
          duration: Duration(milliseconds: 300),
          child: Text(mandirDetails?.mandirName ?? "")),
      automaticallyImplyLeading: false,
      expandedHeight: 310.0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, value, child) {
            return topContainer(
                image:
                    '${ApiConstants.imageUrl}${mandirDetails?.mandirImages?[currentIndex.value]}');
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return customScaffold(
      SafeArea(
        child: accessToken.value == ""
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
            : Column(
                children: [
                  topContainer(
                      image:
                          '${ApiConstants.imageUrl}${mandirDetails?.mandirImages?[currentIndex.value]}'),
                  Expanded(
                    child: Stack(
                      children: [
                        ScrollablePositionedList.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return buildListItem(index);
                          },
                          itemScrollController: _itemScrollController,
                          itemPositionsListener: _itemPositionsListener,
                        ),
                        AnimatedOpacity(
                          curve: Curves.easeInOut,
                          opacity: isVisible ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: isVisible
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Colors.black54)),
                                      child: TabBar(
                                          onTap: (value) {
                                            _onItemTapped(value);
                                          },
                                          controller: _tabController,
                                          labelStyle: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          labelColor: Colors.black,
                                          isScrollable: true,
                                          indicatorSize:
                                              TabBarIndicatorSize.tab,
                                          tabs: List.generate(
                                            items.length,
                                            (index) => Tab(
                                              text: index == 0
                                                  ? mandirDetails?.mandirName ??
                                                      ""
                                                  : items[index],
                                            ),
                                          ))),
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget buildListItem(int index) {
    return whiteContainer(
      Container(
        key: GlobalKey(),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black54)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: index == 0
                    ? mandirDetails?.mandirName ?? "Temple"
                    : items[index],
                fontSize: 14.sp,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w600,
              ).paddingOnly(bottom: 12),
              index == 0
                  ? buildItemAt0()
                  : index == 1
                      ? buildItemAt1()
                      : index == 2
                          ? buildItemAt2()
                          : index == 3
                              ? CustomText(
                                  text: mandirDetails?.yatraparchi ?? "",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.start,
                                  color: AppColors.black_color_1,
                                ).paddingOnly(
                                  right: 8.w,
                                )
                              : index == 4
                                  ? CustomText(
                                      text: mandirDetails?.trackdistaance ?? "",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      textAlign: TextAlign.start,
                                      color: AppColors.black_color_1,
                                    ).paddingOnly(
                                      right: 8.w,
                                    )
                                  : index == 5
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CustomText(
                                                        text: "Peak Months",
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textAlign:
                                                            TextAlign.start,
                                                        color: AppColors
                                                            .lightBlueK,
                                                      ).paddingOnly(
                                                        right: 8.w,
                                                      ),
                                                      CustomText(
                                                        text: "(Approx)",
                                                        fontSize: 8.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textAlign:
                                                            TextAlign.start,
                                                        color: AppColors
                                                            .black_color_1,
                                                      )
                                                    ],
                                                  ).paddingOnly(
                                                    bottom: 5.w,
                                                  ),
                                                  CustomText(
                                                    text: mandirDetails
                                                            ?.peakmonth ??
                                                        "",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    textAlign: TextAlign.start,
                                                    color:
                                                        AppColors.black_color_1,
                                                  ).paddingOnly(
                                                    right: 8.w,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CustomText(
                                                        text: "Off-Peak Months",
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textAlign:
                                                            TextAlign.start,
                                                        color: AppColors
                                                            .lightBlueK,
                                                      ).paddingOnly(
                                                        right: 8.w,
                                                      ),
                                                      CustomText(
                                                        text: "(Approx)",
                                                        fontSize: 8.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textAlign:
                                                            TextAlign.start,
                                                        color: AppColors
                                                            .black_color_1,
                                                      )
                                                    ],
                                                  ).paddingOnly(
                                                    bottom: 5.h,
                                                  ),
                                                  CustomText(
                                                    text: mandirDetails
                                                            ?.offpeakmonth ??
                                                        "",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    textAlign: TextAlign.start,
                                                    color:
                                                        AppColors.black_color_1,
                                                  ).paddingOnly(
                                                    right: 8.w,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : index == 6
                                          ? CustomText(
                                              text: mandirDetails
                                                      ?.tempraturemonth ??
                                                  "",
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              textAlign: TextAlign.start,
                                              color: AppColors.black_color_1,
                                            ).paddingOnly(
                                              right: 8.w,
                                            )
                                          : index == 7
                                              ? Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CustomText(
                                                              text: "Hotels",
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              color: AppColors
                                                                  .lightBlueK,
                                                            )
                                                                .paddingOnly(
                                                                  right: 8.w,
                                                                )
                                                                .paddingOnly(
                                                                  bottom: 5.h,
                                                                ),
                                                            SizedBox(
                                                              height: 36.h,
                                                              width: 305.w,
                                                              child: CustomText(
                                                                text: mandirDetails
                                                                        ?.hotel ??
                                                                    "",
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                color: AppColors
                                                                    .darkBlue,
                                                              ).paddingOnly(
                                                                right: 8.w,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ).paddingOnly(
                                                      bottom: 18.h,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CustomText(
                                                              text:
                                                                  "Dharamshala",
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              color: AppColors
                                                                  .lightBlueK,
                                                            )
                                                                .paddingOnly(
                                                                  right: 8.w,
                                                                )
                                                                .paddingOnly(
                                                                  bottom: 5.h,
                                                                ),
                                                            SizedBox(
                                                              width: 305.w,
                                                              child: CustomText(
                                                                text: mandirDetails
                                                                        ?.dharamshala ??
                                                                    "",
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                color: AppColors
                                                                    .darkBlue,
                                                              ).paddingOnly(
                                                                right: 8.w,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ).paddingOnly(
                                                      bottom: 18.h,
                                                    ),
                                                  ],
                                                )
                                              : index == 8
                                                  ? CustomText(
                                                      text: mandirDetails
                                                              ?.openTime ??
                                                          "",
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      textAlign:
                                                          TextAlign.start,
                                                      color: AppColors
                                                          .black_color_1,
                                                    ).paddingOnly(
                                                      right: 8.w,
                                                    )
                                                  : index == 9
                                                      ? CustomText(
                                                          text: mandirDetails
                                                                  ?.dresscode ??
                                                              "",
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          textAlign:
                                                              TextAlign.start,
                                                          color: AppColors
                                                              .black_color_1,
                                                        ).paddingOnly(
                                                          right: 8.w,
                                                        )
                                                      : index == 10
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    CustomText(
                                                                      text:
                                                                          "Entry Gate",
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      color: AppColors
                                                                          .lightBlueK,
                                                                    ).paddingOnly(
                                                                      right:
                                                                          8.w,
                                                                      bottom:
                                                                          5.h,
                                                                    ),
                                                                    CustomText(
                                                                      text: mandirDetails
                                                                              ?.entryGate ??
                                                                          "",
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      color: AppColors
                                                                          .black_color_1,
                                                                    ).paddingOnly(
                                                                      right:
                                                                          8.w,
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    CustomText(
                                                                      text:
                                                                          "Exit Gate",
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      color: AppColors
                                                                          .lightBlueK,
                                                                    ).paddingOnly(
                                                                      right:
                                                                          8.w,
                                                                      bottom:
                                                                          5.h,
                                                                    ),
                                                                    CustomText(
                                                                      text: mandirDetails
                                                                              ?.exitGate ??
                                                                          "",
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      color: AppColors
                                                                          .black_color_1,
                                                                    ).paddingOnly(
                                                                      right:
                                                                          8.w,
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            )
                                                          : SizedBox(),
            ],
          ),
        ),
      ),
    ).paddingOnly(
      left: 10.w,
      right: 10.w,
      top: 5.h,
      bottom: 5.h,
    );
  }

  Column buildItemAt2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Flight",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  color: AppColors.lightBlueK,
                ).paddingOnly(
                  bottom: 4.h,
                ),
                CustomText(
                  text: mandirDetails?.flight ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
          ],
        ).paddingOnly(
          bottom: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Train",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  color: AppColors.lightBlueK,
                ).paddingOnly(
                  bottom: 5.h,
                  right: 8.w,
                ),
                CustomText(
                  text: mandirDetails?.train ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
          ],
        ).paddingOnly(
          bottom: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Bus",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  color: AppColors.lightBlueK,
                )
                    .paddingOnly(
                      right: 8.w,
                    )
                    .paddingOnly(
                      bottom: 5.h,
                    ),
                CustomText(
                  text: mandirDetails?.bus ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
          ],
        ).paddingOnly(
          bottom: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Auto Rickshaw",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  color: AppColors.lightBlueK,
                )
                    .paddingOnly(
                      right: 8.w,
                    )
                    .paddingOnly(
                      bottom: 5.h,
                    ),
                CustomText(
                  text: mandirDetails?.autorickshow ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
          ],
        ).paddingOnly(
          bottom: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Private Taxi",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  color: AppColors.lightBlueK,
                )
                    .paddingOnly(
                      right: 8.w,
                    )
                    .paddingOnly(
                      bottom: 5.h,
                    ),
                CustomText(
                  text: mandirDetails?.privatetaxi ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
          ],
        ).paddingOnly(
          bottom: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Ola / Uber",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  color: AppColors.lightBlueK,
                )
                    .paddingOnly(
                      right: 8.w,
                    )
                    .paddingOnly(
                      bottom: 5.h,
                    ),
                CustomText(
                  text: mandirDetails?.ola ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
          ],
        ).paddingOnly(
          bottom: 18.h,
        ),
      ],
    );
  }

  Column buildItemAt1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textAlign: TextAlign.start,
          text: "Devotees can visit the temple throughout the year",
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ).paddingOnly(
          bottom: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Best Time",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  color: AppColors.lightBlueK,
                ).paddingOnly(
                  bottom: 4.h,
                ),
                CustomText(
                  text: mandirDetails?.bestTime ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  text: "Off-Pick Time",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  color: AppColors.lightBlueK,
                ).paddingOnly(
                  bottom: 4.h,
                ),
                CustomText(
                  text: mandirDetails?.offPeakTime ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
          ],
        ).paddingOnly(
          bottom: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Peak Time",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                    color: AppColors.lightBlueK,
                  ).paddingOnly(
                    bottom: 4.h,
                  ),
                  CustomText(
                    text: mandirDetails?.peakTime ?? "",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                    color: AppColors.darkBlue,
                  ).paddingOnly(
                    right: 8.w,
                  ),
                ],
              ),
            ),
          ],
        ).paddingOnly(
          bottom: 18.h,
        ),
      ],
    );
  }

  Column buildItemAt0() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "Temple Timings",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                      color: AppColors.lightBlueK,
                    ).paddingOnly(
                      right: 8.w,
                    ),
                    CustomImage(
                      image: "",
                      // Replace with actual image path or URL
                      placeholder: ImageConstant.timing,
                      fit: BoxFit.fill,
                      height: 13.48.h,
                      width: 12.75.w,
                    ),
                  ],
                ).paddingOnly(
                  bottom: 4.h,
                ),
                CustomText(
                  text: mandirDetails?.templeTimeOne ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "Deity",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                      color: AppColors.lightBlueK,
                    ).paddingOnly(
                      right: 8.w,
                    ),
                    CustomImage(
                      image: "",
                      // Replace with actual image path or URL
                      placeholder: ImageConstant.mandir_deity,
                      fit: BoxFit.fill,
                      height: 13.48.h,
                      width: 12.75.w,
                    ),
                  ],
                ).paddingOnly(
                  bottom: 4.h,
                ),
                CustomText(
                  text: mandirDetails?.deity ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
          ],
        ).paddingOnly(
          bottom: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "Location",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                      color: AppColors.lightBlueK,
                    ).paddingOnly(
                      right: 8.w,
                    ),
                    CustomImage(
                      image: "",
                      // Replace with actual image path or URL
                      placeholder: ImageConstant.mandir_location,
                      fit: BoxFit.fill,
                      height: 13.48.h,
                      width: 12.75.w,
                    ),
                  ],
                ).paddingOnly(
                  bottom: 4.h,
                ),
                CustomText(
                  text: mandirDetails?.mandirlocation ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "Best Time to Visit",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                      color: AppColors.lightBlueK,
                    ).paddingOnly(
                      right: 8.w,
                    ),
                    CustomImage(
                      image: "",
                      // Replace with actual image path or URL
                      placeholder: ImageConstant.mandir_bestTime,
                      fit: BoxFit.fill,
                      height: 13.48.h,
                      width: 12.75.w,
                    ),
                  ],
                ).paddingOnly(
                  bottom: 4.h,
                ),
                CustomText(
                  text: mandirDetails?.bestTime ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
          ],
        ).paddingOnly(
          bottom: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "Nearest Airport",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                      color: AppColors.lightBlueK,
                    ).paddingOnly(
                      right: 8.w,
                    ),
                    CustomImage(
                      image: "",
                      // Replace with actual image path or URL
                      placeholder: ImageConstant.mandir_airport,
                      fit: BoxFit.fill,
                      height: 13.48.h,
                      width: 12.75.w,
                    ),
                  ],
                ).paddingOnly(
                  bottom: 4.h,
                ),
                CustomText(
                  text: mandirDetails?.nearestairport ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "Priority Darshan",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                      color: AppColors.lightBlueK,
                    ).paddingOnly(
                      right: 8.w,
                    ),
                    CustomImage(
                      image: "",
                      // Replace with actual image path or URL
                      placeholder: ImageConstant.mandir_vip_darshan,
                      fit: BoxFit.fill,
                      height: 13.48.h,
                      width: 12.75.w,
                    ),
                  ],
                ).paddingOnly(
                  bottom: 4.h,
                ),
                CustomText(
                  text: "Available",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
          ],
        ).paddingOnly(
          bottom: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "Nearest Railway Station",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                      color: AppColors.lightBlueK,
                    ).paddingOnly(
                      right: 8.w,
                    ),
                    CustomImage(
                      image: "",
                      // Replace with actual image path or URL
                      placeholder: ImageConstant.mandir_nearst_railway,
                      fit: BoxFit.fill,
                      height: 13.48.h,
                      width: 12.75.w,
                    ),
                  ],
                ).paddingOnly(
                  bottom: 4.h,
                ),
                CustomText(
                  text: mandirDetails?.nearestrailway ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
          ],
        ).paddingOnly(
          bottom: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "Nearest Parking",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                      color: AppColors.lightBlueK,
                    ).paddingOnly(
                      right: 8.w,
                    ),
                    CustomImage(
                      image: "",
                      // Replace with actual image path or URL
                      placeholder: ImageConstant.mandir_nearst_parking,
                      fit: BoxFit.fill,
                      height: 13.48.h,
                      width: 12.75.w,
                    ),
                  ],
                ).paddingOnly(
                  bottom: 4.h,
                ),
                CustomText(
                  text: mandirDetails?.nearestparking ?? "",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: AppColors.darkBlue,
                ).paddingOnly(
                  right: 8.w,
                ),
              ],
            ),
          ],
        ).paddingOnly(
          bottom: 18.h,
        ),
      ],
    );
  }

  Widget topContainer({required String image}) {
    return Stack(
      children: [
        CustomImage(
          image: image,
          // Replace with actual image path or URL
          placeholder: "",
        ),
        Positioned(left: 10.w, top: 10.h, child: SafeArea(child: backButton())),
        Positioned(
            right: 10.w, top: 10.h, child: SafeArea(child: shareButton())),
        Positioned(
            left: 10,
            top: 30,
            bottom: 0,
            child: InkWell(
                onTap: () {
                  previousPage();
                },
                child: Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white))),
        Positioned(
            right: 10,
            top: 30,
            bottom: 0,
            child: InkWell(
                onTap: () {
                  nextPage();
                },
                child: Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.white))),
        Positioned(
          bottom: 0,
          child: Container(
            width: Get.width,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
