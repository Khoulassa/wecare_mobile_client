
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/domain/other/entities/city.dart';
import 'package:we_care/domain/other/entities/nattionalty.dart';
import 'package:we_care/domain/other/entities/notification.dart';




abstract class OtherBaseDataSource{
  Future<Either<Failure, List<City>>> getCities() ;
  Future<Either<Failure, List<Nationality>>> getNationalities();
  Future<Either<Failure, List<ANotification>>> getNotifications();

}



