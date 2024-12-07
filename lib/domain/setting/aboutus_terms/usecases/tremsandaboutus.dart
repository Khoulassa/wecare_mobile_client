import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/domain/setting/aboutus_terms/repository/termsandabout.dart';

class GetAboutUsCase implements UseCase<String,NoPram>{
  BaseTermsAndAboutUsRepository baseTermsAndAboutUsRepository;
  GetAboutUsCase  ({required this.baseTermsAndAboutUsRepository});
  @override
  Future<Either<Failure, String> >call(NoPram noPram)async {
    return await baseTermsAndAboutUsRepository.getAbout();
  }
}

class GetTermsUsCase implements UseCase<String,NoPram>{
  BaseTermsAndAboutUsRepository baseTermsAndAboutUsRepository;
  GetTermsUsCase({required this.baseTermsAndAboutUsRepository});
  @override
  Future<Either<Failure, String> >call(NoPram noPram)async {
    return await baseTermsAndAboutUsRepository.getTerms();
  }
}