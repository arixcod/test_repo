class BookLockerModel {
  bool? status;
  String? message;
  BookLockerData? data;

  BookLockerModel({this.status, this.message, this.data});

  BookLockerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new BookLockerData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BookLockerData {
  String? userId;
  String? searchNearBy;
  String? selectLocker;
  int? numberOfLockers;
  String? selectDate;
  String? avilableSlot;
  String? promoCode;
  int? totalAmount;
  String? sId;

  BookLockerData(
      {this.userId,
        this.searchNearBy,
        this.selectLocker,
        this.numberOfLockers,
        this.selectDate,
        this.avilableSlot,
        this.promoCode,
        this.totalAmount,
        this.sId});

  BookLockerData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    searchNearBy = json['searchNearBy'];
    selectLocker = json['selectLocker'];
    numberOfLockers = json['numberOfLockers'];
    selectDate = json['selectDate'];
    avilableSlot = json['avilableSlot'];
    promoCode = json['promoCode'];
    totalAmount = json['totalAmount'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['searchNearBy'] = this.searchNearBy;
    data['selectLocker'] = this.selectLocker;
    data['numberOfLockers'] = this.numberOfLockers;
    data['selectDate'] = this.selectDate;
    data['avilableSlot'] = this.avilableSlot;
    data['promoCode'] = this.promoCode;
    data['totalAmount'] = this.totalAmount;
    data['_id'] = this.sId;
    return data;
  }
}
