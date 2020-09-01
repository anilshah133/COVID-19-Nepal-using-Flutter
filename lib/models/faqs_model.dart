class FAQSModel{

  String _id;
  String _question_np;
  String _answer_np;

  FAQSModel(this._id, this._question_np, this._answer_np);

  String get answer_np => _answer_np;

  set answer_np(String value) {
    _answer_np = value;
  }

  String get question_np => _question_np;

  set question_np(String value) {
    _question_np = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  @override
  String toString() {
    return 'FAQSMOdel{_id: $_id, _question_np: $_question_np, _answer_np: $_answer_np}';
  }
}

//
//class FAQSModel{
//  final List<FAQSDetails> faqsdetails;
//  FAQSModel(
//      {this.faqsdetails}
//      );
//
//  factory FAQSModel.fromJson(Map<String, dynamic> json) {
//    return FAQSModel(
//
//      faqsdetails: parseFaqsdetails(json),
//    );
//  }
//  static  List<FAQSDetails> parseFaqsdetails(faqsdetailsJson) {
//    var list = faqsdetailsJson['data'] as List;
//    List<FAQSDetails> faqsdetailsList =
//    list.map((data) => FAQSDetails.fromJson(data)).toList();
//    return faqsdetailsList;
//  }
//}
//
//class FAQSDetails {
//  final String id;
//  final String question_np;
//  final String answer_np;
//
//  FAQSDetails(
//      {this.id, this.question_np, this.answer_np});
//
//  factory FAQSDetails.fromJson(Map<String, dynamic> json) {
//    return FAQSDetails(
//        id: json['_id'],
//        question_np: json['question_np'],
//        answer_np: json['answer_np']
//    );
//
//  }
//
//  @override
//  String toString() {
//    return 'FAQSDetails{id: $id, question_np: $question_np, answer_np: $answer_np}';
//  }
//}

