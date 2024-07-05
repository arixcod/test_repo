import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mandirwiki/model/available_slot_model.dart';
import 'package:mandirwiki/model/book_locker_model.dart';
import 'package:mandirwiki/model/locker_model.dart';
import 'package:mandirwiki/model/mandir_list_model.dart';
import 'package:mandirwiki/screen/widget/reuseable.dart';
import 'package:mandirwiki/util/api_client.dart';
import 'package:mandirwiki/util/api_constant.dart';
import 'package:mandirwiki/util/local_database.dart';
import 'package:mandirwiki/util/routes/routes_name.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RentLockerController extends GetxController {
  var selectedValue = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingLocker = false.obs;
  RxBool isAvailableSlot = false.obs;
  RxBool value = true.obs;
  RxBool value2 = false.obs;
  RxString selectedLocker = "".obs;
  RxString totalAmount = "".obs;
  RxString religion = "".obs;
  RxString lockerName = "".obs;
  RxString mandirIds = "".obs;
  RxString lockerIds = "".obs;
  var selectedDate = TextEditingController(
    text: DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
  ).obs;
  final RxInt selectedContainer = 0.obs;
  RxString selectedTime = "".obs;
  MandirListModel? mandirListModel;
  LockerListModel? lockerModel;
  RxList<MandirList> mandirList = <MandirList>[].obs;
  RxList<Data> lockerList = <Data>[].obs;
  final TextEditingController mandirController = TextEditingController();
  final TextEditingController lockerController = TextEditingController();
  final TextEditingController lockerNumberController = TextEditingController();
  final TextEditingController promoCodeController = TextEditingController();
  RxList<LockerData> availableSlotList = <LockerData>[].obs;
  RxString promoCode = "".obs;
  var selectedSlot = ''.obs;
  AvailableSlotModel? availableLockerData;
  RxString accessToken = "".obs;
  Rx<Razorpay> razorPay = Razorpay().obs;

  RxDouble itemWidth = 150.0.obs; // Desired width of each item
  RxDouble itemSpacing = 8.0.obs; // S
  @override
  void onInit() async {
    super.onInit();
    var tokenValue = await StorageUtil.read(
      ApiConstants.token,
    );

    if (tokenValue == null) {
      showToastMsg("Login Required");
    } else {
      accessToken.value = "success";
      await getMandirList();
      razorPay.value.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      razorPay.value.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      razorPay.value.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    }
  }

  int calculateCrossAxisCount(double screenWidth, double itemWidth) {
    return (screenWidth / itemWidth).floor(); // Calculate number of columns
  }

  @override
  void onClose() {
    razorPay.value.clear();
    super.onClose();
  }

  void selectSlot(String slot) {
    selectedSlot.value = slot;
  }

  void openCheckout({required int amount}) {
    var options = {
      'key': "rzp_test_RRQ8UBU7h4AOnP",
      'amount': amount *
          100, // amount in the smallest currency unit (e.g., cents for USD)
      'name': 'Mandir Wiki',
      'description': 'Locker Payment',
      'prefill': {
        'contact': "92929292929", // user's phone number
        'email': "a@gmail.com", // user's email address
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorPay.value.open(options);
    } catch (e) {
      debugPrint('Error while opening razor pay ===>  $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.offNamed(
      RouteName.my_booking,
    );
    // Payment successful, handle the response
    //controller.buyPackage(packageId:widget.packageId,paymentId:response.paymentId.toString(),amount:widget.price.toString(),maximumVideo:widget.tVideos);
    debugPrint('Payment Successful: ${response.paymentId}');
    showToastMsg("Payment Successful");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Get.offNamed(
    //   RouteName.login_screen,
    // );
    // Payment failed, handle the response
    debugPrint('Payment Error: ${response.code} - ${response.message}');
    showToastMsg("${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Get.offNamed(
    //   RouteName.login_screen,
    // );
    // Payment using external wallet, handle the response
    debugPrint('External Wallet: ${response.walletName}');
  }

  Future<void> getMandirList() async {
    isLoading.value = true;
    final response = await ApiClient().getMethod(ApiConstants.mandir_list);
    print("response is ===> $response");
    if (response != null) {
      mandirListModel = MandirListModel.fromJson(response);
      mandirList.value = mandirListModel!.mandirList!;
      debugPrint("mandir list ===> ${mandirListModel?.mandirList}");
      isLoading.value = false;
    }
  }

  Future<void> getLockerAPI({required String mandirId}) async {
    isLoadingLocker.value = true;
    final response = await ApiClient().getMethod(
      "${ApiConstants.lockerList}$mandirId",
    );
    print("response in getLockerAPI is ===> $response");
    if (response != null) {
      lockerList.clear();
      lockerController.clear();
      lockerModel = LockerListModel.fromJson(response);
      lockerList.value = lockerModel!.data!;

      isLoadingLocker.value = false;
    }
  }

  Future<void> book_locker({required String totalAmounts}) async {
    var body = {
      'mandirId': mandirIds.value,
      'lockerId': lockerIds.value,
      'numberOfLockers': selectedLocker.value,
      'bookingDate': selectedDate.value.text,
      'avilableSlot': selectedTime.value,
      'promoCode': promoCodeController.text,
      'totalAmount': totalAmounts,
    };

    final response =
        await ApiClient().postMethod(uri: ApiConstants.book_locker, body: body);
    if (response != null) {
      Get.back();
      var bookLockerResponse = BookLockerModel.fromJson(response);
      showToastMsg(bookLockerResponse.message ?? "");
      if (totalAmount.value == "0") {
        Get.offNamed(
          RouteName.my_booking,
        );
      } else {
        openCheckout(amount: int.parse(totalAmounts));
      }
    }
  }

  Future<void> locker_slot(
      {required String lockerId, required String date}) async {
    var body = {'lockerId': lockerId, 'bookingDate': date};

    final response =
        await ApiClient().postMethod(uri: ApiConstants.locker_slot, body: body);
    debugPrint("response in locker slot is ===> $response");
    if (response != null) {
      Get.back();
      availableLockerData = AvailableSlotModel.fromJson(response);
      availableSlotList.value = availableLockerData!.data!.lockerData!;
      debugPrint(
          "available slot is ===> ${availableSlotList[0].availableSlot}");
    }
  }
}
