import 'package:we_care/domain/orders/entities/provider.dart';

class ProviderModel extends AProvider{
  const ProviderModel(  {super.id,super.name,super.image,super.rate});
  factory ProviderModel.fromJson(Map<String,dynamic> json){

    return ProviderModel( id : json["id"],
      image : json["image"]??"",
      rate:json["rate"]??0,
      name:json["name"]??"",);

  }

}