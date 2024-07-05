import 'package:get/get.dart';
import 'package:mandirwiki/controller/vr_darshan_controller.dart';

class VrDarshanBinding extends Bindings {
  @override
  void dependencies() {
Get.lazyPut(() => VrDarshanController(),);  }

}