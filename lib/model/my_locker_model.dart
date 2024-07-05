class MyLockersModel {
  bool? status;
  String? message;
  List<MyLockersData>? myLockersData;

  MyLockersModel({this.status, this.message, this.myLockersData});

  MyLockersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['myLockersData'] != null) {
      myLockersData = <MyLockersData>[];
      json['myLockersData'].forEach((v) {
        myLockersData!.add(new MyLockersData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.myLockersData != null) {
      data['myLockersData'] =
          this.myLockersData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyLockersData {
  String? id;
  String? name;
  int? mobile;
  String? lockerName;
  String? bookingId;
  String? bookingDate;
  String? slot;
  int? lockerQty;
  List<int>? lockerNo;
  List<String>? qrCodes;
  String? status;

  MyLockersData(
      {this.id,
        this.name,
        this.mobile,
        this.lockerName,
        this.bookingId,
        this.bookingDate,
        this.slot,
        this.lockerQty,
        this.lockerNo,
        this.qrCodes,
        this.status});

  MyLockersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    lockerName = json['lockerName'];
    bookingId = json['bookingId'];
    bookingDate = json['bookingDate'];
    slot = json['slot'];
    lockerQty = json['lockerQty'];
    lockerNo = json['lockerNo'].cast<int>();
    qrCodes = json['qrCodes'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['lockerName'] = this.lockerName;
    data['bookingId'] = this.bookingId;
    data['bookingDate'] = this.bookingDate;
    data['slot'] = this.slot;
    data['lockerQty'] = this.lockerQty;
    data['lockerNo'] = this.lockerNo;
    data['qrCodes'] = this.qrCodes;
    data['status'] = this.status;
    return data;
  }
}
