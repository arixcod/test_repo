import 'package:get/get.dart';
import 'package:mandirwiki/controller/login_screen_controller.dart';

class PhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginScreenController(),
    );
  }
}
