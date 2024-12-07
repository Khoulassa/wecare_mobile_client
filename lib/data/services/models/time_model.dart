import 'package:we_care/domain/services/entities/time.dart';

class TimeModel extends Times{
  const TimeModel({super.hasNightSift,super.morning,super.night});
  factory TimeModel.fromJson(Map<String,dynamic> json){
    return TimeModel( night:json["night"],
        morning:json["morning"],
        hasNightSift:json["has_night_shift"]);
  }
}