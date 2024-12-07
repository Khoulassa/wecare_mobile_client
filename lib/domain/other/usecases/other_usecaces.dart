import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/domain/other/entities/city.dart';
import 'package:we_care/domain/other/entities/nattionalty.dart';
import 'package:we_care/domain/other/entities/notification.dart';
import 'package:we_care/domain/other/repository/base_other_repository.dart';


class GetCitiesUseCase implements UseCase<List<City>,NoPram>{
  BaseOtherRepository baseOtherRepository;
  GetCitiesUseCase ({required this.baseOtherRepository});
  @override
  Future<Either<Failure,List<City>> >call(NoPram params)async {
    return await baseOtherRepository.getCities();
  }
}

class GetNationalityUseCase implements UseCase<List<Nationality>,NoPram>{
  BaseOtherRepository baseOtherRepository;


  GetNationalityUseCase ({required this.baseOtherRepository});
  @override
  Future<Either<Failure,List<Nationality>> >call(NoPram params)async {
    return await  baseOtherRepository.getNationalities();
  }

}


class GetNotificationUseCase implements UseCase<List<ANotification>,NoPram>{
  BaseOtherRepository baseOtherRepository;


  GetNotificationUseCase ({required this.baseOtherRepository});
  @override
  Future<Either<Failure,List<ANotification>> >call(NoPram params)async {
    return await  baseOtherRepository.getNotifications( );
  }

}

