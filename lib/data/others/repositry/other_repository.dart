
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/others/data_source/data_source_contruct.dart';
import 'package:we_care/domain/other/entities/city.dart';
import 'package:we_care/domain/other/entities/nattionalty.dart';
import 'package:we_care/domain/other/entities/notification.dart';
import 'package:we_care/domain/other/repository/base_other_repository.dart';



class  OtherRepository implements BaseOtherRepository{
  OtherBaseDataSource dataSource;
  OtherRepository( this.dataSource);

  @override
  Future<Either<Failure, List<City>>> getCities() async{
    var result = await dataSource.getCities();

    return result;
  }

  @override
  Future<Either<Failure, List<Nationality>>> getNationalities()async {
    var result = await dataSource.getNationalities();

    return result;
  }

  @override
  Future<Either<Failure, List<ANotification>>> getNotifications() async {
    var result = await dataSource.getNotifications();

    return result;
  }


}