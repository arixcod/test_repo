import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decode_full/jwt_decode_full.dart';
import 'package:mandirwiki/model/Initialization_model.dart';
import 'package:mandirwiki/model/home_page_model.dart';
import 'package:mandirwiki/screen/bottom_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:mandirwiki/screen/rent_locker.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/screen/yatri_pack_screen.dart';
import 'package:mandirwiki/util/api_client.dart';
import 'package:mandirwiki/util/api_constant.dart';
import 'package:mandirwiki/util/image_constant.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';

class HomePageController extends GetxController {
  late Timer _timer;
  RxBool canPop = false.obs;
  RxBool value = false.obs;
  RxString isLoggedIn = "".obs;
  RxString userFirstName = "".obs;
  RxString userLastName = "".obs;
  RxString morningGreetings = "Good morning".obs;
  RxString afterNoonGreetings = "Good AfterNoon".obs;
  RxString eveningGreetings = "Good Evening".obs;
  Rx<SelectedIcon> selectedIcon = SelectedIcon.favorite.obs;
  var userMail = "".obs;
  var userNumber = "".obs;
  var userAddress = "".obs;
  var isTabSelected = false.obs;
  RxList<DashboardItemsModel> importantInfoList =
      List<DashboardItemsModel>.empty().obs;
  // RxList<SliderModel> sliderList = List<SliderModel>.empty().obs;
  final AppinioSwiperController swipeController = AppinioSwiperController();
  RxInt onBannerChangeIndex = 0.obs;
  late CarouselController carouselController;
  RxString maritalStatus = "".obs;
  RxList<MandirLists> mandirList = <MandirLists>[].obs;
  RxList<BannerData> bannerList = <BannerData>[].obs;
  RxList<OurServices> ourServicesList = <OurServices>[].obs;
  RxList<OtherServices> otherServicesList = <OtherServices>[].obs;
  final RxInt selectedContainer = 0.obs; // Using Rx for reactive programming
  int selectedIndex = 0;
  Future<dynamic>? selectedWidget;
  RxInt targetIndexValue = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isInitialize = false.obs;
  HomePageModel? homePageModel;
  InitializationModel? initializationModel;

  RxList<Data> initializationList = <Data>[].obs;
  @override
  void onInit() async {
    super.onInit();
    carouselController = CarouselController();
    importantInfo();
    isLoggedIn.value = Get.arguments[0];
    // await initializationApi();
    debugPrint("init is running");
    await homePageApi();
    await appInitializationAPI();
    // await getDataFromApi();
    debugPrint("home page is running");
    if (isLoggedIn.value != "") {
      debugPrint("jwt data ===> ${isLoggedIn.value}");
      final jwtData = jwtDecode(isLoggedIn.value);

      print('header: ${jwtData.header}');
      print('payload: ${jwtData.payload}');
      print('isExpired: ${jwtData.isExpired}');
      print('issued date: ${jwtData.issuedAt}');
      print('expiration date: ${jwtData.expiration}');
      userFirstName.value = jwtData.payload["first_name"];
      userLastName.value = jwtData.payload["last_name"];
      userMail.value = jwtData.payload["email"];
      // userNumber.value = jwtData.payload["mobile_number"];
      userAddress.value = jwtData.payload["address"];
      debugPrint("user name  ===> ${userFirstName.value}");
    }

    debugPrint("logged in value is ===> ${isLoggedIn.value}");
    _timer = Timer(const Duration(milliseconds: 1), () {
      value.value = true;
    });
  }

  void onEnd() {
    log('end reached!');
    showToastMsg("Mandir List End , looping Start ");
  }

  void swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    switch (activity) {
      case Swipe():
        log('The card was swiped to the : ${activity.direction}');
        log('previous index: $previousIndex, target index: $targetIndex');
        targetIndexValue.value = targetIndex;
        break;
      case Unswipe():
        log('A ${activity.direction.name} swipe was undone.');
        log('previous index: $previousIndex, target index: $targetIndex');
        break;
      case CancelSwipe():
        log('A swipe was cancelled');
        break;
      case DrivenActivity():
        log('Driven Activity');
        break;
    }
  }

  void onSelectedBottom(int index) {
    selectedIndex = index;
    switch (index) {
      case 0:
        selectedWidget = Get.toNamed(RouteName.scan_qr);
      case 1:
        selectedWidget = Get.to(RentALocker());
      case 2:
        selectedWidget = Get.to(
          YatriPackScreen(),
        );
      case 3:
        selectedWidget = Get.toNamed(RouteName.wishlist);
      case 4:
        selectedWidget = Get.toNamed(RouteName.my_plan);
      case 5:
        selectedWidget = Get.toNamed(RouteName.vr_darshan);
    }
  }

  String getGreeting() {
    var timeNow = TimeOfDay.now();
    if (timeNow.hour >= 0 && timeNow.hour < 12) {
      return 'Good morning';
    } else if (timeNow.hour >= 12 && timeNow.hour < 17) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  Future<void> homePageApi() async {
    isLoading.value = true;
    final response = await ApiClient().getMethod(
      ApiConstants.home_api,
    );
    print("response in getLockerAPI is ===> $response");
    if (response != null) {
      homePageModel = HomePageModel.fromJson(response);
      mandirList.value = homePageModel!.mandirLists!;
      bannerList.value = homePageModel!.bannerData!;
      for (var ourServices in homePageModel!.mandirLists!) {
        ourServicesList.value = ourServices.ourServices!;
      }
      for (var otherServices in homePageModel!.mandirLists!) {
        otherServicesList.value = otherServices.otherServices!;
      }
      isLoading.value = false;
    }
  }

  Future<void> appInitializationAPI() async {
    isInitialize.value = true;
    final response = await ApiClient().getMethod(
      ApiConstants.initializationApi,
    );
    print("response in initializationList is ===> $response");
    if (response != null) {
      initializationModel = InitializationModel.fromJson(response);
      initializationList.value = initializationModel!.data!;
      isInitialize.value = false;
    }
  }

  void importantInfo() {
    var importantInfoItem = [
      DashboardItemsModel("Last Mile Connectivity", ImageConstant.last_mile),
      DashboardItemsModel(
          "Nearest Railway Station", ImageConstant.nearst_railway),
      DashboardItemsModel("Parking", ImageConstant.parking),
    ];
    importantInfoList.value = importantInfoItem;
  }
}

class DashboardItemsModel {
  String name;
  String image;
  DashboardItemsModel(
    this.name,
    this.image,
  );
}

class SliderModel {
  String image;
  SliderModel(
    this.image,
  );
}
