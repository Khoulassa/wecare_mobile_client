import 'package:we_care/domain/home/models/share.dart';

class ShareModel extends Share{


  ShareModel({super.playStoreUrl, super.huaweiStoreUrl,super.appStoreUrl});

  factory ShareModel.fromJson(Map<String, dynamic> json) {
    return ShareModel(
        playStoreUrl: json["play_store_url"],
        appStoreUrl:json["app_store_url"],
        huaweiStoreUrl: json["huawei_store_url"]
    );
  }
}