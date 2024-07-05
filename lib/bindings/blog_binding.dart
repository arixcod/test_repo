import 'package:get/get.dart';
import 'package:mandirwiki/controller/blog_controller.dart';

class BlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BlogController(),
    );
  }
}
