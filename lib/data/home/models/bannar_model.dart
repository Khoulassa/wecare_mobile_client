import 'package:we_care/domain/home/models/bannar.dart';

class BannerModel extends HBanner {


  BannerModel({super.id, super.image,super.description});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json["id"],
      image:json["image"],
      description: json["description"]
    );
  }
}