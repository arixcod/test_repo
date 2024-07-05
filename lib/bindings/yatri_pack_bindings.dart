import 'package:get/get.dart';
import 'package:mandirwiki/controller/yatri_pack_controller.dart';

class YatriPackBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => YatriPackController(),);  }

}