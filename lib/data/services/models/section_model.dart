import 'package:we_care/domain/services/entities/section.dart';

class SectionModel extends Section{

  const SectionModel({super.id,super.name,super.image}) ;

  factory SectionModel.fromJson(Map<String,dynamic> json){

    return SectionModel( id : json["id"],
        image : json["image"],

        name:json["name"],);

  }
}