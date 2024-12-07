import 'package:we_care/domain/setting/children/entities/child.dart';

class ChildModel extends AChild  {


  const  ChildModel({super.age,super.birthDate,super.needs,super.gender,super.name,super.id});

  factory ChildModel.fromJson(Map<String,dynamic> json){

    return ChildModel( id : json["id"],
        age : json["age"],
        needs : json["needs"],
        name:json["name"],
       gender : json["gender"],
      birthDate : json["birthdate"]);
  }
  Map <String ,String> toJsonAdd(){
    return {
      "name": name??"",
      "gender":gender??"",
      "birthdate":birthDate??"",
      "age": age.toString()??"",
      "needs": needs ?? ""
    };
  }

  Map <String ,String> toJsonUpdate(){
    return {
      "children_id":id.toString(),
      "name": name??"",
      "gender":gender??"",
      "birthdate":birthDate??"",
      "age": age.toString()??"",
      "needs": needs ?? ""
    };
  }

}