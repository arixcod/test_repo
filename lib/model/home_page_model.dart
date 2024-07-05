class HomePageModel {
  bool? status;
  String? message;
  List<MandirLists>? mandirLists;
  List<BannerData>? bannerData;

  HomePageModel({this.status, this.message, this.mandirLists, this.bannerData});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['mandirLists'] != null) {
      mandirLists = <MandirLists>[];
      json['mandirLists'].forEach((v) {
        mandirLists!.add(new MandirLists.fromJson(v));
      });
    }
    if (json['bannerData'] != null) {
      bannerData = <BannerData>[];
      json['bannerData'].forEach((v) {
        bannerData!.add(new BannerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.mandirLists != null) {
      data['mandirLists'] = this.mandirLists!.map((v) => v.toJson()).toList();
    }
    if (this.bannerData != null) {
      data['bannerData'] = this.bannerData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MandirLists {
  String? sId;
  String? state;
  String? city;
  String? mandirName;
  String? mandirImg;
  String? templeTimeOne;
  String? templeTimeTwo;
  String? nearestairport;
  String? nearestrailway;
  String? nearestparking;
  String? darshan;
  String? templename;
  String? mandirlocation;
  String? deity;
  String? trackdistaance;
  String? dresscode;
  String? yatraparchi;
  String? parking;
  String? bestTime;
  String? peakTime;
  String? offPeakTime;
  String? peakmonth;
  String? offpeakmonth;
  String? tempraturemonth;
  String? hotel;
  String? dharamshala;
  String? openTime;
  String? closeTime;
  String? breakTime;
  String? aartiTime;
  String? entryGate;
  String? exitGate;
  String? locker;
  String? shoeStand;
  String? photography;
  String? videography;
  String? food;
  String? water;
  String? toilet;
  String? vipDarshan;
  String? emergency;
  String? pujaOffering;
  String? prasad;
  String? bhnadara;
  String? cablecar;
  String? boat;
  String? kandi;
  String? helicopter;
  String? batteryCar;
  String? animalservice;
  String? pithoos;
  String? palki;
  String? tent;
  String? blanket;
  String? flight;
  String? train;
  String? bus;
  String? autorickshow;
  String? ola;
  String? privatetaxi;
  String? mandirDescription;
  String? createdAt;
  List<String>? mandirImages;
  List<OurServices>? ourServices;
  List<OtherServices>? otherServices;

  MandirLists(
      {this.sId,
      this.state,
      this.city,
      this.mandirName,
      this.mandirImg,
      this.templeTimeOne,
      this.templeTimeTwo,
      this.nearestairport,
      this.nearestrailway,
      this.nearestparking,
      this.darshan,
      this.templename,
      this.mandirlocation,
      this.deity,
      this.trackdistaance,
      this.dresscode,
      this.yatraparchi,
      this.parking,
      this.bestTime,
      this.peakTime,
      this.offPeakTime,
      this.peakmonth,
      this.offpeakmonth,
      this.tempraturemonth,
      this.hotel,
      this.dharamshala,
      this.openTime,
      this.closeTime,
      this.breakTime,
      this.aartiTime,
      this.entryGate,
      this.exitGate,
      this.locker,
      this.shoeStand,
      this.photography,
      this.videography,
      this.food,
      this.water,
      this.toilet,
      this.vipDarshan,
      this.emergency,
      this.pujaOffering,
      this.prasad,
      this.bhnadara,
      this.cablecar,
      this.boat,
      this.kandi,
      this.helicopter,
      this.batteryCar,
      this.animalservice,
      this.pithoos,
      this.palki,
      this.tent,
      this.blanket,
      this.flight,
      this.train,
      this.bus,
      this.autorickshow,
      this.ola,
      this.privatetaxi,
      this.mandirDescription,
      this.createdAt,
      this.mandirImages,
      this.ourServices,
      this.otherServices});

  MandirLists.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    state = json['state'];
    city = json['city'];
    mandirName = json['mandir_name'];
    mandirImg = json['mandir_img'];
    templeTimeOne = json['templeTimeOne'];
    templeTimeTwo = json['templeTimeTwo'];
    nearestairport = json['nearestairport'];
    nearestrailway = json['nearestrailway'];
    nearestparking = json['nearestparking'];
    darshan = json['darshan'];
    templename = json['templename'];
    mandirlocation = json['mandirlocation'];
    deity = json['deity'];
    trackdistaance = json['trackdistaance'];
    dresscode = json['dresscode'];
    yatraparchi = json['yatraparchi'];
    parking = json['parking'];
    bestTime = json['BestTime'];
    peakTime = json['peakTime'];
    offPeakTime = json['offPeakTime'];
    peakmonth = json['peakmonth'];
    offpeakmonth = json['offpeakmonth'];
    tempraturemonth = json['tempraturemonth'];
    hotel = json['hotel'];
    dharamshala = json['Dharamshala'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    breakTime = json['breakTime'];
    aartiTime = json['aartiTime'];
    entryGate = json['entryGate'];
    exitGate = json['exitGate'];
    locker = json['locker'];
    shoeStand = json['shoeStand'];
    photography = json['photography'];
    videography = json['videography'];
    food = json['food'];
    water = json['water'];
    toilet = json['toilet'];
    vipDarshan = json['vipDarshan'];
    emergency = json['emergency'];
    pujaOffering = json['pujaOffering'];
    prasad = json['prasad'];
    bhnadara = json['bhnadara'];
    cablecar = json['cablecar'];
    boat = json['boat'];
    kandi = json['kandi'];
    helicopter = json['helicopter'];
    batteryCar = json['batteryCar'];
    animalservice = json['animalservice'];
    pithoos = json['pithoos'];
    palki = json['palki'];
    tent = json['tent'];
    blanket = json['blanket'];
    flight = json['flight'];
    train = json['train'];
    bus = json['bus'];
    autorickshow = json['autorickshow'];
    ola = json['ola'];
    privatetaxi = json['privatetaxi'];
    mandirDescription = json['mandirDescription'];
    createdAt = json['createdAt'];
    mandirImages = json['mandirImages'].cast<String>();
    if (json['ourServices'] != null) {
      ourServices = <OurServices>[];
      json['ourServices'].forEach((v) {
        ourServices!.add(new OurServices.fromJson(v));
      });
    }
    if (json['otherServices'] != null) {
      otherServices = <OtherServices>[];
      json['otherServices'].forEach((v) {
        otherServices!.add(new OtherServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['state'] = this.state;
    data['city'] = this.city;
    data['mandir_name'] = this.mandirName;
    data['mandir_img'] = this.mandirImg;
    data['templeTimeOne'] = this.templeTimeOne;
    data['templeTimeTwo'] = this.templeTimeTwo;
    data['nearestairport'] = this.nearestairport;
    data['nearestrailway'] = this.nearestrailway;
    data['nearestparking'] = this.nearestparking;
    data['darshan'] = this.darshan;
    data['templename'] = this.templename;
    data['mandirlocation'] = this.mandirlocation;
    data['deity'] = this.deity;
    data['trackdistaance'] = this.trackdistaance;
    data['dresscode'] = this.dresscode;
    data['yatraparchi'] = this.yatraparchi;
    data['parking'] = this.parking;
    data['BestTime'] = this.bestTime;
    data['peakTime'] = this.peakTime;
    data['offPeakTime'] = this.offPeakTime;
    data['peakmonth'] = this.peakmonth;
    data['offpeakmonth'] = this.offpeakmonth;
    data['tempraturemonth'] = this.tempraturemonth;
    data['hotel'] = this.hotel;
    data['Dharamshala'] = this.dharamshala;
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    data['breakTime'] = this.breakTime;
    data['aartiTime'] = this.aartiTime;
    data['entryGate'] = this.entryGate;
    data['exitGate'] = this.exitGate;
    data['locker'] = this.locker;
    data['shoeStand'] = this.shoeStand;
    data['photography'] = this.photography;
    data['videography'] = this.videography;
    data['food'] = this.food;
    data['water'] = this.water;
    data['toilet'] = this.toilet;
    data['vipDarshan'] = this.vipDarshan;
    data['emergency'] = this.emergency;
    data['pujaOffering'] = this.pujaOffering;
    data['prasad'] = this.prasad;
    data['bhnadara'] = this.bhnadara;
    data['cablecar'] = this.cablecar;
    data['boat'] = this.boat;
    data['kandi'] = this.kandi;
    data['helicopter'] = this.helicopter;
    data['batteryCar'] = this.batteryCar;
    data['animalservice'] = this.animalservice;
    data['pithoos'] = this.pithoos;
    data['palki'] = this.palki;
    data['tent'] = this.tent;
    data['blanket'] = this.blanket;
    data['flight'] = this.flight;
    data['train'] = this.train;
    data['bus'] = this.bus;
    data['autorickshow'] = this.autorickshow;
    data['ola'] = this.ola;
    data['privatetaxi'] = this.privatetaxi;
    data['mandirDescription'] = this.mandirDescription;
    data['createdAt'] = this.createdAt;
    data['mandirImages'] = this.mandirImages;
    if (this.ourServices != null) {
      data['ourServices'] = this.ourServices!.map((v) => v.toJson()).toList();
    }
    if (this.otherServices != null) {
      data['otherServices'] =
          this.otherServices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OurServices {
  String? sId;
  String? cityName;
  String? mandirName;
  int? availaibility;
  String? cityId;
  String? mandirId;
  String? serviceImage;
  String? serviceName;

  OurServices(
      {this.sId,
      this.cityName,
      this.mandirName,
      this.availaibility,
      this.cityId,
      this.mandirId,
      this.serviceImage,
      this.serviceName});

  OurServices.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cityName = json['city_name'];
    mandirName = json['mandir_name'];
    availaibility = json['availaibility'];
    cityId = json['city_id'];
    mandirId = json['mandir_id'];
    serviceImage = json['serviceImage'];
    serviceName = json['serviceName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['city_name'] = this.cityName;
    data['mandir_name'] = this.mandirName;
    data['availaibility'] = this.availaibility;
    data['city_id'] = this.cityId;
    data['mandir_id'] = this.mandirId;
    data['serviceImage'] = this.serviceImage;
    data['serviceName'] = this.serviceName;
    return data;
  }
}

class OtherServices {
  String? sId;
  String? cityName;
  String? mandirName;
  int? availaibility;
  String? cityId;
  String? mandirId;
  String? serviceImage;
  String? serviceName;

  OtherServices(
      {this.sId,
      this.cityName,
      this.mandirName,
      this.availaibility,
      this.cityId,
      this.mandirId,
      this.serviceImage,
      this.serviceName});

  OtherServices.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cityName = json['city_name'];
    mandirName = json['mandir_name'];
    availaibility = json['availaibility'];
    cityId = json['city_id'];
    mandirId = json['mandir_id'];
    serviceImage = json['serviceImage'];
    serviceName = json['serviceName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['city_name'] = this.cityName;
    data['mandir_name'] = this.mandirName;
    data['availaibility'] = this.availaibility;
    data['city_id'] = this.cityId;
    data['mandir_id'] = this.mandirId;
    data['serviceImage'] = this.serviceImage;
    data['serviceName'] = this.serviceName;
    return data;
  }
}

class BannerData {
  String? sId;
  String? title;
  String? bannerImage;
  int? status;

  BannerData({this.sId, this.title, this.bannerImage, this.status});

  BannerData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    bannerImage = json['bannerImage'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['bannerImage'] = this.bannerImage;
    data['status'] = this.status;
    return data;
  }
}
