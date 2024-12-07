import 'package:either_dart/src/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/data/setting/faqandfeedback/data_source/data_source_contruct.dart';
import 'package:we_care/domain/setting/faqandfeedback/entitie/faq.dart';
import 'package:we_care/domain/setting/faqandfeedback/repository/base_faq_and_feedback.dart';

class FQARepository extends BaseFAQRepository{
  BaseFAQDataSource dataSource;
  FQARepository({required this.dataSource});
  @override
  Future<Either<Failure, List<FAQs>>> getFAQ()async {
    var result = await dataSource.getFAQ();

    return result;
  }

  @override
  Future<Either<Failure, List<FAQs>>> getFeed() async{
    var result = await dataSource.getFeed();

    return result;
  }

  @override
  Future<Either<Failure, DynamicResponse>> setFeed(Map<String, dynamic> feedRequest)async {
    var result = await dataSource.setFeed(feedRequest);

    return result;
  }
}