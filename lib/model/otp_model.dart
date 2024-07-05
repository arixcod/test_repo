class OTPModel {
  bool? status;
  String? token;
  int? isRegistered;
  String? message;

  OTPModel({this.status, this.token, this.isRegistered, this.message});

  OTPModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    isRegistered = json['is_registered'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    data['is_registered'] = this.isRegistered;
    data['message'] = this.message;
    return data;
  }
}
