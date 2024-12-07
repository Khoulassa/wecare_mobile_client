
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/home/models/homepage_model.dart';
import 'package:we_care/data/services/models/service_model.dart';
import 'package:we_care/data/services/models/service_requests/home_services_request.dart';
import 'package:we_care/data/services/models/service_response_model.dart';





abstract class HoneBaseDataSource{
  Future<Either<Failure, HomePageModel>> getHome() ;
  Future<Either<Failure, ServiceResponseModel>> getHomeServices( HomeServicesRequest request) ;

}



