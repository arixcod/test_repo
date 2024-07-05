import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget button({required String text, required onTap}) => Container(
      height: 43.78.h,
      width: 300.w,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(
          34.56.r,
        ),
      ),
      child: MaterialButton(
        onPressed: onTap,
        height: 43.78.h,
        minWidth: 300.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            34.56.r,
          ),
        ),
        color: Colors.black,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
