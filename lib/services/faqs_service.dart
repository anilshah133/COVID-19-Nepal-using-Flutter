import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/faqs_model.dart';
import 'package:flutterapp/models/latest_update_model.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutterapp/models/summary_model.dart';

class FAQSService{
  List data;
  List<FAQSModel> faqslist =new List<FAQSModel>();

  Future<List> getFaqsData() async{
    Response response = await (get('https://nepalcorona.info/api/v1/faqs'));

    var extractDAta = jsonDecode(response.body);
    data=extractDAta['data'];


    for(int i=0;i<data.length;i++){
      print(data.length);
      print(i);
      FAQSModel faqsModel= new FAQSModel(
          data[i]['_id'].toString(),
          data[i]['question_np'].toString(),
          data[i]['answer_np'].toString()
      );
      try {
        print(faqsModel);
        faqslist.add(faqsModel);
      } on Exception catch(_){
        print(Exception);
      }

    }
    return faqslist;
  }
}