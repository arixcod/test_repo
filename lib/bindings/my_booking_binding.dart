import 'package:get/get.dart';
import 'package:mandirwiki/controller/my_booking_controller.dart';

class MyBookingBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => MyBookingController(),);  }

}