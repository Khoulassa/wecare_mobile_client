
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';

import 'package:we_care/data/services/data_source/data_source_contruct.dart';
import 'package:we_care/data/services/models/service_requests/favorite_request.dart';
import 'package:we_care/data/services/models/service_requests/filter_service_request.dart';
import 'package:we_care/data/services/models/service_requests/rate_request.dart';
import 'package:we_care/domain/services/entities/section.dart';
import 'package:we_care/domain/services/entities/service.dart';
import 'package:we_care/domain/services/repositry/base_service_repositry.dart';



class ServiceRepository implements BaseServiceRepository{
  ServiceBaseDataSource  dataSource;
  ServiceRepository( this.dataSource);
  @override
  Future<Either<Failure, List<Section>>> getAllSections() async{
    var result = await dataSource.getAllSections();

    return result;
  }

  @override
  Future<Either<Failure, ServiceM>> getServiceById(int id) async{
    var result = await dataSource.getServiceById(id);

    return result;
  }

  @override
  Future<Either<Failure, List<ServiceM>>> getServicesBySectionId(int id) async{
    var result = await dataSource.getServicesBySectionId(id);

    return result;
  }

  @override
  Future<Either<Failure, List<ServiceM>>> getServicesFilter(FilterServicesRequest filterRequest) async{
    var result = await dataSource.getServicesFilter(filterRequest);

    return result;
  }

  @override
  Future<Either<Failure, List<ServiceM>>> getFavorite() async{
    var result = await dataSource.getFavorite();

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> setFavorite(FavoriteRequest favoriteRequest)async {
    var result = await dataSource.setFavorite(favoriteRequest);

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> setServiceRate(RateServiceRequest rateServiceRequest) async{
    var result = await dataSource.setServiceRate(rateServiceRequest);

    return result;
  }

}