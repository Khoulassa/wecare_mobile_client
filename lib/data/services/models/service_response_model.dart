import 'package:we_care/data/orders/models/pagenation_model.dart';
import 'package:we_care/data/services/models/service_model.dart';
import 'package:we_care/domain/orders/entities/order.dart';
import 'package:we_care/domain/services/entities/service.dart';


class ServiceResponseModel extends ServiceResponse {

  const ServiceResponseModel ({super.pagination,super.services});
  factory ServiceResponseModel .fromJson(Map<String, dynamic> json){

    List data =json["data"];
    int length=data.length;
    int counter=0;
    List<ServiceM>services=[];
    while(counter<length){
      services.add(ServiceModel.fromJson(json["data"][counter]));
      counter++;
    }
    Pagination pagination=PaginationModel.fromJson(json["pagination"]);

    return ServiceResponseModel(services:services,pagination: pagination);

  }
}