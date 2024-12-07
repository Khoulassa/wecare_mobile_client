import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/setting/address/models/adress_model.dart';
import 'package:we_care/domain/setting/address/entities/address.dart';



abstract class BaseAddressRepository{
  Future<Either<Failure, DynamicResponse>> addAddress(AddressModel address);
  Future <Either<Failure, List<Address>>>getAddresses();
  Future<Either<Failure,DynamicResponse >> removeAddress(int id);
  Future<Either<Failure,DynamicResponse>> updateAddress(AddressModel address);
}