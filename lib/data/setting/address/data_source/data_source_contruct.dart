import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/setting/address/models/adress_model.dart';


abstract class AddressBaseDataSource{
  Future<Either<Failure, DynamicResponse>> addAddress(AddressModel address);
  Future <Either<Failure, List<AddressModel>>>getAddresses();
  Future<Either<Failure,DynamicResponse >> removeAddress(int id);
  Future<Either<Failure,DynamicResponse>> updateAddress(AddressModel address);
}