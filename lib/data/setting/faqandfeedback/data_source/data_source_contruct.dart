import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';

import 'package:we_care/data/setting/faqandfeedback/models/faqandfeedback.model.dart';

abstract class BaseFAQDataSource{
  Future<Either<Failure, List<FAQModel>>> getFeed();
  Future <Either<Failure, DynamicResponse>>setFeed(Map<String, dynamic> feedRequest);
  Future<Either<Failure, List<FAQModel>>> getFAQ();

}