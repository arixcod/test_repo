class InitializationModel {
  bool? result;
  String? message;
  List<Data>? data;

  InitializationModel({this.result, this.message, this.data});

  InitializationModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
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
    data['result'] = this.result;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? androidVersion;
  String? iosVersion;
  List<String>? language;
  String? privacyPolicy;
  String? termsAndConditionApp;
  String? termsAndConditionWeb;

  Data(
      {this.sId,
        this.androidVersion,
        this.iosVersion,
        this.language,
        this.privacyPolicy,
        this.termsAndConditionApp,
        this.termsAndConditionWeb});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    androidVersion = json['androidVersion'];
    iosVersion = json['iosVersion'];
    language = json['language'].cast<String>();
    privacyPolicy = json['privacyPolicy'];
    termsAndConditionApp = json['termsAndConditionApp'];
    termsAndConditionWeb = json['termsAndConditionWeb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['androidVersion'] = this.androidVersion;
    data['iosVersion'] = this.iosVersion;
    data['language'] = this.language;
    data['privacyPolicy'] = this.privacyPolicy;
    data['termsAndConditionApp'] = this.termsAndConditionApp;
    data['termsAndConditionWeb'] = this.termsAndConditionWeb;
    return data;
  }
}
