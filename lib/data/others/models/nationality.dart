

import 'package:we_care/domain/other/entities/nattionalty.dart';

class  NationalityModel extends Nationality{

const  NationalityModel({super.id,super.name});

factory NationalityModel.fromJson(Map<String,dynamic> json){

  return NationalityModel(id: json["id"],name: json["name"]);
}

Map<String,dynamic> toJson(Nationality nationality){
  return {
    "id":nationality.id,
    "name":nationality.name

  };
}
}