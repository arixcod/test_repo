import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/samay_controller.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';

class SamayBottomNavBar extends GetView<SamayController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return customScaffold(
      SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: CustomText(
                    text: 'Samay',
                    fontSize: 20.sp,
                    fontWeight:
                        FontWeight.bold, // You can specify the font weight
                  ),
                ),
              ],
            ),
            Center(
              child: CustomText(
                text: "Coming soon",
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}