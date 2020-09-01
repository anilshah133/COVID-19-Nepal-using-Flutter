
class FAQS{
  final List<FAQSDetails> faqsdetails;
  FAQS(
         {this.faqsdetails}
      );

  factory FAQS.fromJson(Map<String, dynamic> json) {
    return FAQS(

      faqsdetails: parseFaqsdetails(json),
    );
  }
   static  List<FAQSDetails> parseFaqsdetails(faqsdetailsJson) {
      var list = faqsdetailsJson['data'] as List;
      List<FAQSDetails> faqsdetailsList =
      list.map((data) => FAQSDetails.fromJson(data)).toList();
      return faqsdetailsList;
    }
  }

class FAQSDetails {
  final String id;
  final String question_np;
  final int answer_np;

  FAQSDetails(
      {this.id, this.question_np, this.answer_np});

  factory FAQSDetails.fromJson(Map<String, dynamic> json) {
    return FAQSDetails(
        id: json['_id'],
        question_np: json['question_np'],
        answer_np: json['answer_np']
    );
  }


}