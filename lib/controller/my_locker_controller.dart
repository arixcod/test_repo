import 'package:get/get.dart';

class MyLockerController extends GetxController {
  RxList<MyBookingModel> importantInfoList =
      List<MyBookingModel>.empty().obs;
  @override
  void onInit() {
    super.onInit();
    importantInfo();
  }
  void importantInfo() {
    var importantInfoItem = [
      MyBookingModel("KVDBH12345", "520","03/05/2024","15:00 - 19:00","02:50 PM","Rs 40","06:30 PM","Success"),
      MyBookingModel("ABCdeednw12", "521","04/05/2024","14:00 - 19:00","03:50 PM","Rs 45","07:30 PM","Failed"),
      MyBookingModel("dvfvmdsssns", "522","05/05/2024","16:00 - 19:00","01:50 PM","Rs 50","08:30 PM","Success"),
      MyBookingModel("KVDBH12345", "523","06/05/2024","17:00 - 19:00","05:50 PM","Rs 44","09:30 PM","Success"),
      MyBookingModel("KVDBH12345", "524","07/05/2024","15:00 - 19:00","02:50 PM","Rs 40","06:30 PM","Success"),

    ];
    importantInfoList.value = importantInfoItem;
  }
}

class MyBookingModel {
  String bookingID;
  String lockerNumber;
  String date;
  String slot;
  String checkIn;
  String charges;
  String checkOut;
  String status;
  MyBookingModel(
    this.bookingID,
    this.lockerNumber,
    this.date,
    this.slot,
    this.checkIn,
    this.charges,
    this.checkOut,
    this.status,
  );
}
