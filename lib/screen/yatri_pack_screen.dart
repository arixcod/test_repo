import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/yatri_pack_controller.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/custom_component/custom_text.dart';

class YatriPackScreen extends GetView<YatriPackController> {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
      Center(
        child: CustomText(
          text: "Coming Soon",
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
