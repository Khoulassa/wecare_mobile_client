import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/data/services/models/service_model.dart';
import 'package:we_care/data/services/models/service_requests/home_services_request.dart';
import 'package:we_care/domain/home/models/home_responce.dart';
import 'package:we_care/domain/home/repository/base_home_repository.dart';

class GetHomeUseCases implements UseCase<HomePage,NoPram>{
  BaseHomeRepository baseHomeRepository;


  GetHomeUseCases({required this.baseHomeRepository});
  @override
  Future<Either<Failure,HomePage>> call(NoPram noPram) async {
    return await baseHomeRepository.getHome();
  }

}


class GetHomeServicesUseCases implements UseCase<ServiceResponse,HomeServicesRequest>{
  BaseHomeRepository baseHomeRepository;


  GetHomeServicesUseCases ({required this.baseHomeRepository});
  @override
  Future<Either<Failure,ServiceResponse>> call(HomeServicesRequest  request) async {
    return await baseHomeRepository.getHomeServices(request);
  }

}