import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';

abstract class BaseTermsAndAboutUsRepository{
  Future<Either<Failure, String>> getAbout();
  Future <Either<Failure, String>>getTerms();
}