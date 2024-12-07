

import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/services/models/service_model.dart';
import 'package:we_care/data/services/models/service_requests/home_services_request.dart';
import 'package:we_care/domain/home/models/home_responce.dart';

abstract class BaseHomeRepository{

  Future<Either<Failure,HomePage>> getHome();
  Future<Either<Failure,ServiceResponse>> getHomeServices(HomeServicesRequest request);
}