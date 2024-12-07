
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/setting/children/data_source/data_source_contruct.dart';
import 'package:we_care/data/setting/children/models/child_models.dart';
import 'package:we_care/domain/setting/children/entities/child.dart';
import 'package:we_care/domain/setting/children/repository/base_children_repository.dart';


class ChildrenRepository implements BaseChildrenRepository{
  ChildrenBaseDataSource dataSource;
  ChildrenRepository({required this.dataSource});

  @override
  Future<Either<Failure, DynamicResponse>> addChild(ChildModel child)async {
    var result = await dataSource.addChild(child);

    return result;
  }

  @override
  Future<Either<Failure, List<AChild>>> getChildren()async {
    var result = await dataSource.getChildren();

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> removeChild(int id)async {
    var result = await dataSource.removeChild(id);

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> updateChildInfo(ChildModel child)async {
    var result = await dataSource.updateChildInfo(child);

    return result;
  }


}