import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';


import 'package:we_care/data/services/models/section_model.dart';
import 'package:we_care/data/services/models/service_model.dart';
import 'package:we_care/data/services/models/service_requests/favorite_request.dart';
import 'package:we_care/data/services/models/service_requests/filter_service_request.dart';
import 'package:we_care/data/services/models/service_requests/rate_request.dart';




abstract class ServiceBaseDataSource{
  Future<Either<Failure, ServiceModel>> getServiceById(int id);
  Future <Either<Failure, List<ServiceModel>>>getServicesBySectionId(int id);
  Future<Either<Failure,List<ServiceModel>>> getServicesFilter(FilterServicesRequest filterRequest);
  Future<Either<Failure,List<SectionModel>>> getAllSections();
  Future<Either<Failure,List<ServiceModel>>> getFavorite();
  Future<Either<Failure,DynamicResponse>> setFavorite(FavoriteRequest favoriteRequest);
  Future<Either<Failure,DynamicResponse>> setServiceRate(RateServiceRequest rateRequest);
}