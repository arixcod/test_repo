import 'package:get/get.dart';
import 'package:mandirwiki/controller/otp_controller.dart';

class OTPBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => OTPController());
  }

}