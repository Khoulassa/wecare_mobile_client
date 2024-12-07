
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/setting/contact/dota_source/data_source_contruct.dart';
import 'package:we_care/data/setting/contact/models/contact_model.dart';
import 'package:we_care/data/setting/contact/models/contact_request.dart';
import 'package:we_care/domain/setting/cotactus/repository/base_contact_repository.dart';

class ContactRepository implements BaseContactRepository{
  BaseContactDataSource dataSource;
  ContactRepository({required this.dataSource});
  @override
  Future<Either<Failure, ContactModel>> getContact()async {
    var result = await dataSource.getContact();

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> setContact(ContactRequest contactRequest) async{
    var result = await dataSource.setContact(contactRequest);

    return result;
  }

}