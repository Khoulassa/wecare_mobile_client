import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/setting/contact/models/contact_model.dart';
import 'package:we_care/data/setting/contact/models/contact_request.dart';

abstract class BaseContactDataSource{
  Future<Either<Failure, ContactModel>> getContact();
  Future <Either<Failure, DynamicResponse>>setContact(ContactRequest contactRequest);

}