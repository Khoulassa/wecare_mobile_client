import 'package:we_care/data/others/models/city.dart';
import 'package:we_care/domain/other/entities/city.dart';
import 'package:we_care/domain/setting/address/entities/address.dart';

class AddressModel extends Address {
  const AddressModel(
      {super.id,
      super.city,
      super.state,
      super.name,
      super.street,
      super.buildingNo,
      super.flatNo,
      super.mainMobile,
      super.postcode,
      super.subMobile});

  factory AddressModel.fromJson(Map<String, dynamic> json) {

    return AddressModel(
        id: json["id"],
        city: json["city"] == null ? null : CityModel.fromJson(json["city"]),
        name: json["name"] ?? "",
        state: json["state"] ?? "",
        buildingNo: json["building_no"] ?? "",
        flatNo:  json["flat_no"]??"",
        mainMobile:json["main_mobile"]??"",
        postcode:json["postcode"]??"",
        street:json["street"]??"" ,
        subMobile: json["sub_mobile"]??""
    );
  }

  Map <String ,String> toJsonAdd(){
    return {
      "city_id": city?.id.toString()??"",
      "name":name??"",
      "state": state??"",
      "street": street??"",
      "building_no": buildingNo??"",
      "flat_no": flatNo??"",
      "postcode": postcode??"",
      "main_mobile": mainMobile??"",
      "sub_mobile": subMobile??""
    };
  }

  Map <String ,String> toJsonUpdate(){
    return {
      "address_id":id.toString(),
      "city_id": city?.id.toString()??"",
      "name":name??"",
      "state": state??"",
      "street": street??"",
      "building_no": buildingNo??"",
      "flat_no": flatNo??"",
      "postcode": postcode??"",
      "main_mobile": mainMobile??"",
      "sub_mobile": subMobile??""
    };
  }
}
