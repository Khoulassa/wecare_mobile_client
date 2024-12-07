import 'package:equatable/equatable.dart';
import 'package:we_care/data/others/models/city.dart';
import 'package:we_care/data/services/models/time_model.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/domain/services/entities/service.dart';


class ServiceModel extends ServiceM {
  const ServiceModel({super.city,
    super.image,
    super.name,
    super.id,
    super.price,
    super.rate,
    super.descriptionAr,
    super.descriptionEn,
    super.isFave,
    super.providerName,
    super.times});

  factory ServiceModel.fromJson(Map<String, dynamic> json){
    return ServiceModel(id: json["id"],
        city: CityModel.fromJson(json["city"]),
        providerName: json["provider_name"],
        times: json["times"] == null ? null : TimeModel.fromJson(json["times"]),
        image: json["image"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        name: json["name"],
        price: json["price"],
        rate: json["rate"],
        isFave: json["is_fave"]
    );
  }


}
class ServiceResponse extends Equatable{
  final List<ServiceM>? services;
  final Pagination? pagination;
  const ServiceResponse({this.pagination,this.services});

  @override

  List<Object?> get props =>[services,pagination];

}