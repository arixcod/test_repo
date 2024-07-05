import 'package:get/get.dart';
import 'package:mandirwiki/controller/samay_controller.dart';

class SamayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SamayController(),
    );
  }
}
