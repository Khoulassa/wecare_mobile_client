import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/orders/models/orders_requestes/rate_request.dart';
import 'package:we_care/data/services/models/service_requests/favorite_request.dart';
import 'package:we_care/data/services/models/service_requests/filter_service_request.dart';
import 'package:we_care/data/services/models/service_requests/rate_request.dart';

import 'package:we_care/domain/services/entities/section.dart';
import 'package:we_care/domain/services/entities/service.dart';






abstract class BaseServiceRepository{
  Future<Either<Failure, ServiceM>> getServiceById(int id);
  Future <Either<Failure, List<ServiceM>>>getServicesBySectionId(int id);
  Future<Either<Failure,List<ServiceM>>> getServicesFilter(FilterServicesRequest filterRequest);
  Future<Either<Failure,List<Section>>> getAllSections();
  Future<Either<Failure,List<ServiceM>>> getFavorite();
  Future<Either<Failure,DynamicResponse>> setFavorite(FavoriteRequest favoriteRequest);
  Future<Either<Failure,DynamicResponse>> setServiceRate(RateServiceRequest rateServiceRequest);
}