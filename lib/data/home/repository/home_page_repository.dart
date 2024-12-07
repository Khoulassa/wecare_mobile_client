
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/home/data_source/data_source_contruct.dart';
import 'package:we_care/data/services/models/service_model.dart';
import 'package:we_care/data/services/models/service_requests/home_services_request.dart';
import 'package:we_care/domain/home/models/home_responce.dart';
import 'package:we_care/domain/home/repository/base_home_repository.dart';

class HomePageRepository extends BaseHomeRepository{
  HoneBaseDataSource dataSource;
  HomePageRepository({required this.dataSource});
  @override
  Future<Either<Failure, HomePage>> getHome()async {
    var result = await dataSource.getHome();

    return result;
  }

  @override
  Future<Either<Failure, ServiceResponse>> getHomeServices(HomeServicesRequest request) async {
    var result = await dataSource.getHomeServices( request);

    return result;
  }

}