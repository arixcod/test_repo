import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/model/my_locker_model.dart';
import 'package:mandirwiki/util/api_client.dart';
import 'package:mandirwiki/util/api_constant.dart';

class MyBookingController extends GetxController {
  RxBool isLoadingLocker = false.obs;
  var tabIndex = 0.obs;
  List<int> currentIndex = [0];

  void previousPage(int index) {
    if (currentIndex[index] > 0) {
      debugPrint("shdsdshdgs");
      currentIndex[index]--;
      scrollController.jumpTo(
        currentIndex[index].toDouble(),
        // duration: Duration(milliseconds: 300),
        // curve: Curves.easeInOut,
      );
    }
  }

  void nextPage({required int index}) {
    if (currentIndex[index] < myLockerData[index].lockerNo!.length - 1) {
      debugPrint("shdsdshdgs");
      currentIndex[index]++;
      scrollController.jumpTo(
        currentIndex[index].toDouble(),
        // duration: Duration(milliseconds: 300),
        // curve: Curves.easeInOut,
      );
    }
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  final scrollController = ScrollController();

  MyLockersModel? lockerModel;
  RxList<MyLockersData> myLockerData = <MyLockersData>[].obs;

  @override
  void onInit() {
    myLockerAPI();
    super.onInit();
  }

  Future<void> myLockerAPI() async {
    isLoadingLocker.value = true;
    final response = await ApiClient().getMethod(
      "${ApiConstants.my_locker}",
    );
    print("response in getLockerAPI is ===> $response");
    if (response != null) {
      lockerModel = MyLockersModel.fromJson(response);
      myLockerData.value = lockerModel!.myLockersData!;

      isLoadingLocker.value = false;
    }
    currentIndex = List.filled(myLockerData.length, 0).obs;
  }
}
