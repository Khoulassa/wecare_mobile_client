import 'package:either_dart/either.dart';
import 'package:we_care/app/core/api_preparing/apiresult.dart';
import 'package:we_care/app/core/api_preparing/failure.dart';
import 'package:we_care/app/core/usecases/usecase.dart';
import 'package:we_care/domain/setting/faqandfeedback/entitie/faq.dart';
import 'package:we_care/domain/setting/faqandfeedback/repository/base_faq_and_feedback.dart';

class GetFeedUseCases implements UseCase<List<FAQs>,NoPram>{
  BaseFAQRepository baseFAQRepository;
  GetFeedUseCases  ({required this.baseFAQRepository});
  @override
  Future<Either<Failure,List<FAQs>> >call(NoPram noPram)async {
    return await baseFAQRepository.getFeed();
  }
}

class SetFeedUsCase implements UseCase<DynamicResponse,Map<String, dynamic> >{
  BaseFAQRepository baseFAQRepository;
  SetFeedUsCase  ({required this.baseFAQRepository});
  @override
  Future<Either<Failure, DynamicResponse> >call(Map<String, dynamic>  feedRequest)async {
    return await baseFAQRepository.setFeed(feedRequest);
  }
}
class GetFAQUseCases implements UseCase<List<FAQs>,NoPram>{
  BaseFAQRepository baseFAQRepository;
  GetFAQUseCases  ({required this.baseFAQRepository});
  @override
  Future<Either<Failure,List<FAQs>> >call(NoPram noPram)async {
    return await baseFAQRepository.getFAQ();
  }
}