import 'dart:io';

import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/home_controller.dart';
import 'package:mandirwiki/screen/blog_bottom_nav_bar.dart';
import 'package:mandirwiki/screen/home_page.dart';
import 'package:mandirwiki/screen/my_booking.dart';
import 'package:mandirwiki/screen/my_booking_bottom_nav.dart';
import 'package:mandirwiki/screen/my_wishList_bottom_nav.dart';
import 'package:mandirwiki/screen/my_wishlist.dart';
import 'package:mandirwiki/screen/rent_locker.dart';
import 'package:mandirwiki/screen/rent_locker_bottom_nav.dart';
import 'package:mandirwiki/screen/samay_bottom_nav_bar.dart';
import 'package:mandirwiki/screen/scan_qr_screen_bottom_nav.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/app_colors.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';

enum SelectedIcon { favorite, share, indicator, reels, chat }

class CustomBottomBar extends StatefulWidget {
  final Function(SelectedIcon) onIconSelected; // Callback function

  const CustomBottomBar({Key? key, required this.onIconSelected})
      : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  SelectedIcon _selectedIcon = SelectedIcon.favorite; // Initially selected icon

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.darkBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildIconButton(
            iconPath: 'assets/images/home.svg',
            selected: _selectedIcon == SelectedIcon.favorite,
            onPressed: () {
              widget.onIconSelected(SelectedIcon.favorite); // Callback
              setState(() {
                _selectedIcon = SelectedIcon.favorite;
              });
            },
            text: 'Home',
          ),
          buildIconButton(
            iconPath: 'assets/images/scan.svg',
            selected: _selectedIcon == SelectedIcon.indicator,
            onPressed: () {
              widget.onIconSelected(SelectedIcon.indicator); // Callback
              setState(() {
                _selectedIcon = SelectedIcon.indicator;
              });
            },
            text: 'Scan QR',
          ),
          buildIconButton(
            iconPath: 'assets/images/locker.svg',
            selected: _selectedIcon == SelectedIcon.reels,
            onPressed: () {
              widget.onIconSelected(SelectedIcon.reels); // Callback
              setState(() {
                _selectedIcon = SelectedIcon.reels;
              });
            },
            text: 'Locker',
          ),
          buildIconButton(
            iconPath: 'assets/images/blog.svg',
            selected: _selectedIcon == SelectedIcon.chat,
            onPressed: () {
              widget.onIconSelected(SelectedIcon.chat); // Callback
              setState(() {
                _selectedIcon = SelectedIcon.chat;
              });
            },
            text: 'Blogs',
          ),
          buildIconButton(
            iconPath: 'assets/images/samay.svg',
            selected: _selectedIcon == SelectedIcon.share,
            onPressed: () {
              widget.onIconSelected(SelectedIcon.share); // Callback
              setState(() {
                _selectedIcon = SelectedIcon.share;
              });
            },
            text: 'Samay',
          ),
        ],
      ),
    );
  }

  Widget buildIconButton({
    required String iconPath,
    required String text,
    required bool selected,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: 5.h,
      ),
      decoration: selected
          ? BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  6.r,
                ),
              ),
              color:
                  selected ? Colors.white.withOpacity(.10) : Colors.transparent,
            )
          : const BoxDecoration(),
      child: Column(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              iconPath,
              width: 21.12.h,
              height: 21.12.h,
            ),
            onPressed: onPressed,
          ),
          CustomText(
            text: text,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class BottomNavigation extends GetView<HomePageController> {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleTapToExit(
        child: Obx(() {
          return getContentForSelectedIcon();
        }),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: CustomBottomBar(
          onIconSelected: (icon) {
            controller.selectedIcon.value = icon;
          },
        ),
      ),
    );
  }

  Widget getContentForSelectedIcon() {
    switch (controller.selectedIcon.value) {
      case SelectedIcon.favorite:
        return HomePage();
      case SelectedIcon.share:
        return SamayBottomNavBar();
      case SelectedIcon.reels:
        return RentALockerBottomNav();
      case SelectedIcon.chat:
        return BlogBottomNavBar();
      case SelectedIcon.indicator:
        return ScanQRScreenBottomNav();
    }
  }
}
