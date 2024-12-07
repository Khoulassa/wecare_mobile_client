import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/usecases/usecase.dart';

import 'package:we_care/data/setting/children/models/child_models.dart';

import 'package:we_care/domain/setting/children/entities/child.dart';
import 'package:we_care/domain/setting/children/repository/base_children_repository.dart';


class AddChildUsCase implements UseCase<DynamicResponse,ChildModel>{
  BaseChildrenRepository baseChildrenRepository;
  AddChildUsCase ({required this.baseChildrenRepository});
  @override
  Future<Either<Failure, DynamicResponse> >call(ChildModel child)async {
    return await baseChildrenRepository.addChild(child);
  }
}

class GetChildrenUsCase implements UseCase<List<AChild>,NoPram>{
  BaseChildrenRepository baseChildrenRepository;
  GetChildrenUsCase ({required this.baseChildrenRepository});
  @override
  Future<Either<Failure,List<AChild>> >call(NoPram noPram)async {
    return await baseChildrenRepository.getChildren();
  }
}

class RemoveChildUsCase implements UseCase<DynamicResponse,int>{
  BaseChildrenRepository baseChildrenRepository;
  RemoveChildUsCase ({required this.baseChildrenRepository});
  @override
  Future<Either<Failure,DynamicResponse> >call(int id)async {
    return await baseChildrenRepository.removeChild(id);
  }
}

class UpdateChildUsCase implements UseCase<DynamicResponse,ChildModel >{
  BaseChildrenRepository baseChildrenRepository;
  UpdateChildUsCase ({required this.baseChildrenRepository});
  @override
  Future<Either<Failure,DynamicResponse> >call(ChildModel child)async {
    return await baseChildrenRepository.updateChildInfo(child);
  }
}