import 'package:get/get.dart';
import 'package:mandirwiki/controller/my_plans_controller.dart';

class MyPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MyPlanController(),
    );
  }
}
