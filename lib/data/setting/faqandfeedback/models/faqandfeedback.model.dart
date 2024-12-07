

import 'package:we_care/domain/setting/faqandfeedback/entitie/faq.dart';

class FAQModel extends FAQs{
  FAQModel({super.id,super.answer,super.question});
  factory FAQModel.fromJson(Map<String,dynamic> json){
    return FAQModel(
      id: json["id"],
      question: json["question"]??"",
      answer: json["answer"]??""

    );
  }
}