import 'package:equatable/equatable.dart';

abstract class Failure  extends Equatable{
final  int code;
 final String? message;

  const Failure( {required this.code, required this.message}):super();
 @override
 List  get props => [code,message ];
}

class ServerFailure extends Failure{
  const ServerFailure({  required super.message,
    required super.code,});
}

class CacheFailure extends Failure{
  const CacheFailure({  required super.message,
    required super.code,});
}