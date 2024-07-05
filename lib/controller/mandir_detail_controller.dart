import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandirwiki/model/home_page_model.dart';

class MandirDetailController extends GetxController {
  final RxInt selectedTab = 0.obs;
  RxList<MandirLists> mandirList = <MandirLists>[].obs;

  var mandirName = "".obs;
  var mandirImage = "".obs;
  var mandirDetail = "".obs;
  final List<String> items = [
    'Temple name',
    'Time To Visit',
    'How to Reach',
    'Yatri Parchi',
    'Track Distance',
    'Yatra Parchi / Registration',
    'Trek Distance',
    'Footfall',
    'Avg. Temperature (C)',
    'Where to Stay',
    'Dress Code',
    'Gate Information',
    'Facilities',
    'Special Services',
  ];

  final List<String> itemDetails = [
    'Details for Item 1',
    'Details for Item 2',
    'Details for Item 3',
    'Details for Item 4',
    'Details for Item 5',
    'Details for Item 6',
    'Details for Item 7',
    'Details for Item 8',
    'Details for Item 9',
    'Details for Item 10',
    'Details for Item 11',
    'Details for Item 12',
    'Details for Item 13',
    'Details for Item 14',
  ];

  int selectedIndex = 0;
  final ScrollController scrollController = ScrollController();

  void onItemTapped(int index) {

      selectedIndex = index;
    _scrollToSelectedIndex(index);
  }

  void _scrollToSelectedIndex(int index) {
    final screenWidth = MediaQuery.of(Get.context!).size.width;
    final itemWidth = 100.0;
    final offset = index * itemWidth - (screenWidth - itemWidth) / 2;

    scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onInit() {
    mandirImage.value = Get.arguments[0];
    mandirName.value = Get.arguments[1];
    super.onInit();
  }
}
