// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:mandirwiki/controller/my_booking_controller.dart';
// import 'package:mandirwiki/screen/widget/custom_image.dart';
// import 'package:mandirwiki/screen/widget/reuseable.dart';
// import 'package:mandirwiki/util/app_colors.dart';
// import 'package:mandirwiki/util/custom_component/custom_button.dart';
// import 'package:mandirwiki/util/custom_component/custom_text.dart';
// import 'package:mandirwiki/util/image_constant.dart';
// import 'package:qr_flutter/qr_flutter.dart';
//
// class MyBookingBottomNav extends GetView<MyBookingController> {
//   const MyBookingBottomNav({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return customScaffold(
//       SafeArea(
//         child: DefaultTabController(
//           length: 2,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                   backButton(),
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                   CustomText(
//                     text: 'My Locker',
//                     fontSize: 16.sp,
//                     fontWeight:
//                         FontWeight.w700, // You can specify the font weight
//                   ),
//                   Spacer(),
//                 ],
//               ),
//               Obx(() {
//                 return Container(
//                   margin: EdgeInsets.only(
//                     top: 10.h,
//                     left: 10.w,
//                     right: 10.w,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.transparent),
//                     color: Colors.white,
//                   ),
//                   height: 49.3.h,
//                   child: TabBar(
//                     physics: const NeverScrollableScrollPhysics(),
//                     isScrollable: false,
//                     indicatorColor: Colors.transparent,
//                     indicatorSize: TabBarIndicatorSize.tab,
//                     indicatorWeight: 0.0,
//                     onTap: (index) {
//                       controller.changeTabIndex(index);
//                       print(index);
//                     },
//                     indicator: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                           10.r,
//                         ), // Creates border
//                         color: Colors.black),
//                     tabs: [
//                       Tab(
//                           child: CustomText(
//                         text: "Current ",
//                         fontSize: 10.sp,
//                         fontWeight: FontWeight.w400,
//                         color: controller.tabIndex.value == 0
//                             ? Colors.white
//                             : Colors.black,
//                       )),
//                       Tab(
//                         child: CustomText(
//                           text: "Complete",
//                           fontSize: 10.sp,
//                           fontWeight: FontWeight.w400,
//                           color: controller.tabIndex.value == 0
//                               ? Colors.black
//                               : Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//               Expanded(
//                 child: TabBarView(
//                     physics: const NeverScrollableScrollPhysics(),
//                     children: [
//                       RefreshIndicator(
//                         onRefresh: () {
//                           return controller.myLockerAPI();
//                         },
//                         child: Obx(() {
//                           return controller.isLoadingLocker.value
//                               ? Center(child: CircularProgressIndicator())
//                               : SizedBox(
//                                   height: Get.height,
//                                   child: ListView.builder(
//                                       itemCount: controller.myLockerData.length,
//                                       itemBuilder: (context, index) {
//                                         return controller.myLockerData[index]
//                                                     .status ==
//                                                 "Active"
//                                             ? Padding(
//                                                 padding: EdgeInsets.all(
//                                                   8.r,
//                                                 ),
//                                                 child: whiteContainer(
//                                                   Container(
//                                                     margin: EdgeInsets.only(
//                                                       left: 15.w,
//                                                       top: 10.h,
//                                                     ),
//                                                     padding: EdgeInsets.only(
//                                                       right: 15.w,
//                                                     ),
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         CustomText(
//                                                           text:
//                                                               'Booking ID  : ${controller.myLockerData[index].bookingId}',
//                                                           fontSize: 12.sp,
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                           color: AppColors
//                                                               .kPrimaryColor2,
//                                                         ),
//                                                         SizedBox(
//                                                           height: 10.h,
//                                                         ),
//                                                         Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceBetween,
//                                                           children: [
//                                                             Column(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 SizedBox(
//                                                                   height:
//                                                                       19.55.h,
//                                                                   width:
//                                                                       151.3.w,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       CustomText(
//                                                                         text:
//                                                                             'Name : ',
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                       ),
//                                                                       Spacer(),
//                                                                       CustomText(
//                                                                         text: controller.myLockerData[index].name ??
//                                                                             "",
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height:
//                                                                       19.55.h,
//                                                                   width:
//                                                                       144.5.w,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       CustomText(
//                                                                         text:
//                                                                             'Mobile: ',
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                       ),
//                                                                       Spacer(),
//                                                                       CustomText(
//                                                                         text: controller
//                                                                             .myLockerData[index]
//                                                                             .mobile
//                                                                             .toString(),
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height:
//                                                                       19.55.h,
//                                                                   width:
//                                                                       145.35.w,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       CustomText(
//                                                                         text:
//                                                                             'Locker Name: ',
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                       ),
//                                                                       Spacer(),
//                                                                       CustomText(
//                                                                         text: controller.myLockerData[index].lockerName ??
//                                                                             "",
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                             Column(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 SizedBox(
//                                                                   height:
//                                                                       19.55.h,
//                                                                   width:
//                                                                       114.75.w,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       CustomText(
//                                                                         text:
//                                                                             'Date: ',
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                       ),
//                                                                       CustomText(
//                                                                         text: DateFormat("dd/MM/yyyy").format(DateTime.parse(controller.myLockerData[index].bookingDate ??
//                                                                             "")),
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height:
//                                                                       19.55.h,
//                                                                   width:
//                                                                       117.6.w,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       CustomText(
//                                                                         text:
//                                                                             'Slot: ',
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                       ),
//                                                                       Spacer(),
//                                                                       CustomText(
//                                                                         text: controller.myLockerData[index].slot ??
//                                                                             "",
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height:
//                                                                       19.55.h,
//                                                                   width: 88.4.w,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       CustomText(
//                                                                         text:
//                                                                             'Locker Qty.: ',
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                       ),
//                                                                       Spacer(),
//                                                                       CustomText(
//                                                                         text: controller
//                                                                             .myLockerData[index]
//                                                                             .lockerQty
//                                                                             .toString(),
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         SizedBox(
//                                                           height: 15.h,
//                                                         ),
//                                                         Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .center,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .center,
//                                                           children: [
//                                                             Container(
//                                                               height: 25.5.h,
//                                                               width: 25.5.h,
//                                                               padding:
//                                                                   EdgeInsets
//                                                                       .all(
//                                                                           10.r),
//                                                               decoration: BoxDecoration(
//                                                                   color: AppColors
//                                                                       .black_color_1,
//                                                                   shape: BoxShape
//                                                                       .circle),
//                                                               child:
//                                                                   CustomImage(
//                                                                 image: "",
//                                                                 placeholder:
//                                                                     ImageConstant
//                                                                         .left,
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 150.h,
//                                                               width: 172.w,
//                                                               child: ListView
//                                                                   .builder(
//                                                                 controller:
//                                                                     controller
//                                                                         .scrollController
//                                                                         .value,
//                                                                 // physics:
//                                                                 //     const NeverScrollableScrollPhysics(),
//                                                                 itemCount: controller
//                                                                     .myLockerData[
//                                                                         index]
//                                                                     .lockerNo
//                                                                     ?.length,
//                                                                 scrollDirection:
//                                                                     Axis.horizontal,
//                                                                 itemBuilder:
//                                                                     (BuildContext
//                                                                             context,
//                                                                         int qrIndex) {
//                                                                   return Column(
//                                                                     children: [
//                                                                       Align(
//                                                                         alignment:
//                                                                             Alignment.bottomCenter,
//                                                                         child:
//                                                                             CustomText(
//                                                                           text:
//                                                                           'Locker No. ${controller.myLockerData[index].slot?[qrIndex]}',
//                                                                           fontSize:
//                                                                               15.sp,
//                                                                           fontWeight:
//                                                                               FontWeight.w700,
//                                                                           color:
//                                                                               AppColors.lightBlueK,
//                                                                         ),
//                                                                       ),
//                                                                       SizedBox(
//                                                                         height:
//                                                                             10.h,
//                                                                       ),
//                                                                       Align(
//                                                                         alignment:
//                                                                             Alignment.bottomCenter,
//                                                                         child:
//                                                                             Container(
//                                                                           decoration:
//                                                                               BoxDecoration(
//                                                                             borderRadius:
//                                                                                 BorderRadius.circular(
//                                                                               16.r,
//                                                                             ),
//                                                                             border:
//                                                                                 Border.all(
//                                                                               width: 1.w,
//                                                                               color: Colors.black,
//                                                                             ),
//                                                                           ),
//                                                                           child:
//                                                                               QrImageView(
//                                                                             data:
//                                                                                 'Booking ID:${controller.myLockerData[index].bookingId ?? ""}\nName:${controller.myLockerData[index].name ?? ""}\nMobile: ${controller.myLockerData[index].mobile.toString()}\n Locker name: ${controller.myLockerData[index].lockerName ?? ""}\nDate Of Booking: ${DateFormat("dd/MM/yyyy").format(DateTime.parse(controller.myLockerData[index].bookingDate ?? ""))}\nTime Slot: ${controller.myLockerData[index].slot ?? ""}\nLocker Quantity: ${controller.myLockerData[index].lockerQty.toString()}\nLocker No. ${qrIndex + 1}',
//                                                                             version:
//                                                                                 QrVersions.auto,
//                                                                             size:
//                                                                                 121.55.r,
//                                                                             gapless:
//                                                                                 false,
//                                                                             embeddedImageStyle:
//                                                                                 QrEmbeddedImageStyle(
//                                                                               size: Size(
//                                                                                 80.w,
//                                                                                 80.h,
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                                   ).paddingOnly(
//                                                                     left: 20.w,
//                                                                     right: 20.w,
//                                                                   );
//                                                                 },
//                                                               ),
//                                                             ),
//                                                             Container(
//                                                               height: 25.5.h,
//                                                               width: 25.5.h,
//                                                               padding:
//                                                                   EdgeInsets
//                                                                       .all(
//                                                                           10.r),
//                                                               decoration: BoxDecoration(
//                                                                   color: AppColors
//                                                                       .black_color_1,
//                                                                   shape: BoxShape
//                                                                       .circle),
//                                                               child:
//                                                                   CustomImage(
//                                                                 image: "",
//                                                                 placeholder:
//                                                                     ImageConstant
//                                                                         .right,
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         SizedBox(
//                                                           height: 10.h,
//                                                         ),
//                                                         Align(
//                                                           alignment: Alignment
//                                                               .bottomCenter,
//                                                           child: CustomText(
//                                                             text:
//                                                                 'Scan the QR Code by Locker Volunteer',
//                                                             fontSize: 12.sp,
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           height: 20.h,
//                                                         ),
//                                                         button(
//                                                           text: 'Edit',
//                                                           onTap: () {},
//                                                         ).paddingOnly(
//                                                           left: 85.w,
//                                                           right: 80.w,
//                                                         ),
//                                                         SizedBox(
//                                                           height: 20.h,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               )
//                                             : SizedBox();
//                                       }),
//                                 );
//                         }),
//                       ),
//                       RefreshIndicator(
//                         onRefresh: () {
//                           return controller.myLockerAPI();
//                         },
//                         child: Obx(() {
//                           return controller.isLoadingLocker.value
//                               ? Center(child: CircularProgressIndicator())
//                               : SizedBox(
//                                   height: 150.h,
//                                   child: ListView.builder(
//                                       itemCount: controller.myLockerData.length,
//                                       itemBuilder: (context, index) {
//                                         return controller.myLockerData[index]
//                                                     .status ==
//                                                 "Completed"
//                                             ? Padding(
//                                                 padding: EdgeInsets.all(
//                                                   8.r,
//                                                 ),
//                                                 child: whiteContainer(
//                                                   Container(
//                                                     margin: EdgeInsets.only(
//                                                       left: 15.w,
//                                                       top: 10.h,
//                                                     ),
//                                                     padding: EdgeInsets.only(
//                                                       right: 15.w,
//                                                     ),
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         CustomText(
//                                                           text:
//                                                               'Booking ID  : ${controller.myLockerData[index].bookingId}',
//                                                           fontSize: 12.sp,
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                           color: AppColors
//                                                               .kPrimaryColor2,
//                                                         ),
//                                                         SizedBox(
//                                                           height: 10.h,
//                                                         ),
//                                                         Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceBetween,
//                                                           children: [
//                                                             Column(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 SizedBox(
//                                                                   height:
//                                                                       19.55.h,
//                                                                   width:
//                                                                       151.3.w,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       CustomText(
//                                                                         text:
//                                                                             'Date : ',
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                       ),
//                                                                       Spacer(),
//                                                                       CustomText(
//                                                                         text: DateFormat("dd/MM/yyyy").format(DateTime.parse(controller.myLockerData[index].bookingDate ??
//                                                                             "")),
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height:
//                                                                       19.55.h,
//                                                                   width:
//                                                                       131.3.w,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       CustomText(
//                                                                         text:
//                                                                             'Check In : ',
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                       ),
//                                                                       Spacer(),
//                                                                       CustomText(
//                                                                         text:
//                                                                             "02:50 PM",
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height:
//                                                                       19.55.h,
//                                                                   width:
//                                                                       133.3.w,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       CustomText(
//                                                                         text:
//                                                                             'Check Out : ',
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                       ),
//                                                                       Spacer(),
//                                                                       CustomText(
//                                                                         text:
//                                                                             "06:30 PM",
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                             Column(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 SizedBox(
//                                                                   height:
//                                                                       19.55.h,
//                                                                   width:
//                                                                       109.65.w,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       CustomText(
//                                                                         text:
//                                                                             'Slot: ',
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                       ),
//                                                                       CustomText(
//                                                                         text: controller.myLockerData[index].slot ??
//                                                                             "",
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height:
//                                                                       19.55.h,
//                                                                   width: 98.6.w,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       CustomText(
//                                                                         text:
//                                                                             'Charges: ',
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                       ),
//                                                                       Spacer(),
//                                                                       CustomText(
//                                                                         text:
//                                                                             "Rs 40",
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w400,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height:
//                                                                       19.55.h,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       CustomText(
//                                                                         text:
//                                                                             'Status: ',
//                                                                         fontSize:
//                                                                             12.sp,
//                                                                         fontWeight:
//                                                                             FontWeight.w500,
//                                                                       ),
//                                                                       CustomImage(
//                                                                         image:
//                                                                             "",
//                                                                         // Replace with actual image path or URL
//                                                                         placeholder:
//                                                                             ImageConstant.check,
//                                                                         fit: BoxFit
//                                                                             .fill,
//                                                                         height:
//                                                                             7.h,
//                                                                         width:
//                                                                             12.w,
//                                                                         radius:
//                                                                             2.25.r,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         SizedBox(
//                                                           height: 20.h,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               )
//                                             : SizedBox();
//                                       }),
//                                 );
//                         }),
//                       ),
//                     ]),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
