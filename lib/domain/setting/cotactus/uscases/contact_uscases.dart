import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/data/setting/contact/models/contact_request.dart';
import 'package:we_care/domain/setting/cotactus/entities/contactus.dart';
import 'package:we_care/domain/setting/cotactus/repository/base_contact_repository.dart';

class GetContactUsCase implements UseCase<Contact,NoPram>{
  BaseContactRepository baseContactRepository;
  GetContactUsCase  ({required this.baseContactRepository});
  @override
  Future<Either<Failure, Contact> >call(NoPram noPram)async {
    return await baseContactRepository.getContact();
  }
}

class SetContactUsCase implements UseCase<DynamicResponse,ContactRequest >{
  BaseContactRepository baseContactRepository;
  SetContactUsCase  ({required this.baseContactRepository});
  @override
  Future<Either<Failure, DynamicResponse> >call(ContactRequest contactRequest)async {
    return await baseContactRepository.setContact(contactRequest);
  }
}