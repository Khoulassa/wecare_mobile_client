import 'package:we_care/domain/setting/cotactus/entities/contactus.dart';

class ContactModel extends Contact{
  ContactModel({super.facebook,super.instagram,super.twitter,super.whatsapp});

  factory ContactModel.fromJson(Map<String,dynamic> json){

    return ContactModel(
      facebook: json["facebook"],
      instagram: json["instagram"],
      twitter: json["twitter"],
      whatsapp: json["whatsapp"]
    );
  }
}
