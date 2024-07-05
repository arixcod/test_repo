import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/controller/rent_locker_controller.dart';

class RentLockerBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => RentLockerController(),);
  }
}