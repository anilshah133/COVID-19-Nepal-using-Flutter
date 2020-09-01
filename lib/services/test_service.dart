import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/faqs_model.dart';
import 'package:flutterapp/models/latest_update_model.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutterapp/models/summary_model.dart';

class TestService{
  List data;
  List<MyTile> faqslist =new List<MyTile>();

  Future<List> getFaqsData() async{
//    Response response = await (get('https://data.nepalcorona.info/api/v1/covid'));
//    var data = jsonDecode(response.body);
//    print('testing data json');
//    print(data[0]['id'].toString());



    Response response = await (get('https://data.nepalcorona.info/api/v1/covid'));

    var extractDAta = jsonDecode(response.body);
   // data=extractDAta['data'];
//print(extractDAta);
    print(extractDAta[0]['id'].toString());
    int temp=0;
    MyTile tilelist;
    for(int i=0;i<extractDAta.length;i++){
      if(temp!=extractDAta[i]['province']){
        print(temp=extractDAta[i]['province']);
        temp=extractDAta[i]['province'];
         tilelist= new MyTile(
          extractDAta[i]['province'].toString(),
        );
      }

      try {
       // print('tilelist');
       // print(tilelist);
        faqslist.add(tilelist);
      } on Exception catch(_){
        print(Exception);
      }

    }
    return faqslist.toSet().toList();
  }
}
class MyTile {
  String title;
  List<MyTile> children;
  MyTile(this.title, [this.children = const <MyTile>[]]);

  @override
  String toString() {
    return 'MyTile{title: $title, children: $children}';
  }
}