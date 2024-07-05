import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/san_qr_controller.dart';
import 'package:mandirwiki/screen/widget/custom_image.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';
import 'package:mandirwiki/util/image_constant.dart';

class ScanQRScreen extends GetView<ScanQRController> {
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
                backButton(),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: CustomText(
                    text: 'Scan QR',
                    fontSize: 20.sp,
                    fontWeight:
                        FontWeight.bold, // You can specify the font weight
                  ),
                ),
              ],
            ),
            Center(
              child: CustomImage(

                image: "",
                placeholder: ImageConstant.comingSoon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
