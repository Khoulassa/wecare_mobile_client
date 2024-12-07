import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/domain/setting/faqandfeedback/entitie/faq.dart';

abstract class BaseFAQRepository{
  Future<Either<Failure, List<FAQs>>> getFeed();
  Future <Either<Failure, DynamicResponse>>setFeed(Map<String, dynamic> feedRequest);
  Future<Either<Failure, List<FAQs>>> getFAQ();

}