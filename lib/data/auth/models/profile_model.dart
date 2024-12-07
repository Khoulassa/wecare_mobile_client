
import 'package:we_care/data/others/models/city.dart';
import 'package:we_care/data/others/models/nationality.dart';
import 'package:we_care/domain/auth/entities/profile.dart';


class ProfileModel extends Profile {
  const ProfileModel(
      {super.phone,
      super.name,
      super.email,
      super.city,
      super.nationality,
      super.maritalStatus,
      super.jwt,
      super.points,
      super.gender,
      super.id});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {

    return  ProfileModel(
        id: json["id"],
        jwt: json["jwt"],
        nationality: NationalityModel.fromJson(json["nationality"]),
        city: json["city"] != null ? CityModel.fromJson(json["city"]) : null,
        maritalStatus: json["marital_status"],
        name: json["name"],
        points: json["points"],
        phone: json["phone"],
        email: json["email"],
        gender: json["gender"]);
  }

  static Map<String, String> toJson(Profile profile) {
    return {
      "name": profile.name.toString(),
      "email": profile.email.toString(),
      "phone": profile.phone.toString(),
      "city_id": profile.city!.id.toString(),
      "gender": profile.gender.toString(),
      "nationality_id": profile.nationality!.id.toString(),
      "marital_status": profile.maritalStatus.toString(),
    };
  }
}
