import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/screen/rent_a_locker_detail.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/app_colors.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';

import 'my_booking.dart';

class Terms_Conditions extends StatefulWidget {
  const Terms_Conditions({super.key});

  @override
  State<Terms_Conditions> createState() => _Terms_ConditionsState();
}

class _Terms_ConditionsState extends State<Terms_Conditions> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Terms & Conditions',
            fontSize: 16.sp,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w700,
          ),
          tnc('Acceptance of Terms'),
          tnc2(
              'By using the rent a locker service from Saasbox Technologies, you agree to comply with and be bound by these terms and conditions.'),
          tnc('Locker Usage'),
          tnc2(
              "The lockers can be booked up to 30 days in advance and will be available during the temple's opening hours. Users can reserve additional lockers as needed."),
          tnc('Items Allowed in Smart Lockers'),
          tnc2(
              "Lockers can accommodate various items and personal belongings according to temple rules."),
          tnc('Access Code'),
          tnc2(
              "Users will receive a unique booking ID and a QR code to operate the locker. Access codes must be kept confidential to avoid any unauthorised use."),
          tnc('Booking Modification'),
          tnc2(
              "Users can modify their bookings until one hour before its commencement."),
          tnc('Booking Cancellation'),
          tnc2(
              "No cancellation option exists at this stage. No-shows due to late arrival or any unavoidable circumstances will be the user's responsibility."),
          tnc('Prohibited Items'),
          tnc2(
              "Users must not store items that are illegal, hazardous, or prohibited by law. The mandir authority reserves the right to inspect lockers and remove any prohibited items."),
          tnc('Termination of Usage'),
          tnc2(
              "The authority reserves the right to terminate a usage agreement for violation of these terms. Users may terminate their usage at any time."),
          tnc('Changes to Terms'),
          tnc2(
              "The company may update these terms, and users will be notified of any changes."),
          Padding(
            padding: EdgeInsets.only(
              top: 6.h,
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  child: Checkbox(
                    activeColor: AppColors.darkBlue,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                ),
                CustomText(
                  text: 'I agree with the ',
                  fontSize: 12.sp,
                  color: AppColors.darkBlue,
                ),
                CustomText(
                  text: 'Terms & Conditions',
                  fontSize: 12.sp,
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 45.21.h,
                    width: 146.51.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border:
                            Border.all(width: 2, color: AppColors.darkBlue)),
                    child: Center(
                      child: CustomText(
                        text: 'Cancel',
                        fontSize: 16.sp,
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (isChecked) {
                      Get.back();
                      Get.toNamed(
                        RouteName.rent_a_locker_detail,
                      );
                    } else {
                      showToastMsg("Please check Term and condition");
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 45.21.h,
                    width: 146.51.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Next',
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
