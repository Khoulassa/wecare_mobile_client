import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';


abstract class UseCase <T,Params>{
  Future<Either<Failure,T>> call( Params params );
}

class NoPram{
  NoPram();
}