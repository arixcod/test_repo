class LockerListModel {
  bool? status;
  String? message;
  List<Data>? data;

  LockerListModel({this.status, this.message, this.data});

  LockerListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? lockerName;

  Data({this.sId, this.lockerName});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    lockerName = json['lockerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['lockerName'] = this.lockerName;
    return data;
  }
}
