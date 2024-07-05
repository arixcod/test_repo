import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mandirwiki/screen/terms_conditions.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/custom_component/custom_button.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import 'package:mandirwiki/util/image_constant.dart';
import '../util/app_colors.dart';

class RentALockerBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomText(
                    text: 'Rent a Locker',
                    fontSize: 16.sp,
                    fontWeight:
                        FontWeight.w700, // You can specify the font weight
                  ),
                  Spacer(),
                  Container(
                    height: 17.h,
                    width: 70.w,
                    margin: EdgeInsets.only(
                      right: 8.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12.5.r,
                      ),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Tutorial',
                        color: Colors.white,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Center(
                    child: Image.asset(
                      ImageConstant.lock,
                      height: 265.55.h,
                      width: 260.w,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomText(
                    text: 'Store Your Items with',
                    fontSize: 12.sp,
                    color: AppColors.darkBlue,
                    fontWeight:
                        FontWeight.w500, // You can specify the font weight
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Smart Lockers ',
                        fontSize: 20.sp,
                        fontWeight:
                            FontWeight.w700, // You can specify the font weight
                      ),
                      CustomText(
                        text: 'on the go',
                        fontSize: 20.sp,
                        fontWeight:
                            FontWeight.w500, // You can specify the font weight
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  button(
                    text: 'Next',
                    onTap: () {
                      showCustomBottomSheet(context, Terms_Conditions());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
