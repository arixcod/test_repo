import 'package:get/get.dart';
import 'package:mandirwiki/controller/my_locker_controller.dart';

class MyLockerBinding extends Bindings {
  @override
  void dependencies() {
Get.lazyPut(() => MyLockerController(),);  }
}