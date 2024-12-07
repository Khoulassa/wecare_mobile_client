import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';

import 'package:we_care/data/setting/children/models/child_models.dart';

import 'package:we_care/domain/setting/children/entities/child.dart';



abstract class BaseChildrenRepository{
  Future<Either<Failure, DynamicResponse>> addChild(ChildModel child);
  Future <Either<Failure, List<AChild>>>getChildren();
  Future<Either<Failure,DynamicResponse >> removeChild(int id);
  Future<Either<Failure,DynamicResponse>> updateChildInfo(ChildModel child);
}