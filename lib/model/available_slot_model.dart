class AvailableSlotModel {
  bool? status;
  String? message;
  AvailableLockerData? data;

  AvailableSlotModel({this.status, this.message, this.data});

  AvailableSlotModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new AvailableLockerData.fromJson(json['data']) : null;
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

class AvailableLockerData {
  List<LockerData>? lockerData;
  int? availableTickets;

  AvailableLockerData({this.lockerData, this.availableTickets});

  AvailableLockerData.fromJson(Map<String, dynamic> json) {
    if (json['lockerData'] != null) {
      lockerData = <LockerData>[];
      json['lockerData'].forEach((v) {
        lockerData!.add(new LockerData.fromJson(v));
      });
    }
    availableTickets = json['availableTickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lockerData != null) {
      data['lockerData'] = this.lockerData!.map((v) => v.toJson()).toList();
    }
    data['availableTickets'] = this.availableTickets;
    return data;
  }
}

class LockerData {
  String? sId;
  String? lockerId;
  List<String>? availableSlot;
  String? lockerName;

  LockerData({this.sId, this.lockerId, this.availableSlot, this.lockerName});

  LockerData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    lockerId = json['lockerId'];
    availableSlot = json['availableSlot'].cast<String>();
    lockerName = json['lockerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['lockerId'] = this.lockerId;
    data['availableSlot'] = this.availableSlot;
    data['lockerName'] = this.lockerName;
    return data;
  }
}
