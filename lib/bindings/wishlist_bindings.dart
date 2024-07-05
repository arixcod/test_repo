import 'package:get/get.dart';
import 'package:mandirwiki/controller/wishlist_controller.dart';

class WishlistBindings extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => WishListController(),);  }
}