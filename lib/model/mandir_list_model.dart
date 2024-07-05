class MandirListModel {
  bool? status;
  String? message;
  List<MandirList>? mandirList;

  MandirListModel({this.status, this.message, this.mandirList});

  MandirListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['mandirList'] != null) {
      mandirList = <MandirList>[];
      json['mandirList'].forEach((v) {
        mandirList!.add(new MandirList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.mandirList != null) {
      data['mandirList'] = this.mandirList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MandirList {
  String? sId;
  String? mandirName;

  MandirList({this.sId, this.mandirName});

  MandirList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mandirName = json['mandir_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['mandir_name'] = this.mandirName;
    return data;
  }
}
