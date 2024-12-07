import 'package:equatable/equatable.dart';
import 'package:we_care/domain/other/entities/city.dart';
import 'package:we_care/domain/other/entities/nattionalty.dart';


class Profile extends Equatable {
 final int? id;

 final int? points;
 final  String? name;
 final  String? phone;
 final  String? gender;
 final  String? email;
  final String? maritalStatus;
 final  Nationality? nationality;
final City? city;
final  String? jwt;

  const Profile(
      {this.id,
      this.gender,
      this.phone,
      this.name,
      this.email,
      this.points,
      this.jwt,
      this.maritalStatus,
      this.nationality,
      this.city});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        gender,
        phone,
        name,
        email,
        points,
        jwt,
        maritalStatus,
        nationality,
        city
      ];
}
