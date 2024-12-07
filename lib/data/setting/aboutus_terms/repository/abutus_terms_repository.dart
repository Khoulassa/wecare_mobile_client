
import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/setting/aboutus_terms/datasource/data_source_contruct.dart';

import 'package:we_care/domain/setting/aboutus_terms/repository/termsandabout.dart';

class AboutUsAndTermsRepository extends BaseTermsAndAboutUsRepository{
  BaseAboutAndTermDataSource dataSource;
  AboutUsAndTermsRepository({required this.dataSource});
  @override
  Future<Either<Failure, String>> getAbout()async {
    var result = await dataSource.getAbout();

    return result;
  }

  @override
  Future<Either<Failure, String>> getTerms()async {
    var result = await dataSource.getTerms();

    return result;
  }
}