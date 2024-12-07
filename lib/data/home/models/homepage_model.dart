import 'package:we_care/data/home/models/bannar_model.dart';
import 'package:we_care/data/home/models/share_modle.dart';
import 'package:we_care/data/services/models/service_model.dart';
import 'package:we_care/domain/home/models/bannar.dart';
import 'package:we_care/domain/home/models/home_responce.dart';
import 'package:we_care/domain/home/models/share.dart';
import 'package:we_care/domain/services/entities/service.dart';

class HomePageModel extends HomePage {


  HomePageModel({super.banners, super.services,super.share});

  factory HomePageModel.fromJson(Map<String, dynamic> json) {

    List<HBanner> banners = [];
    List banner = json["banners"];
    int length =banner.length;

    int count=0;
    while(count<length){
      banners.add(BannerModel.fromJson(banner[count]));
      count++;
    }

    List<ServiceM> services = [];
    List service = json["services"];
    int lengths =service.length;

    int counts=0;
    while(counts<lengths){
      services.add(ServiceModel.fromJson(service[counts]));
      counts++;
    }

    Share shares =ShareModel.fromJson(json["share"]);

    return HomePageModel(banners: banners,services: services,share:shares);
  }
}