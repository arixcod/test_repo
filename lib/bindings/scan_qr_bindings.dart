import 'package:get/get.dart';
import 'package:mandirwiki/controller/san_qr_controller.dart';

class ScanQRBinding extends Bindings {
  @override
  void dependencies() {
Get.lazyPut(() => ScanQRController(),);  }

}