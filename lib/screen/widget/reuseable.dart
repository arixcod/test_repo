import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import '../../util/app_colors.dart';

showToastMsg(String msg, {Color color = Colors.red}) => Fluttertoast.showToast(
    gravity: ToastGravity.BOTTOM,
    msg: msg,
    backgroundColor: AppColors.kPrimaryColor,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 2);

void showCustomBottomSheet(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            20.r,
          ),
        ),
        child: Container(
            height: Get.height * 0.8,
            width: double.infinity,
            padding: EdgeInsets.all(
              20.r,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('assets/images/container.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: widget

            // Platinum()
            ),
      );
    },
  );
}

Future<void> share() async {
  await FlutterShare.share(
    title: 'Mandir wiki',
    text:
        'Discover the rich history and details of the mandirs I visit with Mandir Wiki! Check out this exclusive',
    linkUrl: 'https://www.mandir.wiki/',
  );
}

Widget shareButton({bool isWhite = false}) => GestureDetector(
      onTap: () {
        share();
      },
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.r,
          ),
        ),
        child: Container(
          height: 30.h,
          width: 30.h,
          decoration: BoxDecoration(
            color: Color(
              0xffD9D9D9,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.r,
              ),
            ),
            border: Border.all(
              color: Colors.white,
              width: 1.w,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/images/share.svg',
              height: 18.h,
              width: 18.h,
            ),
          ),
        ),
      ),
    );

OutlineInputBorder outlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(
    10.r,
  ),
  borderSide: BorderSide(
    color: AppColors.darkBlue,
  ),
);

Widget searchDropdown(
        {required List<dynamic> dataList,
        label,
        onTap,
        initialValue = null,
        required bool showSearchBox}) =>
    Stack(
      alignment: Alignment.centerRight,
      children: [
        DropdownSearch<dynamic>(
          autoValidateMode: AutovalidateMode.onUserInteraction,
          //selectedItem: initialValue,
          items: dataList,
          onChanged: onTap,

          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: GoogleFonts.poppins().copyWith(
              color: Colors.black,
              fontSize: 14.sp,
            ),
            dropdownSearchDecoration: InputDecoration(
              focusedErrorBorder: outlineBorder,
              //hintText: label,
              suffixIconColor: Colors.transparent,
              // hintStyle:GoogleFonts.poppins().copyWith(color: Colors.black, fontSize: 14),
              //  label: Text(label),
              labelText: label, alignLabelWithHint: true,
              labelStyle: GoogleFonts.poppins().copyWith(
                fontSize: 12.sp,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 8.h,
              ),
              fillColor: Colors.transparent,
              border: outlineBorder,
              errorBorder: outlineBorder,
              focusedBorder: outlineBorder,
              enabledBorder: outlineBorder,
            ),
          ),
          popupProps: PopupProps.menu(
            constraints: BoxConstraints.expand(
              height: 200.h,
            ),
            searchFieldProps: TextFieldProps(
                cursorColor: Colors.grey.shade400,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      right: 10.w,
                      left: 7.w,
                    ),
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                  hintText: 'Search here'.tr,
                  hintStyle: GoogleFonts.poppins().copyWith(
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  enabledBorder: outlineBorder,
                  focusedBorder: outlineBorder,
                )),
            showSearchBox: showSearchBox,
          ),
        ),
        Positioned(
          right: 10.w,
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.lightBlueK,
          ),
        )
      ],
    );

Widget whiteContainer(
  Widget widget,
) {
  return Material(
    borderRadius: BorderRadius.circular(
      10.r,
    ),
    elevation: 6,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          13.r,
        ),
        color: Colors.white,
      ),
      child: widget,
    ),
  );
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width * 0.05, 0);
    path.lineTo(size.width * 0.95, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

Widget backButton({bool isWhite = false}) => GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.r,
          ),
        ),
        child: Container(
          height: 30.h,
          width: 30.h,
          decoration: BoxDecoration(
            color: isWhite ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(
                6.r,
              ),
            ),
            border: Border.all(
              color: AppColors.KBorderColor,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back,
              color: isWhite ? Colors.black : Colors.black,
            ),
          ),
        ),
      ),
    );

Widget tnc(String txt) {
  return Row(
    children: [
      SvgPicture.asset(
        'assets/images/arrow.svg',
        height: 9.73.h,
        width: 12.56.w,
      ),
      SizedBox(
        width: 2.w,
      ),
      CustomText(
        text: txt,
        fontSize: 14.sp,
        color: AppColors.darkBlue,
        fontWeight: FontWeight.w600,
      ),
    ],
  );
}

Widget tnc2(String txt) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 5.h,
    ),
    child: CustomText(
      text: txt,
      fontSize: 12.sp,
      textAlign: TextAlign.start,
      fontWeight: FontWeight.w400,
      color: Color(
        0xff363636,
      ),
    ),
  );
}

Widget customScaffold(Widget widget) {
  return Scaffold(
    backgroundColor: AppColors.scaffoldBackground,
    body: widget,
  );
}

Future loadingDialogBox({required context, required}) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 2 - 80),
          child: Dialog(
            child: SizedBox(
              height: 80,
              width: 80,
              child: Center(
                child:
                    CircularProgressIndicator(color: AppColors.kPrimaryColor),
              ),
            ),
          ),
        );
      },
    );
