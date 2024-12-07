import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/data/setting/address/models/adress_model.dart';
import 'package:we_care/domain/setting/address/entities/address.dart';
import 'package:we_care/domain/setting/address/repository/base_address_repository.dart';


class AddAddressUsCase implements UseCase<DynamicResponse,AddressModel>{
  BaseAddressRepository baseAddressRepository;
  AddAddressUsCase ({required this.baseAddressRepository});
  @override
  Future<Either<Failure, DynamicResponse> >call(AddressModel address)async {
    return await baseAddressRepository.addAddress(address);
  }
}

class GetAddressesUsCase implements UseCase<List<Address>,NoPram>{
  BaseAddressRepository baseAddressRepository;
  GetAddressesUsCase ({required this.baseAddressRepository});
  @override
  Future<Either<Failure,List<Address>> >call(NoPram noPram)async {
    return await baseAddressRepository.getAddresses();
  }
}

class RemoveAddressUsCase implements UseCase<DynamicResponse,int>{
  BaseAddressRepository baseAddressRepository;
  RemoveAddressUsCase ({required this.baseAddressRepository});
  @override
  Future<Either<Failure,DynamicResponse> >call(int id)async {
    return await baseAddressRepository.removeAddress(id);
  }
}

class UpdateAddressUsCase implements UseCase<DynamicResponse,AddressModel >{
  BaseAddressRepository baseAddressRepository;
  UpdateAddressUsCase ({required this.baseAddressRepository});
  @override
  Future<Either<Failure,DynamicResponse> >call(AddressModel address)async {
    return await baseAddressRepository.updateAddress(address);
  }
}