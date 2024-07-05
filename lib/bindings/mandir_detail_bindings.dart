import 'package:get/get.dart';
import 'package:mandirwiki/controller/mandir_detail_controller.dart';

class MandirDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MandirDetailController(),
    );
  }
}
