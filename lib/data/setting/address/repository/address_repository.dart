
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/setting/address/data_source/data_source_contruct.dart';
import 'package:we_care/data/setting/address/models/adress_model.dart';
import 'package:we_care/domain/setting/address/entities/address.dart';
import 'package:we_care/domain/setting/address/repository/base_address_repository.dart';


class AddressRepository implements BaseAddressRepository{
  AddressBaseDataSource dataSource ;
  AddressRepository({required this.dataSource});
  @override
  Future<Either<Failure, DynamicResponse>> addAddress(AddressModel address) async{
    var result = await dataSource.addAddress(address);

    return result;
  }

  @override
  Future<Either<Failure, List<Address>>> getAddresses()async {
    var result = await dataSource.getAddresses();

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> removeAddress(int id)async {
    var result = await dataSource.removeAddress(id);

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> updateAddress(AddressModel address)async {
    var result = await dataSource.updateAddress(address);

    return result;
  }


}