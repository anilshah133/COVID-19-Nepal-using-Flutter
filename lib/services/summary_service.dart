import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutterapp/models/summary_model.dart';

class SummaryService{

 //String tested_positive;

  Future<List> getSummaryData() async{
    Response response = await (get('https://nepalcorona.info/api/v1/data/nepal'));
    var data = jsonDecode(response.body);

    List<SummaryModel> summaryList =[];
    SummaryModel sumModel = SummaryModel(data['tested_positive'].toString(),
        data['tested_negative'].toString(),
      data['tested_total'].toString(),
      data['in_isolation'].toString(),
      data['quarantined'].toString(),
      data['tested_rdt'].toString(),
      data['recovered'].toString(),
      data['deaths'].toString(),
      data['updated_at'].toString()
    );
    summaryList.add(sumModel);
//    for(SummaryModel s in summaryList){
//      print("tested positive: "+s.tested_positive);
//    }

   return summaryList;
  }
}