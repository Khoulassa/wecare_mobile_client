import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';

import 'package:we_care/data/setting/contact/models/contact_request.dart';
import 'package:we_care/domain/setting/cotactus/entities/contactus.dart';

abstract class BaseContactRepository{
  Future<Either<Failure, Contact>> getContact();
  Future <Either<Failure, DynamicResponse>>setContact(ContactRequest contactRequest);

}