import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/data/services/models/service_requests/favorite_request.dart';
import 'package:we_care/data/services/models/service_requests/filter_service_request.dart';
import 'package:we_care/data/services/models/service_requests/rate_request.dart';
import 'package:we_care/domain/services/entities/section.dart';
import 'package:we_care/domain/services/entities/service.dart';
import 'package:we_care/domain/services/repositry/base_service_repositry.dart';




class GetServiceById implements UseCase<ServiceM,int>{
  BaseServiceRepository baseServiceRepository;
  GetServiceById ({required this.baseServiceRepository});
  @override
  Future<Either<Failure,ServiceM> >call(int id)async {
    return await baseServiceRepository.getServiceById(id);
  }
}

class GetServicesBySectionId implements UseCase<List<ServiceM>,int>{
  BaseServiceRepository baseServiceRepository;
  GetServicesBySectionId ({required this.baseServiceRepository});
  @override
  Future<Either<Failure, List<ServiceM>>> call(int id)async {
    return await baseServiceRepository.getServicesBySectionId(id);
  }
}

class GetServicesFilter implements UseCase<List<ServiceM>,FilterServicesRequest>{
  BaseServiceRepository baseServiceRepository;
  GetServicesFilter ({required this.baseServiceRepository});
  @override
  Future<Either<Failure, List<ServiceM>>> call(FilterServicesRequest filterRequest) async{
    return await baseServiceRepository.getServicesFilter(filterRequest);
  }

}

class GetAllSections implements UseCase<List<Section>,NoPram>{
  BaseServiceRepository baseServiceRepository;
  GetAllSections ({required this.baseServiceRepository});
  @override
  Future<Either<Failure, List<Section>>> call(NoPram noPram) async{
    return await baseServiceRepository.getAllSections();
  }

}

class GetFavorite implements UseCase<List<ServiceM>,NoPram>{
  BaseServiceRepository baseServiceRepository;
  GetFavorite({required this.baseServiceRepository});
  @override
  Future<Either<Failure, List<ServiceM>>> call(NoPram noPram) async{
    return await baseServiceRepository.getFavorite();
  }}

class SetFavorite implements UseCase<DynamicResponse,FavoriteRequest>{
  BaseServiceRepository baseServiceRepository;
  SetFavorite({required this.baseServiceRepository});
  @override
  Future<Either<Failure, DynamicResponse>> call(FavoriteRequest  favoriteRequest) async{
    return await baseServiceRepository.setFavorite(favoriteRequest);
  }}
class SetRate implements UseCase<DynamicResponse,RateServiceRequest>{
  BaseServiceRepository baseServiceRepository;
  SetRate({required this.baseServiceRepository});
  @override
  Future<Either<Failure, DynamicResponse>> call(RateServiceRequest  rateServiceRequest) async{
    return await baseServiceRepository.setServiceRate(rateServiceRequest);
  }}