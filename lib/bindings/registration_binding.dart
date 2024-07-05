import 'package:get/get.dart';
import 'package:mandirwiki/controller/registration_controller.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RegistrationController(),
    );
  }
}
