

import 'package:we_care/domain/other/entities/city.dart';

class CityModel extends City{
  const CityModel({super.name,super.id});

  factory CityModel.fromJson(Map<String,dynamic> json){

    return CityModel(id: json["id"],name: json["name"]);
  }


}