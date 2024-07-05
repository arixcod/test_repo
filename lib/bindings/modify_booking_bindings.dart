import 'package:get/get.dart';
import 'package:mandirwiki/controller/modify_booking_controller.dart';

class ModifyBookingBindings extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => ModifyBookingController(),);  }
}